//
//  DictrDefBlock.h
//  Dictr
//
//  Created by Tong G. on 1/7/16.
//  Copyright © 2016 Tong Kuo. All rights reserved.
//

#import "DictrSense.h"

@class DictrExample;

// DictrDefBlock class
@interface DictrDefBlock : DictrSense

@property ( strong, readonly ) NSString* definition;

@property ( strong, readonly ) NSOrderedSet <__kindof DictrExample*>* examples;

@end // DictrDefBlock class
