//
//	NewsFeed.h
//
//	Create by Vikas Tak on 10/2/2018
//	Copyright © 2018. All rights reserved.
//

//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

#import <UIKit/UIKit.h>
#import "Result.h"

@interface NewsFeed : NSObject

@property (nonatomic, strong) NSArray * results;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;
@end