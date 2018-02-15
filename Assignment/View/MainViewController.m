//
//  MainViewController.m
//  Assignment
//
//  Created by Vikas Tak on 2/10/18.
//  Copyright © 2018 Deepak Mandwariya. All rights reserved.
//

#import "MainViewController.h"
#import "WebService.h"
#import "InputValidations.h"
#import "Result.h"
#import "DetailViewController.h"
@interface MainViewController ()
{
    NSMutableArray *arrNews;
    UIActivityIndicatorView *activityIdicator;
}
@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpView];
    
    // Do any additional setup after loading the view.
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    mTitleLabel.text = kSCR_HOMENEWS;
}
-(void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    if([InputValidations objectValidation:arrNews]){
        [arrNews removeAllObjects];
        arrNews = nil;
    }
}
#pragma Initialize UI Component like TableView
- (void)setUpView{
    [self synchNewsList];
}

#pragma Sync News form server and load data into TableView
-(void)synchNewsList{
    activityIdicator = [CommonUtils showLoading:self];
    [[WebService sharedInstance]getNewsList:^(BOOL success, NSDictionary *result, NSString *message) {
        if (success) {
            if([InputValidations objectValidation:result]){
                NSInteger numofRecord = [[result objectForKey:kKEY_NUM_RESULTS] integerValue];
                if(numofRecord > 0 && [InputValidations arrayValidation:[result valueForKey:kKEY_RESULTS]]){
                    arrNews = [[NSMutableArray alloc] initWithCapacity:numofRecord];
                    NSArray *arrTempNews = [result objectForKey:kKEY_RESULTS];
                    for (NSDictionary *dict in arrTempNews) {
                        Result *resultObj = [[Result alloc]initWithDictionary:dict];
                        [arrNews addObject:resultObj];
                        
                    }
                    [tblView reloadData];
                    // Load Table View;
                }else{
                    // record Not found
                }
            }
        }
        [CommonUtils dismissLoading:activityIdicator];
    }];
}
#pragma TableView Delegate & DataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return (arrNews != nil && [arrNews count] >0)?[arrNews count]:0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    UIImageView *imgViewBanner = [cell viewWithTag:1];
    UILabel *lblTitle = [cell viewWithTag:2];
    UILabel *lblTitleType = [cell viewWithTag:3];
    UILabel *lblMore = [cell viewWithTag:4];
    Result *resultObj = [arrNews objectAtIndex:indexPath.row];
    lblTitle.text = resultObj.byline;
    lblTitleType.text = resultObj.itemType;
    lblMore.text = resultObj.section;
    NSArray *mediaArray =resultObj.multimedia;
    Multimedia *multiMediaObj = [mediaArray objectAtIndex:0];
    if([InputValidations objectValidation:multiMediaObj]){
        NSURL *url = [NSURL URLWithString:multiMediaObj.url];
        NSData *data = [NSData dataWithContentsOfURL:url];
        UIImage *img = [[UIImage alloc] initWithData:data];
        [imgViewBanner setImage:img];
        
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    Result *resultObj = [arrNews objectAtIndex:indexPath.row];
    [self performSegueWithIdentifier:kSTORYBOARD_DETAILVIEW_IDENTIFIER sender:resultObj];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    Result *resultObj = (Result*)sender;
    DetailViewController *detailVC = segue.destinationViewController;
    detailVC.mtitle = resultObj.itemType;
    detailVC.url = [NSURL URLWithString:resultObj.url];
    
}


@end
