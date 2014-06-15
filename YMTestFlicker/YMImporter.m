//
//  MYImporter.m
//  iTunesWebservice
//
//  Created by Malick Youla on 2014-03-09.
//  Copyright (c) 2014 Malick Youla. All rights reserved.
//

#import "YMImporter.h"
#import "YMWebservice.h"
#import "YMPersistence.h"
#import "YMAppDelegate.h"
#import "Photo.h"


#define debug 1


NSString * K_API_KEY = @"8b1fa315171a4e6a93d98d087b408b6a";

/**
 *  The maximim number of songs to download
 */
const int kMaxSongs = 400;

/**
 *  When importing, the id is used prevent importing a song imported
 */
NSString *kUniqueIdforImport = @"id";


@interface YMImporter ()

@property (nonatomic, strong) NSManagedObjectContext *contextParent;
@property (nonatomic, strong) NSManagedObjectContext *context;
@property (nonatomic,strong) YMWebservice *webservice;

@end

@implementation YMImporter

- (id)initWithParentContext:(NSManagedObjectContext *)context
                 webservice:(YMWebservice *)webservice {
    self = [super init];
    if (!self) {
        return nil;
    }
    // The import moc is local
    self.context = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSPrivateQueueConcurrencyType];
    
    // the parent context is the main context
    [self.context setParentContext:context];
    self.contextParent = context;
    
    self.webservice = webservice;
    
    return self;
}

/**
 *  Before saving into coredata, check that the image was not previously imported (comparing id).
 */
- (void)import {
    NSString *urlString = [NSString stringWithFormat:@"https://api.flickr.com/services/rest/?"
                           "method=flickr.interestingness.getList"
                           "&api_key=%@&extras=description&tags=&per_page=%d&format=json&nojsoncallback=1", K_API_KEY, 500];
    
    NSURL *url = [NSURL URLWithString:urlString];
    
    [self.webservice fetchAtURL:url withCompletionBlock:^(NSArray *records) {
        [self.context performBlock:^{
            for (NSDictionary *record in records) {
                NSString *identifier = record[kUniqueIdforImport];
                [[self contextParent] performBlock:^{ //TODO
                    Photo *photo = nil;
                    NSArray *photos = [Photo fetchPhotoWithIdentifier:identifier inContext:[self contextParent]];
                    if (photos.lastObject) { // already imported in database
                        if (debug == 1) {
                            photo = photos.lastObject;
                            NSLog(@"Already existing song: id = %@, title = %@", photo.id, photo.title);
                        }
                    } else { // create a new core data entity photo
                        photo = [Photo insertNewIntoContext:[self contextParent]];
                        photo.id = identifier;
                        [photo fromDictionary:record];
                    }
                }];
            }
            [self saveInParentContext];
        }];
    }];
}

/**
 *  Push the imported photos in the parent context (main context).
 */
- (void)saveInParentContext {
    [self.contextParent performBlock:^{
        if ([self.contextParent hasChanges]) {
            NSError *error = nil;
            [self.contextParent save:&error];
            if (error) {
                NSLog(@"Error: %@", error.localizedDescription);
                return;
            }
        }
    }];
}

@end
