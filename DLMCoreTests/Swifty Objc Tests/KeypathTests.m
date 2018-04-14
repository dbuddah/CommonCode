//
//  KeypathTests.m
//  DLMCoreTests
//
//  Created by Doug Mccoy on 4/11/18.
//  Copyright © 2018 doogilasovich. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "AutoVarLet.h"
#import "DVKeypaths.h"

@interface KeypathTests : XCTestCase

@end

@implementation KeypathTests

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
    
    let array = @[@"string", @"asdfasdf"];
    
    let arrayCountKeypath = DV_KEYPATH(array, count);    
    XCTAssertTrue([arrayCountKeypath isEqualToString:@"count"]);
    
    let descriptionLength = DV_KEYPATH(array, description.length);
    XCTAssertTrue([descriptionLength isEqualToString:@"description.length"]);
    
    // uncomment the next line to see compile time check of incorrect keypath (if DEBUG is defined)
    // Property 'count' not found on object of type 'id _Nullable'
    // let notARealKeypath = DV_KEYPATH(array, firstObject.count);

    

}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
