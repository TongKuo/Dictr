//
//  DictrMainContentView.m
//  Dictr
//
//  Created by Tong G. on 1/5/16.
//  Copyright © 2016 Tong Kuo. All rights reserved.
//

#import "DictrMainContentView.h"

// DictrMainContentView class
@implementation DictrMainContentView

#pragma mark - Initializations

- ( void ) awakeFromNib
    {
    [ self configureForAutoLayout ];

    [ self autoSetDimension: ALDimensionWidth toSize: NSWidth( self.frame ) relation: NSLayoutRelationEqual ];
    [ self autoSetDimension: ALDimensionHeight toSize: DictrMainWindowMinHeight relation: NSLayoutRelationGreaterThanOrEqual ];
    }

#pragma mark - Drawing

- ( void ) drawRect: ( NSRect )_DirtyRect
    {
    [ super drawRect: _DirtyRect ];
    
    // Drawing code here.
    }

@end // DictrMainContentView class
