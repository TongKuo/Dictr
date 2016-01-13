//
//  DictrSenseBlock.h
//  Dictr
//
//  Created by Tong G. on 1/11/16.
//  Copyright © 2016 Tong Kuo. All rights reserved.
//

#import "DictrXMLObject.h"

typedef NS_ENUM( NSInteger, DictrSenseBlockKind )
    { DictrSenseBlockDefKind        = 0
    , DictrSenseBlockPhraseKind

    , DictrSenseBlockUnknownKind    = -1
    };

// DictrSenseBlock class
@interface DictrSenseBlock : DictrXMLObject

/** The kind of sense block
  */
@property ( assign, readonly ) DictrSenseBlockKind kind;

/** A string represeting the English Vocabulary Profile symbols A1-C2 show
    which words and phrases learners know at each level
  */
@property ( strong, readonly ) NSString* level;

/** The word that helps you find the right meaning when a word has more than one meaning 
  */
@property ( strong, readonly ) NSString* guideWord;

@end // DictrSenseBlock class
