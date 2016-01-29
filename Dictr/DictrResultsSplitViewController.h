//
//  DictrResultsSplitViewController.h
//  Dictr
//
//  Created by Tong G. on 1/29/16.
//  Copyright © 2016 Tong Kuo. All rights reserved.
//

#import "DictrSplitViewController.h"

@class DictrMoreRelatedViewController;
@class DictrSenseViewController;

// DictrResultsSplitViewController class
@interface DictrResultsSplitViewController : DictrSplitViewController
    {
@private
    DictrMoreRelatedViewController __strong* __moreRelatedViewController;
    DictrSenseViewController __strong* __senseViewController;
    }

@end // DictrResultsSplitViewController class
