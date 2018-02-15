//
//  WebService.m
//  Assignment
//
//  Created by Vikas Tak on 2/10/18.
//  Copyright © 2018 Deepak Mandwariya. All rights reserved.
//

#import "WebService.h"
#import "NSURLRequest+DictionaryPost.h"
#import "APIUtils.h"
@interface WebService ()

@end
@implementation WebService

+ (instancetype)sharedInstance {
    static WebService *sharedMyManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMyManager = [[self alloc] init];
    });
    return sharedMyManager;
}

- (id)init {
    self = [super init];
    return self;
}

- (void)callURL:(NSURL *)url withParams:(NSString *)apiKey completionHandler:(WebServiceCallCompletionHandler)handler {
    NSURLRequest *request = [NSURLRequest postRequestWithURL:url parameters:apiKey];

    NSURLSessionConfiguration *sessionConfig = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:sessionConfig delegate:self delegateQueue:nil];
    
    
    [[session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error){
        
        if (error) {
            dispatch_async(dispatch_get_main_queue(), ^{
                handler (FALSE, nil,@"");
            });
        } else {
            NSError *JSONError;
            NSDictionary *result = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&JSONError];
            
            if (JSONError) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    handler (FALSE, nil,@"");
                });
            } else {
                NSInteger responseCode = 200;
                
                if(responseCode >= 200) {
                    dispatch_async(dispatch_get_main_queue(), ^{
                       
                        handler(TRUE, result,nil);
                    });
                } else {
                    dispatch_async(dispatch_get_main_queue(), ^{
                        [CommonUtils showAlert:kAlertTitle withDetailText:@"Service temporary unavailable" cancelTitle:kAlertTitleOk];
                        handler (FALSE, result,nil);
                    });
                }
            }
        }
    }]resume];
}

-(void)getNewsList:(WebServiceCallCompletionHandler)handler{
    
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@", kBASEURL, kHOME_API]];
    [self callURL:url withParams:kAPI_KEY completionHandler:handler];
}
@end
