//
//  NavigationController.m
//  Assignment
//
//  Created by Vikas Tak on 2/10/18.
//  Copyright © 2018 Deepak Mandwariya. All rights reserved.
//

#import "NavigationController.h"
#import "Constant.h"
#import "SVProgressHUD.h"
@interface NavigationController ()
{
    NSString *TAG;
}
@end

@implementation NavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self navigationInitView];
}
- (void)navigationInitView{
    TAG = NSStringFromClass([NavigationController class]);
    [self createNavBar];
}
#pragma -mark isHomeIcon : Show back or Home Icon
- (UIBarButtonItem*)createNavigationLeftbar:(BOOL)isHomeIcon{
    UIView *bgView=[[UIView alloc] initWithFrame:CGRectMake(0, 0, self.navigationController.toolbar.frame.size.width/2 + 20, self.navigationController.toolbar.frame.size.height -10)];
    bgView.backgroundColor=[UIColor clearColor];
    UIImage *ivTopView ;
    if(isHomeIcon)
        ivTopView = IMG_BACK_ARROW;
    else
        ivTopView = IMG_TOP_MENU;
    
    
    UIImageView *backImgView=[[UIImageView alloc] initWithFrame:CGRectMake(0, 2, ivTopView.size.width, ivTopView.size.height)];
    backImgView.backgroundColor=[UIColor clearColor];
    backImgView.image = ivTopView;
    [bgView addSubview:backImgView];
    
    mTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(backImgView.frame.origin.x + backImgView.frame.size.width+10, 2, self.navigationController.toolbar.frame.size.width/2, 30)];
    mTitleLabel.font = [UIFont systemFontOfSize:16];
    mTitleLabel.textColor = [UIColor whiteColor];
    
    mTitleLabel.backgroundColor = [UIColor clearColor];
    [bgView addSubview:mTitleLabel];
    
    backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    backButton.frame= CGRectMake(bgView.frame.origin.x,
                                 bgView.frame.origin.y,
                                 bgView.frame.size.width,
                                 bgView.frame.size.height);
    backButton.backgroundColor=[UIColor clearColor];
    [bgView addSubview:backButton];
    if(isHomeIcon){
        [backButton addTarget:self action:@selector(backBtnPressed:) forControlEvents:UIControlEventTouchDown];
        
    }else{
        //[backButton addTarget:self action:@selector(showLeftView) forControlEvents:UIControlEventTouchDown];
        
    }
    UIBarButtonItem *leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:bgView];
    
    return leftBarButtonItem;
}
#pragma mark -
//-- Method for designing the navigaiton bar
-(void)createNavBar
{
    self.navigationController.navigationBar.translucent=NO;
    self.navigationController.navigationBarHidden=NO;
    self.navigationController.navigationBar.barTintColor = THEME_COLOUR;
    self.navigationController.navigationBar.tintColor = THEME_COLOUR;
    UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc]
                                       initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                       target:nil action:nil];
    negativeSpacer.width = -10;
    
    self.navigationItem.leftBarButtonItems = [NSArray
                                              arrayWithObjects:negativeSpacer, [self createNavigationLeftbar:isBackShow], nil];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)backBtnPressed:(id)sender
{
    if([SVProgressHUD isVisible]){
        [SVProgressHUD dismiss];
    }
    [self.navigationController popViewControllerAnimated:YES];
}
/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
