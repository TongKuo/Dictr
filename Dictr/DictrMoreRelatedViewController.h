//
//  DictrMoreRelatedViewController.h
//  Dictr
//
//  Created by Tong G. on 1/29/16.
//  Copyright © 2016 Tong Kuo. All rights reserved.
//

@class DictrMoreRelatedTableView;

// DictrMoreRelatedViewController class
@interface DictrMoreRelatedViewController : NSViewController
    <NSTableViewDataSource, NSTableViewDelegate>
    {
@private
    NSMutableOrderedSet <__kindof NSDictionary*>* __results;
    }

@property ( weak ) IBOutlet DictrMoreRelatedTableView* moreRelatedTableView;

@end // DictrMoreRelatedViewController class
