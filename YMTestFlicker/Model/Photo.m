#import "Photo.h"

#define debug 1

@interface Photo ()

// Private interface goes here.

@end


@implementation Photo

- (void)fromDictionary:(NSDictionary *)dictionary {
    
    if (debug == 1) {
        NSLog(@"loadDictionary: %@", dictionary);
    }
    self.id = dictionary[@"id"];
    self.title = dictionary[@"title"];
    self.desc = dictionary[@"desc"];
    self.owner = dictionary[@"owner"];
    self.secret = dictionary[@"secret"];
    self.server = dictionary[@"server"];
    self.farm = dictionary[@"farm"];
    [self setPrimitiveIsfamily:dictionary[@"isfamily"]];
    [self setPrimitiveIsfriend:dictionary[@"isfriend"]];
    [self setPrimitiveIspublic:dictionary[@"ispublic"]];
                 
}

+ (instancetype)insertNewIntoContext:(NSManagedObjectContext *)context {
    return [NSEntityDescription insertNewObjectForEntityForName:[self entityName] inManagedObjectContext:context];
}

+ (id)entityName {
    return NSStringFromClass(self);
}

+ (NSArray *)fetchPhotoWithIdentifier:(NSString *)id inContext:(NSManagedObjectContext *)context {
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:[self entityName]];
    fetchRequest.predicate = [NSPredicate predicateWithFormat:@"id = %@", id];
    fetchRequest.fetchLimit = 1; // only one is enough
    NSError *error = nil;
    NSArray *result = [context executeFetchRequest:fetchRequest error:&error];
    if (error) {
        NSLog(@"error: %@", error.localizedDescription);
    }
    return  result;
}
@end
