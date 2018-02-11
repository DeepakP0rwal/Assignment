//
//	NewsFeed.m
//
//	Create by Vikas Tak on 10/2/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "NewsFeed.h"

NSString *const kNewsFeedResults = @"results";

@interface NewsFeed ()
@end
@implementation NewsFeed




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(dictionary[kNewsFeedResults] != nil && [dictionary[kNewsFeedResults] isKindOfClass:[NSArray class]]){
		NSArray * resultsDictionaries = dictionary[kNewsFeedResults];
		NSMutableArray * resultsItems = [NSMutableArray array];
		for(NSDictionary * resultsDictionary in resultsDictionaries){
			Result * resultsItem = [[Result alloc] initWithDictionary:resultsDictionary];
			[resultsItems addObject:resultsItem];
		}
		self.results = resultsItems;
	}
	return self;
}
@end