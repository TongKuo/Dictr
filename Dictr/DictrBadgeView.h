//
//  DictrBadgeView.h
//  Dictr
//
//  Created by Tong G. on 1/30/16.
//  Copyright © 2016 Tong Kuo. All rights reserved.
//

@import Cocoa;

// DictrBadgeView class
@interface DictrBadgeView : NSControl
    {
@private
    NSMutableArray __strong* __cachedConstraints;

    NSDictionary __strong* __textAttrs;

    NSString __strong* __text;
    NSSize __textDrawingSize;
    }

@property ( strong, readwrite ) NSString* text;

- ( instancetype ) initWithText: ( NSString* )_Text controlSize: ( NSControlSize )_CtrlSize;

@end // DictrBadgeView class
