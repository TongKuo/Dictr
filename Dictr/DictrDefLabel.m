//
//  DictrDefLabel.m
//  Dictr
//
//  Created by Tong G. on 1/23/16.
//  Copyright © 2016 Tong Kuo. All rights reserved.
//

#import "DictrDefLabel.h"

// Private Interfaces
@interface DictrDefLabel ()

@property ( strong, readwrite ) NSString* name;
@property ( strong, readwrite ) NSString* briefDescription;

@end // Private Interfaces

// DictrDefLabel class
@implementation DictrDefLabel

#pragma mark - Initializations

+ ( void ) initialize
    {
    
    }

- ( instancetype ) initWithXML: ( NSXMLNode* )_XMLNode
    {
    if ( ![ _XMLNode.name isEqualToString: @"gram" ] )
        return nil;

    if ( self = [ super initWithXML: _XMLNode ] )
        {
        NSArray* leafValues = kAllLeafNodeObjectValues( self->__xmlNode );

        if ( leafValues.count > 0 )
            self.name = [ leafValues componentsJoinedByString: @"" ];
        }

    return self;
    }

@end // DictrDefLabel class
