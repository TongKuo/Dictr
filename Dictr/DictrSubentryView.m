//
//  DictrSubEntryView.m
//  Dictr
//
//  Created by Tong G. on 1/30/16.
//  Copyright © 2016 Tong Kuo. All rights reserved.
//

#import "DictrSubEntryView.h"
#import "DictrSubentryTitleView.h"
#import "DictrBadgeView.h"

// Private Interfaces
@interface DictrSubEntryView ()

@property ( strong, readwrite ) DictrSubentryTitleView* subEntryTitleView;
@property ( strong, readwrite ) DictrBadgeView* describesWordBadgeView;

@end // Private Interfaces

// DictrSubEntryView class
@implementation DictrSubEntryView

#pragma mark - Initializations

- ( instancetype ) initWithDictrSubEntry: ( DictrSubEntry* )_DictrSubEntry
    {
    if ( self = [ super initWithFrame: NSZeroRect ] )
        {
        [ self configureForAutoLayout ];
        __cachedConstraints = [ NSMutableArray array ];

        [ self setDictSubEntry: _DictrSubEntry ];

        self.subEntryTitleView = [ [ DictrSubentryTitleView alloc ] initWithDictrSubEntry: self.dictSubEntry ];
        self.describesWordBadgeView = [ [ DictrBadgeView alloc ] initWithText: _DictrSubEntry.pos
                                                                  controlSize: NSRegularControlSize ];
        [ self setSubviews: @[ self.subEntryTitleView
                             , self.describesWordBadgeView ] ];
        }

    return self;
    }

#pragma mark - Drawing

- ( BOOL ) isFlipped
    {
    return YES;
    }

#pragma mark - Auto Layout

#define kTopAndBottomInset 10
#define kLeadingAndTrailingInset 20

- ( void ) layout
    {
    [ self removeConstraints: __cachedConstraints ];
    [ __cachedConstraints removeAllObjects ];

    [ __cachedConstraints addObject:
        [ self.subEntryTitleView autoPinEdgeToSuperviewEdge: ALEdgeTop withInset: kTopAndBottomInset ] ];
    [ __cachedConstraints addObject:
        [ self.subEntryTitleView autoPinEdgeToSuperviewEdge: ALEdgeLeading withInset: kLeadingAndTrailingInset ] ];

    [ __cachedConstraints addObject:
        [ self.describesWordBadgeView autoPinEdgeToSuperviewEdge: ALEdgeTop withInset: 22.f ] ];
    [ __cachedConstraints addObject:
        [ self.describesWordBadgeView autoPinEdgeToSuperviewEdge: ALEdgeTrailing withInset: kLeadingAndTrailingInset relation: NSLayoutRelationGreaterThanOrEqual ] ];
    [ __cachedConstraints addObject:
        [ self.describesWordBadgeView autoPinEdge: ALEdgeLeading toEdge: ALEdgeTrailing ofView: self.subEntryTitleView withOffset: 8.f ] ];

    [ super layout ];
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

@end // DictrSubEntryView class
