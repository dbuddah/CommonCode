//
//  AutoVarLetTests.m
//  CommonCodeTests
//
//  Created by Doug Mccoy on 4/11/18.
//  Copyright © 2018 doogilasovich. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "AutoVarLet.h"

@interface AutoVarLetTests : XCTestCase

@end

@implementation AutoVarLetTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testAutoVarLet {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    
    // create a const NSString
    let constString = @"const string";
    XCTAssertTrue([constString isKindOfClass:[NSString class]]);
    XCTAssertTrue([constString isEqualToString:@"const string"]);
    
    // uncomment the next line to see compile error when reassigning const value
    // constString = @"other";
    
    // create a non-const NSString
    var nonConstString = @"non-const string";
    XCTAssertTrue([nonConstString isKindOfClass:[NSString class]]);
    XCTAssertEqual(nonConstString, @"non-const string");
    
    // No compile error when reassigning non-const value
     nonConstString = @"other";
    
    
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
