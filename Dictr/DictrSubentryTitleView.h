//
//  DictrSubentryTitleView.h
//  Dictr
//
//  Created by Tong G. on 1/30/16.
//  Copyright © 2016 Tong Kuo. All rights reserved.
//

@import Cocoa;

// DictrSubentryTitleView class
@interface DictrSubentryTitleView : NSTextField <DictrSubEntryWrapper>
    {
@private
    DictrSubEntry __strong* __dicSubEntry;
    }

@end // DictrSubentryTitleView class
