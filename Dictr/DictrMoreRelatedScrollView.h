//
//  DictrMoreRelatedScrollView.h
//  Dictr
//
//  Created by Tong G. on 1/28/16.
//  Copyright © 2016 Tong Kuo. All rights reserved.
//

@import Cocoa;

@class DictrMoreRelatedTableView;

// DictrMoreRelatedScrollView class
@interface DictrMoreRelatedScrollView : NSScrollView
    <NSTableViewDataSource, NSTableViewDelegate>
    {
@private
    NSMutableOrderedSet <__kindof NSDictionary*>* __results;
    }

@property ( weak ) IBOutlet DictrMoreRelatedTableView* moreRelatedTableView;

@end // DictrMoreRelatedScrollView class
