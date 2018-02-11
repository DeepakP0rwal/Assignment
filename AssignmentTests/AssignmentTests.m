//
//  AssignmentTests.m
//  AssignmentTests
//
//  Created by Vikas Tak on 2/10/18.
//  Copyright © 2018 Deepak Mandwariya. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "WebService.h"
#import "InputValidations.h"
@interface AssignmentTests : XCTestCase

@end

@implementation AssignmentTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}
- (void)testServerNewsData{
     //XCTestExpectation *expectation = [self expectationWithDescription:@"asynchronous request"];
    [[WebService sharedInstance]getNewsList:^(BOOL success, NSDictionary *result, NSString *message) {
        if (success) {
            if([InputValidations objectValidation:result]){
                NSInteger numofRecord = [[result objectForKey:kKEY_NUM_RESULTS] integerValue];
                if(numofRecord > 0 && [InputValidations arrayValidation:[result valueForKey:kKEY_RESULTS]]){
                }
            }else{
                // record Not found
            }
            
            XCTAssert(result, @"data nil");
            // when all done, Fulfill the expectation
            
            //[expectation fulfill];
        }
    }];
    //[self waitForExpectationsWithTimeout:10.0 handler:nil];
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
