//
//  DictrMainContentViewController.m
//  Dictr
//
//  Created by Tong G. on 1/5/16.
//  Copyright © 2016 Tong Kuo. All rights reserved.
//

#import "DictrMainContentViewController.h"

// DictrMainContentViewController class
@implementation DictrMainContentViewController

#pragma mark - Initializations

- ( void ) viewDidLoad
    {
    [ super viewDidLoad ];

    // Do any additional setup after loading the view.
    [ self.searchField configureForAutoLayout ];
    [ self.moreRelatedEntriesScrollView configureForAutoLayout ];
    [ self.showTranslateIntoButton configureForAutoLayout ];
    [ self.view setSubviews: @[ self.searchField, self.moreRelatedEntriesScrollView, self.showTranslateIntoButton ] ];

    // Auto Layout the search field
    [ self.searchField autoPinEdgesToSuperviewEdgesWithInsets: NSEdgeInsetsMake( 30.f, 20.f, 0.f, 20.f )
                                                excludingEdge: ALEdgeBottom ];

    [ self.searchField autoSetDimension: ALDimensionHeight toSize: 150.f relation: NSLayoutRelationEqual ];

    // Auto Layout the Translate Into button
    [ self.showTranslateIntoButton autoSetDimension: ALDimensionWidth toSize: NSWidth( self.showTranslateIntoButton.frame ) relation: NSLayoutRelationEqual ];
    [ self.showTranslateIntoButton autoSetDimension: ALDimensionHeight toSize: NSHeight( self.showTranslateIntoButton.frame ) relation: NSLayoutRelationEqual ];
    [ self.showTranslateIntoButton autoAlignAxis: ALAxisVertical toSameAxisOfView: self.searchField ];
    [ self.showTranslateIntoButton autoPinEdgeToSuperviewEdge: ALEdgeBottom withInset: 10.f relation: NSLayoutRelationEqual ];
    }

- ( void ) setRepresentedObject: ( id )_RepresentedObject
    {
    [ super setRepresentedObject: _RepresentedObject ];

    // Update the view, if already loaded.
    }

@end // DictrMainContentViewController class
