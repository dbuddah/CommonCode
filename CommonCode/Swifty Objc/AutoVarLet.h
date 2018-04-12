//
//  AutoVarLet.h
//  CommonCode
//
//  Created by Doug Mccoy on 4/11/18.
//  Copyright © 2018 doogilasovich. All rights reserved.
//


#ifndef AutoVarLet_h
#define AutoVarLet_h

// taken from https://pspdfkit.com/blog/2017/even-swiftier-objective-c/
#if defined(__cplusplus)
#define let auto const
#else
#define let const __auto_type
#endif

#if defined(__cplusplus)
#define var auto
#else
#define var __auto_type
#endif



#endif /* AutoVarLet_h */
