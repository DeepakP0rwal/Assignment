//
//  CommonUtils.h
//  Assignment
//
//  Created by Vikas Tak on 2/10/18.
//  Copyright © 2018 Deepak Mandwariya. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "SVProgressHUD.h"

@interface CommonUtils : NSObject
+(UIActivityIndicatorView*)showLoading:(UIViewController*)viewController;
+(void)dismissLoading:(UIActivityIndicatorView*)activityView;
+ (void)showAlert:(NSString *)title withDetailText:(NSString *)detailText cancelTitle:(NSString *)cancel;
@end
