//
//  WebService.h
//  Assignment
//
//  Created by Vikas Tak on 2/10/18.
//  Copyright © 2018 Deepak Mandwariya. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CommonUtils.h"
#import "Constant.h"
typedef void (^WebServiceCallCompletionHandler)(BOOL success, NSDictionary *result, NSString *message);

@interface WebService : NSObject<NSURLSessionDelegate>
+ (instancetype)sharedInstance;
-(void)getNewsList:(WebServiceCallCompletionHandler)handler;
@end
