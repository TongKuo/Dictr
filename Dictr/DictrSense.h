//
//  DictrSense.h
//  Dictr
//
//  Created by Tong G. on 1/11/16.
//  Copyright © 2016 Tong Kuo. All rights reserved.
//

#import "DictrXMLObject.h"

typedef NS_ENUM( NSInteger, DictrSenseKind )
    { DictrSenseDefKind        = 0
    , DictrSensePhraseKind

    , DictrSenseUnknownKind    = -1
    };

// DictrSense class
@interface DictrSense : DictrXMLObject

/** The kind of sense block.
  */
@property ( assign, readonly ) DictrSenseKind kind;

/** A string represeting the English Vocabulary Profile symbols A1-C2 show
    which words and phrases learners know at each level.
  */
@property ( strong, readonly ) NSString* level;

/** The word that helps you find the right meaning when a word has more than one meaning .
  */
@property ( strong, readonly ) NSString* guideWord;

@end // DictrSense class
