//
//  DictrSubEntryTitleView.h
//  Dictr
//
//  Created by Tong G. on 1/30/16.
//  Copyright © 2016 Tong Kuo. All rights reserved.
//

@import Cocoa;

// DictrSubEntryTitleView class
@interface DictrSubEntryTitleView : NSTextField <DictrSubEntryWrapper>
    {
@private
    DictrSubEntry __strong* __dicSubEntry;
    }

@end // DictrSubEntryTitleView class
