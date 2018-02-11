//
//	Result.h
//
//	Create by Vikas Tak on 10/2/2018
//	Copyright © 2018. All rights reserved.
//

//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

#import <UIKit/UIKit.h>
#import "Multimedia.h"

@interface Result : NSObject

@property (nonatomic, strong) NSString * abstractField;
@property (nonatomic, strong) NSString * byline;
@property (nonatomic, strong) NSString * createdDate;
@property (nonatomic, strong) NSArray * desFacet;
@property (nonatomic, strong) NSArray * geoFacet;
@property (nonatomic, strong) NSString * itemType;
@property (nonatomic, strong) NSString * kicker;
@property (nonatomic, strong) NSString * materialTypeFacet;
@property (nonatomic, strong) NSArray * multimedia;
@property (nonatomic, strong) NSArray * orgFacet;
@property (nonatomic, strong) NSArray * perFacet;
@property (nonatomic, strong) NSString * publishedDate;
@property (nonatomic, strong) NSString * section;
@property (nonatomic, strong) NSString * shortUrl;
@property (nonatomic, strong) NSString * subsection;
@property (nonatomic, strong) NSString * title;
@property (nonatomic, strong) NSString * updatedDate;
@property (nonatomic, strong) NSString * url;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;
@end