//
//  DictrXMLObject.m
//  Dictr
//
//  Created by Tong G. on 1/7/16.
//  Copyright © 2016 Tong Kuo. All rights reserved.
//

#import "DictrXMLObject.h"

// DictrXMLObject class
@implementation DictrXMLObject

#pragma mark - Initializations

// Designated Initializer
- ( instancetype ) initWithXML: ( NSXMLNode* )_XMLNode
    {
    if ( !_XMLNode )
        return nil;

    if ( self = [ super init ] )
        self->__xmlNode = _XMLNode;

    return self;
    }

@end // DictrXMLObject class
