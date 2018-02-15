//
//  DetailViewController.m
//  Assignment
//
//  Created by Vikas Tak on 2/10/18.
//  Copyright © 2018 Deepak Mandwariya. All rights reserved.
//

#import "DetailViewController.h"
#import "CommonUtils.h"
@interface DetailViewController ()<UIWebViewDelegate>
{
    BOOL _Authenticated;
    NSURLRequest* _FailedRequest;
    UIActivityIndicatorView *activityIdicator;
}
@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setUpView];
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    mTitleLabel.text = _mtitle;
}

#pragma setUpView
- (void)setUpView{
    //    titlestr = _titleName;
    //    [self SetupNevigationBar:YES];
     isBackShow = YES;
    [self setUpAndLoadWebView];
}
#pragma setUpAndLoadWebView
- (void)setUpAndLoadWebView{
    activityIdicator = [CommonUtils showLoading:self];
    NSURLRequest *nsrequest=[NSURLRequest requestWithURL:_url];
    wvDescription.delegate =self;
    [wvDescription loadRequest:nsrequest];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark- UIWebViewDelegate methods
-(BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request   navigationType:(UIWebViewNavigationType)navigationType {
    BOOL result = _Authenticated;
    if (!_Authenticated) {
        _FailedRequest = request;
        NSURLConnection *urlConnection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
        [urlConnection start];
    }
    return result;
}

#pragma NSURLConnectionDelegate

-(void)connection:(NSURLConnection *)connection willSendRequestForAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge {
    if ([challenge.protectionSpace.authenticationMethod isEqualToString:NSURLAuthenticationMethodServerTrust]) {
        
        if ([challenge.protectionSpace.host isEqualToString:_url.host]) {
            NSLog(@"trusting connection to host %@", challenge.protectionSpace.host);
            [challenge.sender useCredential:[NSURLCredential credentialForTrust:challenge.protectionSpace.serverTrust] forAuthenticationChallenge:challenge];
        } else
            NSLog(@"Not trusting connection to host %@", challenge.protectionSpace.host);
    }
    [challenge.sender continueWithoutCredentialForAuthenticationChallenge:challenge];
}

-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)pResponse {
    _Authenticated = YES;
    [connection cancel];
    [wvDescription loadRequest:_FailedRequest];
    [CommonUtils dismissLoading:activityIdicator];
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
