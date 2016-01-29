//
//  DictrSplitViewController.m
//  Dictr
//
//  Created by Tong G. on 1/29/16.
//  Copyright © 2016 Tong Kuo. All rights reserved.
//

#import "DictrSplitViewController.h"

// Private Interfaces
@interface DictrSplitViewController ()
@end // Private Interfaces

// DictrSplitViewController class
@implementation DictrSplitViewController

#pragma mark - Conforms to <NSSplitViewDelegate>

- ( NSRect ) splitView: ( NSSplitView* )_SplitView
         effectiveRect: ( NSRect )_ProposedEffectiveRect
          forDrawnRect: ( NSRect )_DrawnRect
      ofDividerAtIndex: ( NSInteger )_DividerIndex
    {
    [ super splitView: _SplitView
        effectiveRect: _ProposedEffectiveRect
         forDrawnRect: _DrawnRect
     ofDividerAtIndex: _DividerIndex ];

    return NSZeroRect;
    }

@end // DictrSplitViewController class
