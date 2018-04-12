//
//  CircularBufferTests.m
//  CommonCodeTests
//
//  Created by Doug Mccoy on 4/11/18.
//  Copyright © 2018 doogilasovich. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DVCircularBuffer.h"
#import "AutoVarLet.h"

@interface CircularBufferTests : XCTestCase

@end

@implementation CircularBufferTests

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

-(void)allocationTest
{
    let bufferFailed = [[DVCircularBuffer alloc] initWithCapacity:0];
    XCTAssertNil(bufferFailed);
    
    let bufferSuccess = [[DVCircularBuffer alloc] initWithCapacity:10];
    XCTAssertNotNil(bufferSuccess);
}





- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
