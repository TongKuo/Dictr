//
//  DictrMainContentView.m
//  Dictr
//
//  Created by Tong G. on 1/5/16.
//  Copyright © 2016 Tong Kuo. All rights reserved.
//

#import "DictrMainContentView.h"

// Private Interfaces
@interface DictrMainContentView ()

@property ( strong, readwrite ) NSLayoutConstraint* selfWidthConstraint;
@property ( strong, readwrite ) NSLayoutConstraint* selfHeightConstraint;

@end // Private Interfaces

// DictrMainContentView class
@implementation DictrMainContentView

#pragma mark - Initializations

- ( void ) awakeFromNib
    {
    [ self configureForAutoLayout ];

    self.selfWidthConstraint = [ self autoSetDimension: ALDimensionWidth toSize: NSWidth( self.frame ) relation: NSLayoutRelationEqual ];
    self.selfHeightConstraint = [ self autoSetDimension: ALDimensionHeight toSize: DictrSearchFieldFixedHeight + DictrGapBetweenSearchFieldAndTop relation: NSLayoutRelationEqual ];
    }

#pragma mark - Drawing

- ( void ) drawRect: ( NSRect )_DirtyRect
    {
    [ super drawRect: _DirtyRect ];
    
    // Drawing code here.
    }

@end // DictrMainContentView class
