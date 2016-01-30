//
//  NSBezierPath+DictrExtensions.h
//  Dictr
//
//  Created by Tong G. on 1/30/16.
//  Copyright © 2016 Tong Kuo. All rights reserved.
//

@import Cocoa;

// NSBezierPath + DictrExtensions
@interface NSBezierPath ( DictrExtensions )

+ ( NSBezierPath* ) bezierPathWithRoundedRect: ( NSRect )_BaseRect
                    withRadiusOfTopLeftCorner: ( CGFloat )_TopLeft
                             bottomLeftCorner: ( CGFloat )_BottomLeft
                               topRightCorner: ( CGFloat )_TopRight
                            bottomRightCorner: ( CGFloat )_BottomRight
                                    isFlipped: ( BOOL )_IsFlipped;
@end // NSBezierPath + DictrExtensions