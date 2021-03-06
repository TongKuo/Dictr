//
//  DictrSubEntryView.h
//  Dictr
//
//  Created by Tong G. on 1/30/16.
//  Copyright © 2016 Tong Kuo. All rights reserved.
//

@class DictrSubEntryTitleView;
@class DictrBadgeView;

// DictrSubEntryView class
@interface DictrSubEntryView : NSView <DictrSubEntryWrapper>
    {
@private
    NSMutableArray __strong* __cachedConstraints;

    DictrSubEntry __strong* __dicSubEntry;
    }

@property ( strong, readonly ) DictrSubEntryTitleView* subEntryTitleView;
@property ( strong, readonly ) DictrBadgeView* describesWordBadgeView;

@end // DictrSubEntryView class
