//
//  DLMKeypaths.h
//  DLMCore
//
//  Created by Doug Mccoy on 4/11/18.
//  Copyright © 2018 doogilasovich. All rights reserved.
//


// taken from: https://pspdfkit.com/blog/2017/even-swiftier-objective-c/

#ifndef DLMKeypaths_h
#define DLMKeypaths_h

#if DEBUG
#define DLM_KEYPATH(object, property) ((void)(NO && ((void)object.property, NO)), @ #property)
#else
#define DLM_KEYPATH(object, property) @ #property
#endif

#endif /* DLMKeypaths_h */
