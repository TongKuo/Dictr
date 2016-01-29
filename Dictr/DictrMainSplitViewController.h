//
//  DictrMainSplitViewController.h
//  Dictr
//
//  Created by Tong G. on 1/29/16.
//  Copyright © 2016 Tong Kuo. All rights reserved.
//

#import "DictrSplitViewController.h"

@class DictrSearchFieldController;
@class DictrResultsSplitViewController;

// DictrMainSplitViewController class
@interface DictrMainSplitViewController : DictrSplitViewController
    {
@private
    DictrSearchFieldController __strong* __searchFieldController;
    DictrResultsSplitViewController __strong* __resultSplitViewController;
    }

@end // DictrMainSplitViewController class
