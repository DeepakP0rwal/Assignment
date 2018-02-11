//
//  DetailViewController.h
//  Assignment
//
//  Created by Vikas Tak on 2/10/18.
//  Copyright © 2018 Deepak Mandwariya. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NavigationController.h"
#import "Result.h"
@interface DetailViewController : NavigationController
{
    
    __weak IBOutlet UIWebView *wvDescription;
}
@property(nonatomic,strong)NSURL *url;
@property(nonatomic,strong)NSString *mtitle;
@end
