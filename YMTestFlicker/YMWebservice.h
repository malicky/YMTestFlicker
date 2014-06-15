//
//  YMWebservice
//  YMWebservice
//
//  Created by Malick Youla on 2014-03-09.
//  Copyright (c) 2014 Malick Youla. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^webServiceCompletionHandler) (NSArray *records);

@interface YMWebservice : NSObject
/**
 *
 *  @param url             api's url
 *  @param completionBlock completion block to be called
 */
- (void)fetchAtURL:(NSURL *)url withCompletionBlock:(webServiceCompletionHandler)completionBlock;

@end
