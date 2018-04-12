//
//  DVCircularBuffer.m
//  CommonCode
//
//  Created by Doug Mccoy on 4/11/18.
//  Copyright © 2018 doogilasovich. All rights reserved.
//

#import "DVCircularBuffer.h"
#import "AutoVarLet.h"

@interface DVCircularBuffer()
{
    char *internalByteBuffer;
    NSUInteger capacity;
    char * readPointer;
    char * writePointer;
}
@end

@implementation DVCircularBuffer

-(id)initWithCapacity:(NSUInteger)byteCapacity
{
    if (self = [super init])
    {
        internalByteBuffer = malloc(byteCapacity);
        if (internalByteBuffer != nil){
            readPointer = internalByteBuffer;
            writePointer = internalByteBuffer;
            capacity = byteCapacity;
        }
        else
            self = nil;
        
    }
    return self;
}

-(NSUInteger)writeBytes:(void const * const)bytes length:(NSUInteger)length
{
    var numBytesToWrite = length;
    
    let availableBytes = [self availableBytes];
    
    if (numBytesToWrite > availableBytes) numBytesToWrite = availableBytes;
    
    
    
    let endOfBuffer = internalByteBuffer + capacity;
    
    let bytesToEnd = [self writeAheadOfRead] ? endOfBuffer - writePointer : 0;
    
    return numBytesToWrite;
}


-(NSUInteger)readBytes:(void * const)bytes length:(NSUInteger)length
{
    NSUInteger numBytesRead = 0;
    
    return numBytesRead;
}


-(void)resetBuffer
{
    
}

-(NSUInteger)availableBytes
{
    NSUInteger availableBytes = 0;
    if (self.writeAheadOfRead)
    {
        availableBytes = writePointer - readPointer;
    }
    else
    {
        availableBytes = capacity - (readPointer - writePointer);
    }
    return availableBytes;
}
        
-(BOOL)writeAheadOfRead
{
    return writePointer >= readPointer;
}


@end
