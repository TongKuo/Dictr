//
//  NSXMLNode+DictrExtensions.m
//  Dictr
//
//  Created by Tong G. on 1/11/16.
//  Copyright © 2016 Tong Kuo. All rights reserved.
//

#import "NSXMLNode+DictrExtensions.h"

// NSXMLNode + DictrExtensions
@implementation NSXMLNode ( DictrExtensions )

#pragma mark Overrides

- ( NSString* ) description
    {
    return [ self XMLStringWithOptions: NSXMLNodePrettyPrint ];
    }

@end // NSXMLNode + DictrExtensions