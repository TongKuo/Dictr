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

@property ( assign, readonly ) DictrSenseBlockKind kind;

@end // DictrSenseBlock class
