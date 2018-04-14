//
//  DLMCircularBuffer.h
//  DLMCore
//
//  Created by Doug Mccoy on 4/11/18.
//  Copyright © 2018 doogilasovich. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DLMCircularBuffer : NSObject


-(id)initWithCapacity:(NSUInteger)byteCapacity NS_DESIGNATED_INITIALIZER;

-(NSUInteger)write:(void const * const)bytes length:(NSUInteger)length;
-(NSUInteger)read:(void * const)bytes length:(NSUInteger)length;
-(void)reset;

@property (atomic, readonly) NSUInteger bytesAvailableToRead;
@property (atomic, readonly) NSUInteger bytesAvailableToWrite;


@end
