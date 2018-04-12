//
//  DVCircularBuffer.h
//  CommonCode
//
//  Created by Doug Mccoy on 4/11/18.
//  Copyright © 2018 doogilasovich. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DVCircularBuffer : NSObject


-(id)initWithCapacity:(NSUInteger)byteCapacity NS_DESIGNATED_INITIALIZER;

-(NSUInteger)writeBytes:(void const * const)bytes length:(NSUInteger)length;
-(NSUInteger)readBytes:(void * const)bytes length:(NSUInteger)length;
-(void)resetBuffer;

@property (atomic, readonly) NSUInteger availableBytes;


@end
