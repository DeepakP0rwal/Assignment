//
//	Result.m
//
//	Create by Vikas Tak on 10/2/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "Result.h"

NSString *const kResultAbstractField = @"abstract";
NSString *const kResultByline = @"byline";
NSString *const kResultCreatedDate = @"created_date";
NSString *const kResultDesFacet = @"des_facet";
NSString *const kResultGeoFacet = @"geo_facet";
NSString *const kResultItemType = @"item_type";
NSString *const kResultKicker = @"kicker";
NSString *const kResultMaterialTypeFacet = @"material_type_facet";
NSString *const kResultMultimedia = @"multimedia";
NSString *const kResultOrgFacet = @"org_facet";
NSString *const kResultPerFacet = @"per_facet";
NSString *const kResultPublishedDate = @"published_date";
NSString *const kResultSection = @"section";
NSString *const kResultShortUrl = @"short_url";
NSString *const kResultSubsection = @"subsection";
NSString *const kResultTitle = @"title";
NSString *const kResultUpdatedDate = @"updated_date";
NSString *const kResultUrl = @"url";

@interface Result ()
@end
@implementation Result




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kResultAbstractField] isKindOfClass:[NSNull class]]){
		self.abstractField = dictionary[kResultAbstractField];
	}	
	if(![dictionary[kResultByline] isKindOfClass:[NSNull class]]){
		self.byline = dictionary[kResultByline];
	}	
	if(![dictionary[kResultCreatedDate] isKindOfClass:[NSNull class]]){
		self.createdDate = dictionary[kResultCreatedDate];
	}	
	if(![dictionary[kResultDesFacet] isKindOfClass:[NSNull class]]){
		self.desFacet = dictionary[kResultDesFacet];
	}	
	if(![dictionary[kResultGeoFacet] isKindOfClass:[NSNull class]]){
		self.geoFacet = dictionary[kResultGeoFacet];
	}	
	if(![dictionary[kResultItemType] isKindOfClass:[NSNull class]]){
		self.itemType = dictionary[kResultItemType];
	}	
	if(![dictionary[kResultKicker] isKindOfClass:[NSNull class]]){
		self.kicker = dictionary[kResultKicker];
	}	
	if(![dictionary[kResultMaterialTypeFacet] isKindOfClass:[NSNull class]]){
		self.materialTypeFacet = dictionary[kResultMaterialTypeFacet];
	}	
	if(dictionary[kResultMultimedia] != nil && [dictionary[kResultMultimedia] isKindOfClass:[NSArray class]]){
		NSArray * multimediaDictionaries = dictionary[kResultMultimedia];
		NSMutableArray * multimediaItems = [NSMutableArray array];
		for(NSDictionary * multimediaDictionary in multimediaDictionaries){
			Multimedia * multimediaItem = [[Multimedia alloc] initWithDictionary:multimediaDictionary];
			[multimediaItems addObject:multimediaItem];
		}
		self.multimedia = multimediaItems;
	}
	if(![dictionary[kResultOrgFacet] isKindOfClass:[NSNull class]]){
		self.orgFacet = dictionary[kResultOrgFacet];
	}	
	if(![dictionary[kResultPerFacet] isKindOfClass:[NSNull class]]){
		self.perFacet = dictionary[kResultPerFacet];
	}	
	if(![dictionary[kResultPublishedDate] isKindOfClass:[NSNull class]]){
		self.publishedDate = dictionary[kResultPublishedDate];
	}	
	if(![dictionary[kResultSection] isKindOfClass:[NSNull class]]){
		self.section = dictionary[kResultSection];
	}	
	if(![dictionary[kResultShortUrl] isKindOfClass:[NSNull class]]){
		self.shortUrl = dictionary[kResultShortUrl];
	}	
	if(![dictionary[kResultSubsection] isKindOfClass:[NSNull class]]){
		self.subsection = dictionary[kResultSubsection];
	}	
	if(![dictionary[kResultTitle] isKindOfClass:[NSNull class]]){
		self.title = dictionary[kResultTitle];
	}	
	if(![dictionary[kResultUpdatedDate] isKindOfClass:[NSNull class]]){
		self.updatedDate = dictionary[kResultUpdatedDate];
	}	
	if(![dictionary[kResultUrl] isKindOfClass:[NSNull class]]){
		self.url = dictionary[kResultUrl];
	}	
	return self;
}
@end