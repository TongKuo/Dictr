//
//  DictrSenseBlock.m
//  Dictr
//
//  Created by Tong G. on 1/11/16.
//  Copyright © 2016 Tong Kuo. All rights reserved.
//

#import "DictrSenseBlock.h"

// DictrSenseBlock class
@implementation DictrSenseBlock

#pragma mark - Dynamic Properties

@dynamic kind;

- ( DictrSenseBlockKind ) kind
    {
    DictrSenseBlockKind kind = DictrSenseBlockUnknownKind;

    if ( self->__xmlNode )
        {
        if ( [ self->__xmlNode.name isEqualToString: @"def-block" ] )
            kind = DictrSenseBlockDefKind;

        else if ( [ self->__xmlNode.name isEqualToString: @"phrase-block" ] )
            kind = DictrSenseBlockPhraseKind;
        }

    return kind;
    }

@end // DictrSenseBlock class
