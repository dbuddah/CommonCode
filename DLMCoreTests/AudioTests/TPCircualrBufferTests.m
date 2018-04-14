//
//  TPCircualrBufferTests.m
//  DLMCoreTests
//
//  Created by Doug Mccoy on 4/11/18.
//  Copyright © 2018 doogilasovich. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "TPCircularBuffer.h"
#import "DLMAutoVarLet.h"

@interface TPCircualrBufferTests : XCTestCase

@end

@implementation TPCircualrBufferTests

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
    TPCircularBuffer buffer;
    TPCircularBufferInit(&buffer, 10);
    
    let input = "ABCDEFGHIJKL";
    TPCircularBufferProduceBytes(&buffer, input, 3);
    var availableBytes = 0u;
    let tail = TPCircularBufferTail(&buffer, &availableBytes);
    char output[30];
    memset(output, 0, 30);
    memcpy(output, tail, availableBytes);
    TPCircularBufferConsume(&buffer, availableBytes);
    let compare = strcmp(output, "ABC");
    XCTAssertEqual(compare, 0);
    
    
    
    
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
