//
//  DictrMainContentViewController.m
//  Dictr
//
//  Created by Tong G. on 1/5/16.
//  Copyright © 2016 Tong Kuo. All rights reserved.
//

#import "DictrMainContentViewController.h"
#import "DictrMainSplitViewController.h"
#import "DictrMainContentView.h"

// DictrMainContentViewController class
@implementation DictrMainContentViewController

#pragma mark - Initializations

- ( void ) viewDidLoad
    {
    [ super viewDidLoad ];

//    NSLog( @"%@", self.mainSplitViewController.splitView );
    [ self.view addSubview: self.mainSplitViewController.view ];
    [ self.mainSplitViewController.view autoPinEdgesToSuperviewEdges ];
    }

- ( void ) setRepresentedObject: ( id )_RepresentedObject
    {
    [ super setRepresentedObject: _RepresentedObject ];

    // Update the view, if already loaded.
    }

@end // DictrMainContentViewController class
