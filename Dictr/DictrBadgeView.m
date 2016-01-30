//
//  DictrBadgeView.m
//  Dictr
//
//  Created by Tong G. on 1/30/16.
//  Copyright © 2016 Tong Kuo. All rights reserved.
//

#import "DictrBadgeView.h"

// Private Interfaces
@interface DictrBadgeView ()
@end // Private Interfaces

// DictrBadgeView class
@implementation DictrBadgeView

#pragma mark - Initializations

- ( instancetype ) initWithText: ( NSString* )_Text
                    controlSize: ( NSControlSize )_CtrlSize
    {
    NSParameterAssert( ( _Text.length ) > ( 0 ) );

    if ( self = [ super initWithFrame: NSZeroRect ] )
        {
        [ self configureForAutoLayout ];
        __cachedConstraints = [ NSMutableArray array ];

        __textAttrs = @{ NSFontAttributeName : [ NSFont fontWithName: @"Avenir Next Ultra Light" size: 12 ]
                       , NSForegroundColorAttributeName : [ NSColor whiteColor ] };
        self.text = _Text;
        }

    return self;
    }

#pragma mark - Drawing

- ( BOOL ) isFlipped
    {
    return YES;
    }

- ( void ) drawRect: ( NSRect )_DirtyRect
    {
    [ super drawRect: _DirtyRect ];
    
    NSColor* bgColor = [ NSColor colorWithHTMLColor: @"86CBF6" ];
    [ bgColor set ];

    // Drawing bounds
    CGFloat cornerVal = 7.f;
    NSBezierPath* roundedBoundsPath =
        [ NSBezierPath bezierPathWithRoundedRect: self.bounds
                       withRadiusOfTopLeftCorner: cornerVal
                                bottomLeftCorner: cornerVal
                                  topRightCorner: cornerVal
                               bottomRightCorner: cornerVal
                                       isFlipped: NO ];
    [ roundedBoundsPath fill ];

    // Drawing text
    NSRect selfBounds = self.bounds;
    NSRect drawingRect = NSMakeRect( ( NSWidth( selfBounds ) - __textDrawingSize.width ) / 2.f
                                   , ( NSHeight( selfBounds ) - __textDrawingSize.height ) / 2.f - .5f
                                   , __textDrawingSize.width
                                   , __textDrawingSize.height
                                   );

    [ self.text drawInRect: drawingRect withAttributes: self->__textAttrs ];
    }

#pragma mark - Dynamic Properties

@dynamic text;

- ( void ) setText: ( NSString* )_Text
    {
    if ( __text != _Text )
        {
        __text = [ _Text uppercaseString ];
        __textDrawingSize = [ __text sizeWithAttributes: self->__textAttrs ];

        NSSize derivedFrameSize = __textDrawingSize;
        derivedFrameSize.width += 6.f;
        derivedFrameSize.height -= 4.f;

        [ self removeConstraints: __cachedConstraints ];
        [ __cachedConstraints removeAllObjects ];
        [ __cachedConstraints addObject: [ self autoSetDimension: ALDimensionWidth toSize: derivedFrameSize.width ] ];
        [ __cachedConstraints addObject: [ self autoSetDimension: ALDimensionHeight toSize: derivedFrameSize.height ] ];

        [ self setNeedsDisplay: YES ];
        }
    }

- ( NSString* ) text
    {
    return __text;
    }

@end // DictrBadgeView class