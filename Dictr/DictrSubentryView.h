//
//  DictrSubentryView.h
//  Dictr
//
//  Created by Tong G. on 1/30/16.
//  Copyright © 2016 Tong Kuo. All rights reserved.
//

@class DictrSubentryTitleView;
@class DictrBadgeView;

// DictrSubentryView class
@interface DictrSubentryView : NSView <DictrSubEntryWrapper>
    {
@private
    NSMutableArray __strong* __cachedConstraints;

    DictrSubEntry __strong* __dicSubEntry;
    }

@property ( strong, readonly ) DictrSubentryTitleView* subEntryTitleView;
@property ( strong, readonly ) DictrBadgeView* describesWordBadgeView;

@end // DictrSubentryView class
