#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface YMPersistence : NSObject

+ (instancetype)sharedInstance;
- (instancetype)initWithStoreURL:(NSURL*)storeURL modelURL:(NSURL*)modelURL;
- (void)saveContexts;
@property (nonatomic, readonly) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, readonly) NSManagedObjectContext *backgroundManagedObjectContext;

@end
