//
//  DictrSubentryBoardView.m
//  Dictr
//
//  Created by Tong G. on 1/30/16.
//  Copyright © 2016 Tong Kuo. All rights reserved.
//

#import "DictrSubentryBoardView.h"
#import "DictrSubentryTitleView.h"

// Private Interfaces
@interface DictrSubentryBoardView ()

@property ( strong, readwrite ) DictrSubentryTitleView* subEntryTitleView;

- ( void ) __relayout;

@end // Private Interfaces

// DictrSubentryBoardView class
@implementation DictrSubentryBoardView

#pragma mark - Initializations

- ( instancetype ) initWithDictrSubEntry: ( DictrSubEntry* )_DictrSubEntry
    {
    if ( self = [ super initWithFrame: NSZeroRect ] )
        {
        [ self setDictSubEntry: _DictrSubEntry ];

        self.subEntryTitleView = [ [ DictrSubentryTitleView alloc ] initWithDictrSubEntry: self.dictSubEntry ];

        [ self setSubviews: @[ self.subEntryTitleView ] ];
        }

    return self;
    }

#pragma mark - Drawing

- ( BOOL ) isFlipped
    {
    return YES;
    }

#pragma mark - Private Interfaces

- ( void ) __relayout
    {
    [ self.subEntryTitleView setFrameOrigin: NSMakePoint( 0, 0 ) ];
    }

#pragma mark - Dynamic Properties

- ( void ) setDictSubEntry: ( DictrSubEntry* )_DictSubEntry
    {
    self->__dicSubEntry = _DictSubEntry;

    self.subEntryTitleView.dictSubEntry = self.dictSubEntry;
    }

- ( DictrSubEntry* ) dictSubEntry
    {
    return self->__dicSubEntry;
    }

@end // DictrSubentryBoardView class
