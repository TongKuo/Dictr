//
//  DictrMainContentViewController.h
//  Dictr
//
//  Created by Tong G. on 1/5/16.
//  Copyright © 2016 Tong Kuo. All rights reserved.
//

@import Cocoa;

@class DictrMainSplitViewController;

// DictrMainContentViewController class
@interface DictrMainContentViewController : NSViewController

#pragma mark - Outlets

@property ( weak ) IBOutlet DictrMainSplitViewController* mainSplitViewController;

@end // DictrMainContentViewController class

