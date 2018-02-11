//
//	Multimedia.m
//
//	Create by Vikas Tak on 10/2/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "Multimedia.h"

NSString *const kMultimediaCaption = @"caption";
NSString *const kMultimediaCopyright = @"copyright";
NSString *const kMultimediaFormat = @"format";
NSString *const kMultimediaHeight = @"height";
NSString *const kMultimediaSubtype = @"subtype";
NSString *const kMultimediaType = @"type";
NSString *const kMultimediaUrl = @"url";
NSString *const kMultimediaWidth = @"width";

@interface Multimedia ()
@end
@implementation Multimedia




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kMultimediaCaption] isKindOfClass:[NSNull class]]){
		self.caption = dictionary[kMultimediaCaption];
	}	
	if(![dictionary[kMultimediaCopyright] isKindOfClass:[NSNull class]]){
		self.copyright = dictionary[kMultimediaCopyright];
	}	
	if(![dictionary[kMultimediaFormat] isKindOfClass:[NSNull class]]){
		self.format = dictionary[kMultimediaFormat];
	}	
	if(![dictionary[kMultimediaHeight] isKindOfClass:[NSNull class]]){
		self.height = [dictionary[kMultimediaHeight] integerValue];
	}

	if(![dictionary[kMultimediaSubtype] isKindOfClass:[NSNull class]]){
		self.subtype = dictionary[kMultimediaSubtype];
	}	
	if(![dictionary[kMultimediaType] isKindOfClass:[NSNull class]]){
		self.type = dictionary[kMultimediaType];
	}	
	if(![dictionary[kMultimediaUrl] isKindOfClass:[NSNull class]]){
		self.url = dictionary[kMultimediaUrl];
	}	
	if(![dictionary[kMultimediaWidth] isKindOfClass:[NSNull class]]){
		self.width = [dictionary[kMultimediaWidth] integerValue];
	}

	return self;
}
@end