//
//	Multimedia.h
//
//	Create by Vikas Tak on 10/2/2018
//	Copyright © 2018. All rights reserved.
//

//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

#import <UIKit/UIKit.h>

@interface Multimedia : NSObject

@property (nonatomic, strong) NSString * caption;
@property (nonatomic, strong) NSString * copyright;
@property (nonatomic, strong) NSString * format;
@property (nonatomic, assign) NSInteger height;
@property (nonatomic, strong) NSString * subtype;
@property (nonatomic, strong) NSString * type;
@property (nonatomic, strong) NSString * url;
@property (nonatomic, assign) NSInteger width;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;
@end