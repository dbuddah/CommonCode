//
//  FastEnumerationTests.m
//  DLMCoreTests
//
//  Created by Doug Mccoy on 4/11/18.
//  Copyright © 2018 doogilasovich. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DVFastEnumeration.h"
#import "AutoVarLet.h"
@interface FastEnumerationTests : XCTestCase

@end

@implementation FastEnumerationTests

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
    
    let string1 = @"string1";
    let string2 = @"string2";
    let string3 = @"string3";
    let stringArray = @[string1, string2, string3];
    let concatString = [stringArray componentsJoinedByString:@""];
    
    var numElementsProcessed = 0;
    let concatResult = [NSMutableString new];
    foreach(string, stringArray) {
        numElementsProcessed++;
        [concatResult appendString:string];
    }
    XCTAssertTrue([concatString isEqualToString:concatResult]);
    XCTAssertTrue(numElementsProcessed == stringArray.count);
    
    let nonUniformArray = @[string1, @2];
    foreach(element, nonUniformArray){
        #pragma unused (element)
        // uncomment line to see compiler error that .uppercaseString not found on all objects in array
//        NSLog(@"element is %@", element.uppercaseString);
    }
    
    
    
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
