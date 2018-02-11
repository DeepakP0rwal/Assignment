//
//  CommonUtils.m
//  Assignment
//
//  Created by Vikas Tak on 2/10/18.
//  Copyright © 2018 Deepak Mandwariya. All rights reserved.
//

#import "CommonUtils.h"

@implementation CommonUtils
+(void)showLoading{
    [SVProgressHUD setDefaultStyle:SVProgressHUDStyleCustom];
    [SVProgressHUD setForegroundColor:[UIColor colorWithRed:233/255.0f green:27/255.0f blue:44/255.0f alpha:1.0f]];
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeBlack];
    [SVProgressHUD showWithStatus:@"Loading..."];
}

+(void)dismissLoading{
    [SVProgressHUD dismiss];
}

+(void)showAlert:(NSString *)title withDetailText:(NSString *)detailText cancelTitle:(NSString *)cancel{
    
    UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:title message:detailText delegate:nil cancelButtonTitle:cancel otherButtonTitles:nil, nil];
    [alertView show];
}
@end
