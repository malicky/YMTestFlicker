#import "_Photo.h"

@interface Photo : _Photo {}
- (void)fromDictionary:(NSDictionary *)dictionary;
+ (instancetype)insertNewIntoContext:(NSManagedObjectContext *)context;
+ (NSArray *)fetchPhotoWithIdentifier:(NSString *)id inContext:(NSManagedObjectContext *)context;
@end
