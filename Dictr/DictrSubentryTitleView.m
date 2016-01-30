//
//  DictrSubentryTitleView.m
//  Dictr
//
//  Created by Tong G. on 1/30/16.
//  Copyright © 2016 Tong Kuo. All rights reserved.
//

#import "DictrSubentryTitleView.h"

// DictrSubentryTitleView class
@implementation DictrSubentryTitleView

#pragma mark - Initializations

- ( instancetype ) initWithDictrSubEntry: ( DictrSubEntry* )_DictrSubEntry
    {
    if ( self = [ self initWithFrame: NSZeroRect ] )
        [ self setDictSubEntry: _DictrSubEntry ];

    return self;
    }

- ( instancetype ) initWithFrame: ( NSRect )_FrameRect
    {
    if ( self = [ super initWithFrame: _FrameRect ] )
        {
        [ self configureForAutoLayout ];

        [ self setFont: [ NSFont fontWithName: @"Helvetica Neue Light" size: 30.f ] ];
        [ self setTextColor: [ NSColor colorWithHTMLColor: @"494848" ] ];

        [ self setBordered: NO ];
        [ self setEditable: NO ];
        [ self setDrawsBackground: NO ];
        [ self setBackgroundColor: [ NSColor clearColor ] ];
        }

    return self;
    }

#pragma mark - Dynamic Properties

- ( void ) setDictSubEntry: ( DictrSubEntry* )_DictSubEntry
    {
    self->__dicSubEntry = _DictSubEntry;

    [ self setStringValue: _DictSubEntry.title ];
    [ self sizeToFit ];
    }

- ( DictrSubEntry* ) dictSubEntry
    {
    return self->__dicSubEntry;
    }

@end // DictrSubentryTitleView class
