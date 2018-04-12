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

-(void)testAllocation
{
    let bufferFailed = [[DVCircularBuffer alloc] initWithCapacity:0];
    XCTAssertNil(bufferFailed);
    
    let capacity = 1000;
    let bufferSuccess = [[DVCircularBuffer alloc] initWithCapacity:capacity];
    XCTAssertEqual(bufferSuccess.bytesAvailableToRead, 0);
    XCTAssertNotNil(bufferSuccess);
    
}


-(void)testEmpty
{
    let capacity = 1000;
    let buffer = [[DVCircularBuffer alloc] initWithCapacity:capacity];
    XCTAssertNotNil(buffer);
    
    // try reading from empty buffer
    char text[30];
    let bytesRead = [buffer read:&text length:5];
    XCTAssertEqual(bytesRead, 0);
    
    let data = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890\n";
    {
        // write some bytes and check correctness
        let amount = 13;
        let bytesWritten = [buffer write:data length:amount];
        XCTAssertEqual(bytesWritten, amount);
        XCTAssertEqual(buffer.bytesAvailableToRead, amount);
    }
    
 }

-(void)testReadWrite
{
    let capacity = 1000;
    let buffer = [[DVCircularBuffer alloc] initWithCapacity:capacity];
    XCTAssertNotNil(buffer);
    
    let input = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890\n";
    let inputLength = strlen(input);
    {
        // write some bytes and check correctness
        let bytesWritten = [buffer write:input length:inputLength];
        XCTAssertEqual(bytesWritten, inputLength);
        XCTAssertEqual(buffer.bytesAvailableToRead, inputLength);
    }
    
    {
        let outputLength = inputLength + 1; // for null char
        char output[outputLength];
        let bytesRead = [buffer read:output length:inputLength];
        XCTAssertEqual(bytesRead, inputLength);
        XCTAssertEqual(strcmp(output, output), 0);

    }


}





- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
