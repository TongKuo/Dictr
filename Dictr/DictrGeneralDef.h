//
//  DictrGeneralDef.h
//  Dictr
//
//  Created by Tong G. on 1/7/16.
//  Copyright © 2016 Tong Kuo. All rights reserved.
//

#import "DictrSense.h"

@class DictrExample;

// DictrGeneralDef class
@interface DictrGeneralDef : DictrSense

@property ( strong, readonly ) NSString* definition;
@property ( strong, readonly ) NSString* translationOfDefinition;
@property ( strong, readonly ) NSString* languageOfTranslationOfDefinition;

@property ( strong, readonly ) NSString* label;

@property ( strong, readonly ) NSOrderedSet <__kindof DictrExample*>* examples;

@end // DictrGeneralDef class
