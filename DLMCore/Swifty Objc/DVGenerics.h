//
//  DVGenerics.h
//  DLMCore
//
//  Created by Doug Mccoy on 4/11/18.
//  Copyright © 2018 doogilasovich. All rights reserved.
//

#ifndef DVGenerics_h
#define DVGenerics_h

// taken from: https://gist.github.com/steipete/d6ba2d5a5cb939a2675ee20216fb45c8

//
//  PSPDFGenerics.h
//  PSPDFFoundation
//
//  PSPDFKit is the leading cross-platform solution for integrating PDFs into your apps: https://pspdfkit.com.
//  Try it today using our free PDF Viewer app: https://pdfviewer.io/
//
//  This file is MIT licensed.

/**
 This file overrides the NSObject declaration of copy with specialized ones that retain the generic type.
 This is pure compiler sugar and will create additional warnings for type mismatches.
 
 @note id-casted objects will create a warning when copy is called on them as there are multiple
 declarations available. Either cast to specific type or to NSObject to work around this.
 */
@interface NSArray <ElementType> (DVSafeCopy)

/// Same as `copy` but retains the generic type.
- (NSArray <ElementType> *)copy;

/// Same as `mutableCopy` but retains the generic type.
- (NSMutableArray <ElementType> *)mutableCopy;

@end

@interface NSSet <ElementType> (DVSafeCopy)

/// Same as `copy` but retains the generic type.
- (NSSet <ElementType> *)copy;

/// Same as `mutableCopy` but retains the generic type.
- (NSMutableSet <ElementType> *)mutableCopy;

@end

@interface NSDictionary <KeyType, ValueType> (DVSafeCopy)

/// Same as `copy` but retains the generic type.
- (NSDictionary <KeyType, ValueType> *)copy;

/// Same as `mutableCopy` but retains the generic type.
- (NSMutableDictionary <KeyType, ValueType> *)mutableCopy;

@end

@interface NSOrderedSet <ElementType> (DVSafeCopy)

/// Same as `copy` but retains the generic type.
- (NSOrderedSet <ElementType> *)copy;

/// Same as `mutableCopy` but retains the generic type.
- (NSMutableOrderedSet <ElementType> *)mutableCopy;

@end

@interface NSHashTable <ElementType> (DVSafeCopy)

/// Same as `copy` but retains the generic type.
- (NSHashTable <ElementType> *)copy;

@end

@interface NSMapTable <KeyType, ValueType> (DVSafeCopy)

/// Same as `copy` but retains the generic type.
- (NSMapTable <KeyType, ValueType> *)copy;

@end

#endif /* DVGenerics_h */
