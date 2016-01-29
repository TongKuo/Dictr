//
//  DictrMainSplitViewController.m
//  Dictr
//
//  Created by Tong G. on 1/29/16.
//  Copyright © 2016 Tong Kuo. All rights reserved.
//

#import "DictrMainSplitViewController.h"

#import "DictrSearchFieldController.h"
#import "DictrResultsSplitViewController.h"

// Private Interfaces
@interface DictrMainSplitViewController ()

@end // Private Interfaces

// DictrMainSplitViewController class
@implementation DictrMainSplitViewController

#pragma mark - Initializations

- ( void ) viewDidLoad
    {
    self.splitView.vertical = NO;

    [ super viewDidLoad ];

    self->__searchFieldController = [ [ DictrSearchFieldController alloc ] initWithNibName: nil bundle: nil ];
    self->__resultSplitViewController = [ [ DictrResultsSplitViewController alloc ] initWithNibName: nil bundle: nil ];

    NSSplitViewItem* searchFieldSplitViewItem = [ NSSplitViewItem splitViewItemWithViewController: self->__searchFieldController ];
    [ self addSplitViewItem: searchFieldSplitViewItem ];
    [ self addChildViewController: self->__resultSplitViewController ];
    }

@end // DictrMainSplitViewController class
