//
//  DVFastEnumeration.h
//  CommonCode
//
//  Created by Doug Mccoy on 4/11/18.
//  Copyright © 2018 doogilasovich. All rights reserved.
//

#ifndef DVFastEnumeration_h
#define DVFastEnumeration_h

// Taken from https://gist.github.com/steipete/7e3c69b985165dc23c5ec169b857ff42
//  PSPDFFastEnumeration.h
//  PSPDFFoundation
//
//  PSPDFKit is the leading cross-platform solution for integrating PDFs into your apps: https://pspdfkit.com.
//  Try it today using our free PDF Viewer app: https://pdfviewer.io/
//
//  This file is MIT licensed.

// Notes:
// Type safe at compile time

@protocol DVFastEnumeration <NSFastEnumeration>
- (id)dv_enumeratedType;
@end

// Usage: foreach (s, strings) { ... }
#define foreach(element, collection) for (typeof((collection).dv_enumeratedType) element in (collection))

@interface NSArray <ElementType> (DVFastEnumeration)
<DVFastEnumeration>

- (ElementType)dv_enumeratedType;

@end

@interface NSSet <ElementType> (DVFastEnumeration)
<DVFastEnumeration>

- (ElementType)dv_enumeratedType;

@end

@interface NSDictionary <KeyType, ValueType> (DVFastEnumeration)
<DVFastEnumeration>

- (KeyType)dv_enumeratedType;

@end

@interface NSOrderedSet <ElementType> (DVFastEnumeration)
<DVFastEnumeration>

- (ElementType)dv_enumeratedType;

@end

@interface NSPointerArray (DVFastEnumeration) <DVFastEnumeration>

- (void *)dv_enumeratedType;

@end

@interface NSHashTable <ElementType> (DVFastEnumeration)
<DVFastEnumeration>

- (ElementType)dv_enumeratedType;

@end

@interface NSMapTable <KeyType, ValueType> (DVFastEnumeration)
<DVFastEnumeration>

- (KeyType)dv_enumeratedType;

@end

@interface NSEnumerator <ElementType> (DVFastEnumeration)
<DVFastEnumeration>

- (ElementType)dv_enumeratedType;

@end

#endif /* DVFastEnumeration_h */
