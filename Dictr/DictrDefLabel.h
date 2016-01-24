//
//  DictrDefLabel.h
//  Dictr
//
//  Created by Tong G. on 1/23/16.
//  Copyright © 2016 Tong Kuo. All rights reserved.
//

#import "DictrXMLObject.h"

// DictrDefLabel class
@interface DictrDefLabel : DictrXMLObject

@property ( strong, readonly ) NSArray <__kindof NSString*>* names;
@property ( strong, readonly ) NSArray <__kindof NSString*>* briefDescriptions;

@property ( strong, readonly ) NSString* representation;

@end // DictrDefLabel class
