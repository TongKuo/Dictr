//
//  DictrMainContentViewController.m
//  Dictr
//
//  Created by Tong G. on 1/5/16.
//  Copyright © 2016 Tong Kuo. All rights reserved.
//

#import "DictrMainContentViewController.h"
#import "DictrSearchField.h"
#import "DictrMainContentView.h"

// DictrMainContentViewController class
@implementation DictrMainContentViewController

#pragma mark - Initializations

- ( void ) viewDidLoad
    {
    [ super viewDidLoad ];

    // Do any additional setup after loading the view.
    [ self.searchField configureForAutoLayout ];
    [ self.moreRelatedEntriesScrollView configureForAutoLayout ];
    [ self.view setSubviews: @[ self.searchField, self.moreRelatedEntriesScrollView ] ];

    // Auto Layout the search field
    [ self.searchField autoPinEdgesToSuperviewEdgesWithInsets: NSEdgeInsetsMake( DictrGapBetweenSearchFieldAndTop, 0.f, 0.f, 0.f )
                                                excludingEdge: ALEdgeBottom ];

    [ self.searchField autoSetDimension: ALDimensionHeight toSize: DictrSearchFieldFixedHeight relation: NSLayoutRelationEqual ];
    }

- ( void ) setRepresentedObject: ( id )_RepresentedObject
    {
    [ super setRepresentedObject: _RepresentedObject ];

    // Update the view, if already loaded.
    }

@end // DictrMainContentViewController class
