//
//  DictrMoreRelatedScrollView.h
//  Dictr
//
//  Created by Tong G. on 1/28/16.
//  Copyright © 2016 Tong Kuo. All rights reserved.
//

@import Cocoa;

// DictrMoreRelatedScrollView class
@interface DictrMoreRelatedScrollView : NSScrollView
    <NSTableViewDataSource, NSTableViewDelegate>
    {
@private
    NSMutableOrderedSet <__kindof NSDictionary*>* __results;
    }

@end // DictrMoreRelatedScrollView class
