//
//  DLMDeferTests.m
//  DLMCoreTests
//
//  Created by Doug Mccoy on 4/11/18.
//  Copyright © 2018 doogilasovich. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DLMAutoVarLet.h"
#import "DLMDefer.h"

@interface DLMDeferTests : XCTestCase

@end

@implementation DLMDeferTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}


-(void)manipulateString:(NSMutableString*)string{
    
    // defer block must be placed before the return statement
    dv_defer{
        // the defer block will be called when the enclosing block loses scope
        [string appendString:@"defer A-> "];
    };
    
    dv_defer{
        // the defer block will be called when the enclosing block loses scope
        [string appendString:@"defer B-> "];
    };
    
    {
        dv_defer{
            // the defer block will be called when the enclosing block loses scope
            [string appendString:@"defer C-> "];
        };
        

    }
    
    [string appendString:@"non-defer D->  "];
    
    return; //  return without executing the next line
    
    [string appendString:@"THIS STRING WILL NOT BE ADDED"];
    
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    
    // set up inital string
    let string = [NSMutableString stringWithString:@"initial string->  "];
    
    [self manipulateString:string];
    
    let expectedResult = @"initial string->  defer C-> non-defer D->  defer B-> defer A-> ";
    
    XCTAssertTrue([string isEqualToString:expectedResult]);


}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
