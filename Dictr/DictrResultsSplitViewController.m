//
//  DictrResultsSplitViewController.m
//  Dictr
//
//  Created by Tong G. on 1/29/16.
//  Copyright © 2016 Tong Kuo. All rights reserved.
//

#import "DictrResultsSplitViewController.h"

#import "DictrMoreRelatedViewController.h"
#import "DictrSenseViewController.h"

// Private Interfaces
@interface DictrResultsSplitViewController ()

@end // Private Interfaces

// DictrResultsSplitViewController class
@implementation DictrResultsSplitViewController

#pragma mark - Initializations

- ( void ) viewDidLoad
    {
    self.splitView.vertical = YES;

    [ super viewDidLoad ];
    // Do view setup here.

    self->__moreRelatedViewController = [ [ DictrMoreRelatedViewController alloc ] initWithNibName: nil bundle: nil ];
    self->__senseViewController = [ [ DictrSenseViewController alloc ] initWithNibName: nil bundle: nil ];

    NSSplitViewItem* moreRelatedSplitViewItem = [ NSSplitViewItem splitViewItemWithViewController: self->__moreRelatedViewController ];
    NSSplitViewItem* senseSplitViewItem = [ NSSplitViewItem splitViewItemWithViewController: self->__senseViewController ];

    [ moreRelatedSplitViewItem setMaximumThickness: 250.f ];
    [ moreRelatedSplitViewItem setMinimumThickness: 250.f ];

    [ self addSplitViewItem: moreRelatedSplitViewItem ];
    [ self addSplitViewItem: senseSplitViewItem ];
    }

@end // DictrResultsSplitViewController classp
