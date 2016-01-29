//
//  DictrResultsSplitViewController.h
//  Dictr
//
//  Created by Tong G. on 1/29/16.
//  Copyright © 2016 Tong Kuo. All rights reserved.
//

@import Cocoa;

@class DictrMoreRelatedViewController;
@class DictrSenseViewController;

// DictrResultsSplitViewController class
@interface DictrResultsSplitViewController : NSSplitViewController
    {
@private
    DictrMoreRelatedViewController __strong* __moreRelatedViewController;
    DictrSenseViewController __strong* __senseViewController;
    }

@end // DictrResultsSplitViewController class
