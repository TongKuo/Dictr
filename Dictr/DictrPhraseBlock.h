//
//  DictrPhraseBlock.h
//  Dictr
//
//  Created by Tong G. on 1/7/16.
//  Copyright © 2016 Tong Kuo. All rights reserved.
//

#import "DictrSense.h"

@class DictrGeneralDef;

// DictrPhraseBlock class
@interface DictrPhraseBlock : DictrSense

@property ( strong, readonly ) NSAttributedString* title;
@property ( strong, readonly ) NSXMLNode* lab;
@property ( strong, readonly ) NSOrderedSet <__kindof DictrGeneralDef*>* defBlocks;

@end // DictrPhraseBlock class
