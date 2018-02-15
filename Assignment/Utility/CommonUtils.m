//
//  CommonUtils.m
//  Assignment
//
//  Created by Vikas Tak on 2/10/18.
//  Copyright © 2018 Deepak Mandwariya. All rights reserved.
//

#import "CommonUtils.h"

@implementation CommonUtils
+(UIActivityIndicatorView*)showLoading:(UIViewController*)viewController{
    UIActivityIndicatorView *activityView = [[UIActivityIndicatorView alloc]
                                             initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    
    activityView.center=viewController.view.center;
    [activityView setColor:[UIColor blackColor]];
    [activityView startAnimating];
    [viewController.view addSubview:activityView];
    return activityView;
}

+(void)dismissLoading:(UIActivityIndicatorView*)activityView{
    [activityView stopAnimating];
}

+(void)showAlert:(NSString *)title withDetailText:(NSString *)detailText cancelTitle:(NSString *)cancel{
    
    UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:title message:detailText delegate:nil cancelButtonTitle:cancel otherButtonTitles:nil, nil];
    [alertView show];
}
@end
