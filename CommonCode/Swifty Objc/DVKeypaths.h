//
//  DVKeypaths.h
//  CommonCode
//
//  Created by Doug Mccoy on 4/11/18.
//  Copyright © 2018 doogilasovich. All rights reserved.
//


// taken from: https://pspdfkit.com/blog/2017/even-swiftier-objective-c/

#ifndef DVKeypaths_h
#define DVKeypaths_h

#if DEBUG
#define DV_KEYPATH(object, property) ((void)(NO && ((void)object.property, NO)), @ #property)
#else
#define DV_KEYPATH(object, property) @ #property
#endif

#endif /* DVKeypaths_h */
