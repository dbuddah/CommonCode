//
//  DLMCircularBuffer.m
//  DLMCore
//
//  Created by Doug Mccoy on 4/11/18.
//  Copyright © 2018 doogilasovich. All rights reserved.
//

#import "DLMCircularBuffer.h"
#import "AutoVarLet.h"
#import "TPCircularBuffer.h"

@interface DLMCircularBuffer()
{
    TPCircularBuffer buffer;
}
@end

@implementation DLMCircularBuffer

-(instancetype)init
{
    NSAssert(nil, @"[DLMCircularBuffer init] is not to be used. Call [DLMCircularBuffer initWithCapacity:] instead");
    return [self initWithCapacity:0];
}

-(instancetype)initWithCapacity:(NSUInteger)requestedCapacity
{
    if (self = [super init])
    {
        if (requestedCapacity == 0) {
            return nil;
        }
        TPCircularBufferInit(&buffer, (uint32_t)requestedCapacity);
     
    }
    return self;
}

-(NSUInteger)write:(void const * const)bytes length:(NSUInteger)length
{
    var numAvailableBytes = 0u;
    TPCircularBufferHead(&buffer, &numAvailableBytes);
    numAvailableBytes = MIN(numAvailableBytes, (typeof(numAvailableBytes))length);
    TPCircularBufferProduceBytes(&buffer, bytes, numAvailableBytes);
    return numAvailableBytes;
}


-(NSUInteger)read:(void * const)bytes length:(NSUInteger)length
{
    var numAvailableBytes = 0u;
    let tail = TPCircularBufferTail(&buffer, &numAvailableBytes);
    numAvailableBytes = MIN(numAvailableBytes, (typeof(numAvailableBytes))length);
    memcpy(bytes, tail, numAvailableBytes);
    TPCircularBufferConsume(&buffer, numAvailableBytes);
    return numAvailableBytes;
}


-(void)reset
{
    TPCircularBufferClear(&buffer);
}

-(void)dealloc
{
    TPCircularBufferCleanup(&buffer);
}

-(NSUInteger)bytesAvailableToWrite
{
    var numAvailableBytes = 0u;
    TPCircularBufferHead(&buffer, &numAvailableBytes);
    return numAvailableBytes;
}

-(NSUInteger)bytesAvailableToRead
{
    var numAvailableBytes = 0u;
    TPCircularBufferTail(&buffer, &numAvailableBytes);
    return numAvailableBytes;
}


@end
