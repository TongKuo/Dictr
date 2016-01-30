//
//  NSAffineTransform+DictrExtensions.h
//  Dictr
//
//  Created by Tong G. on 1/30/16.
//  Copyright © 2016 Tong Kuo. All rights reserved.
//

@import Cocoa;

// NSAffineTransform + DictrExtensions
@interface NSAffineTransform ( DictrExtensions )

+ ( NSAffineTransform* ) flipTransformForRect: ( NSRect )_Rect;

@end // NSAffineTransform + DictrExtensions