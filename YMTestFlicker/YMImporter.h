
#import <Foundation/Foundation.h>

@class YMWebservice, YMPersistence;

@interface YMImporter : NSObject

/**
 *  Initialize the importer with the context to save in and the webservice to request
 */
- (id)initWithParentContext:(NSManagedObjectContext *)context
                 webservice:(YMWebservice *)webservice;
- (void)import;

@end
