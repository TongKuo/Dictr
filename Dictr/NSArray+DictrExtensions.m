//
//  NSArray+DictrExtensions.m
//  Dictr
//
//  Created by Tong G. on 1/14/16.
//  Copyright © 2016 Tong Kuo. All rights reserved.
//

#import "NSArray+DictrExtensions.h"

// NSArray + DictrExtensions
@implementation NSArray ( DictrExtensions )

#pragma mark - Dictr Additions

@dynamic combinationOfXPathExpressions;

- ( NSString* ) combinationOfXPathExpressions
    {
    return [ self componentsJoinedByString: @"|" ];
    }

@end // NSArray + DictrExtensions
