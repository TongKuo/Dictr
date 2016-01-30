//
//  NSAffineTransform+DictrExtensions.m
//  Dictr
//
//  Created by Tong G. on 1/30/16.
//  Copyright © 2016 Tong Kuo. All rights reserved.
//

#import "NSAffineTransform+DictrExtensions.h"

// NSAffineTransform + DictrExtensions
@implementation NSAffineTransform ( DictrExtensions )

+ ( NSAffineTransform* ) flipTransformForRect: ( NSRect )_Rect;
    {
    NSAffineTransform* flipTransform = [ NSAffineTransform transform ];
    [ flipTransform translateXBy: 0.f yBy: _Rect.size.height ];
    [ flipTransform scaleXBy: 1.0f yBy: -1.0 ];

    return flipTransform;
    }

@end // NSAffineTransform + DictrExtensions