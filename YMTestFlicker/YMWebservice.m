//
//  iTunesWebservice.m
//  iTunesWebservice
//
//  Created by Malick Youla on 2014-03-09.
//  Copyright (c) 2014 Malick Youla. All rights reserved.
//

#import "YMWebservice.h"

const unsigned int kPageRecordsCount = 10; //

@implementation YMWebservice {
}

// fetch the json from the webservice api
- (void)fetchAtURL:(NSURL *)url withCompletionBlock:(webServiceCompletionHandler)completionBlock {
   
    [[[NSURLSession sharedSession] dataTaskWithURL:url
                                 completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                                     if(error) {
                                         NSLog(@"error: %@", error.localizedDescription);
                                         completionBlock(nil);
                                         return ;
                                     }
                                     
                                     NSError *JSONError = nil;
                                    
                                     NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data
                                                                                                options:0
                                                                                                  error:&JSONError];
                                     if (JSONError)
                                     {
                                         NSLog(@"Serialization error: %@", JSONError.localizedDescription);
                                     }
                                     else
                                     {
                                         NSArray *imagesArray = [[dictionary objectForKey:@"photos"] objectForKey:@"photo"];
                                         if (imagesArray.count > 0 ) {
                                             if (completionBlock) {
                                                 completionBlock (imagesArray);
                                             }
                                         }
                                     }
                                     
      }] resume ];
}

@end
