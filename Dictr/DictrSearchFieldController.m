//
//  DictrSearchFieldController.m
//  Dictr
//
//  Created by Tong G. on 1/29/16.
//  Copyright © 2016 Tong Kuo. All rights reserved.
//

#import "DictrSearchFieldController.h"

// Private Interfaces
@interface DictrSearchFieldController ()

@end // Private Interfaces

// DictrSearchFieldController class
@implementation DictrSearchFieldController

- ( void ) viewDidLoad
    {
    // Do any additional setup after loading the view.
    [ self.view configureForAutoLayout ];

    // Auto Layout the search field
    [ self.view autoSetDimension: ALDimensionHeight toSize: DictrSearchFieldFixedHeight relation: NSLayoutRelationEqual ];
    }

@end // DictrSearchFieldController class
