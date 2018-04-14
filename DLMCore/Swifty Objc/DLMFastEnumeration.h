//
//  DLMFastEnumeration.h
//  DLMCore
//
//  Created by Doug Mccoy on 4/11/18.
//  Copyright © 2018 doogilasovich. All rights reserved.
//

#ifndef DLMFastEnumeration_h
#define DLMFastEnumeration_h

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

@protocol DLMFastEnumeration <NSFastEnumeration>
- (id)dv_enumeratedType;
@end

// Usage: foreach (s, strings) { ... }
#define foreach(element, collection) for (typeof((collection).dv_enumeratedType) element in (collection))

@interface NSArray <ElementType> (DLMFastEnumeration)
<DLMFastEnumeration>

- (ElementType)dv_enumeratedType;

@end

@interface NSSet <ElementType> (DLMFastEnumeration)
<DLMFastEnumeration>

- (ElementType)dv_enumeratedType;

@end

@interface NSDictionary <KeyType, ValueType> (DLMFastEnumeration)
<DLMFastEnumeration>

- (KeyType)dv_enumeratedType;

@end

@interface NSOrderedSet <ElementType> (DLMFastEnumeration)
<DLMFastEnumeration>

- (ElementType)dv_enumeratedType;

@end

@interface NSPointerArray (DLMFastEnumeration) <DLMFastEnumeration>

- (void *)dv_enumeratedType;

@end

@interface NSHashTable <ElementType> (DLMFastEnumeration)
<DLMFastEnumeration>

- (ElementType)dv_enumeratedType;

@end

@interface NSMapTable <KeyType, ValueType> (DLMFastEnumeration)
<DLMFastEnumeration>

- (KeyType)dv_enumeratedType;

@end

@interface NSEnumerator <ElementType> (DLMFastEnumeration)
<DLMFastEnumeration>

- (ElementType)dv_enumeratedType;

@end

#endif /* DLMFastEnumeration_h */
