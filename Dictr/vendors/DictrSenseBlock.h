//
//  DictrSenseBlock.h
//  Dictr
//
//  Created by Tong G. on 1/14/16.
//  Copyright © 2016 Tong Kuo. All rights reserved.
//

#import "DictrXMLObject.h"

// DictrSenseBlock class
@interface DictrSenseBlock : DictrXMLObject

/** The word that helps you find the right meaning when a word has more than one meaning .
  */
@property ( strong, readonly ) NSString* guideWord;

/** An set of senses
  */
@property ( strong, readonly ) NSOrderedSet <__kindof DictrSense*>* senses;

@end // DictrSenseBlock class
