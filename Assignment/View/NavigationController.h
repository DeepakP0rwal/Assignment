//
//  NavigationController.h
//  Assignment
//
//  Created by Vikas Tak on 2/10/18.
//  Copyright © 2018 Deepak Mandwariya. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NavigationController : UIViewController
{
    NSString *mTitleText;
    UIButton *backButton;
    UILabel *mTitleLabel;
    BOOL isBackShow;
}
-(void)backBtnPressed:(id)sender;
- (UIBarButtonItem*)createNavigationLeftbar:(BOOL)isHomeIcon;
@end
