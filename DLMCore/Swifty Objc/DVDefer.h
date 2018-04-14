//
//  DVDefer.h
//  DLMCore
//
//  Created by Doug Mccoy on 4/11/18.
//  Copyright © 2018 doogilasovich. All rights reserved.
//

#ifndef DVDefer_h
#define DVDefer_h

// taken from: https://pspdfkit.com/blog/2017/even-swiftier-objective-c/

// Similar to defer in Swift
#define dv_defer_block_name_with_prefix(prefix, suffix) prefix ## suffix
#define dv_defer_block_name(suffix) dv_defer_block_name_with_prefix(dv_defer_, suffix)
#define dv_defer __strong void(^dv_defer_block_name(__LINE__))(void) __attribute__((cleanup(dv_defer_cleanup_block), unused)) = ^
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wunused-function"
static void dv_defer_cleanup_block(__strong void(^*block)(void)) {
    (*block)();
}
#pragma clang diagnostic pop

#endif /* DVDefer_h */
