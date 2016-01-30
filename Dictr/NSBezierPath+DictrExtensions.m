//
//  NSBezierPath+DictrExtensions.m
//  Dictr
//
//  Created by Tong G. on 1/30/16.
//  Copyright © 2016 Tong Kuo. All rights reserved.
//

#import "NSBezierPath+DictrExtensions.h"
#import "NSAffineTransform+DictrExtensions.h"

// NSBezierPath + DictrExtensions
@implementation NSBezierPath ( DictrExtensions )

+ ( NSBezierPath* ) bezierPathWithRoundedRect: ( NSRect )_BaseRect
                    withRadiusOfTopLeftCorner: ( CGFloat )topLeft
                             bottomLeftCorner: ( CGFloat )bottomLeft
                               topRightCorner: ( CGFloat )topRight
                            bottomRightCorner: ( CGFloat )bottomRight
                                    isFlipped: ( BOOL )_IsFlipped
    {

    NSBezierPath* outlinePath = [ NSBezierPath bezierPath ];
    [ outlinePath moveToPoint: NSMakePoint( NSMinX( _BaseRect ) + bottomLeft, NSMinY( _BaseRect ) ) ];

    [ outlinePath lineToPoint: NSMakePoint( NSMaxX( _BaseRect ) - bottomRight, NSMinY( _BaseRect ) ) ];

    NSPoint rightBottomCorner = NSMakePoint( NSMaxX( _BaseRect ), NSMinY( _BaseRect ) );
    [ outlinePath curveToPoint: NSMakePoint( NSMaxX( _BaseRect ), NSMinY( _BaseRect ) + bottomRight )
                 controlPoint1: rightBottomCorner
                 controlPoint2: rightBottomCorner ];

    [ outlinePath lineToPoint: NSMakePoint( NSMaxX( _BaseRect ), NSMaxY( _BaseRect ) - topRight ) ];

    NSPoint righTopCorner = NSMakePoint( NSMaxX( _BaseRect ), NSMaxY( _BaseRect ) );
    [ outlinePath curveToPoint: NSMakePoint( NSMaxX( _BaseRect ) - topRight, NSMaxY( _BaseRect ) )
                 controlPoint1: righTopCorner
                 controlPoint2: righTopCorner ];

    [ outlinePath lineToPoint: NSMakePoint( NSMinX( _BaseRect ) + topLeft, NSMaxY( _BaseRect ) ) ];

    NSPoint leftTopCorner = NSMakePoint( NSMinX( _BaseRect ), NSMaxY( _BaseRect ) );
    [ outlinePath curveToPoint: NSMakePoint( NSMinX( _BaseRect ), NSMaxY( _BaseRect ) - topLeft )
                 controlPoint1: leftTopCorner
                 controlPoint2: leftTopCorner ];

    [ outlinePath lineToPoint: NSMakePoint( NSMinX( _BaseRect ), NSMinY( _BaseRect ) + bottomLeft ) ];

    NSPoint leftBottomCorner = NSMakePoint( NSMinX( _BaseRect ), NSMinY( _BaseRect ) );
    [ outlinePath curveToPoint: NSMakePoint( NSMinX( _BaseRect ) + bottomLeft, NSMinY( _BaseRect ) )
                 controlPoint1: leftBottomCorner
                 controlPoint2: leftBottomCorner ];

    if ( _IsFlipped )
        [ outlinePath transformUsingAffineTransform: [ NSAffineTransform flipTransformForRect: _BaseRect ] ];

    return outlinePath;
    }

@end // NSBezierPath + DictrExtensions
