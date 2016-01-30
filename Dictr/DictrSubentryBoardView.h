//
//  DictrSubentryBoardView.h
//  Dictr
//
//  Created by Tong G. on 1/30/16.
//  Copyright © 2016 Tong Kuo. All rights reserved.
//

@class DictrSubentryTitleView;

// DictrSubentryBoardView class
@interface DictrSubentryBoardView : NSView <DictrSubEntryWrapper>
    {
@private
    DictrSubEntry __strong* __dicSubEntry;
    }

@property ( strong, readonly ) DictrSubentryTitleView* subEntryTitleView;

@end // DictrSubentryBoardView class
