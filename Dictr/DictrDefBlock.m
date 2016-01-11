//
//  DictrDefBlock.m
//  Dictr
//
//  Created by Tong G. on 1/7/16.
//  Copyright © 2016 Tong Kuo. All rights reserved.
//

#import "DictrDefBlock.h"

// Private Interfaces
@interface DictrDefBlock ()

@property ( strong, readwrite ) NSString* level;
@property ( strong, readwrite ) NSString* definition;

@end // Private Interfaces

// DictrDefBlock class
@implementation DictrDefBlock

#pragma mark - Initializations

- ( instancetype ) initWithXML: ( NSXMLNode* )_XMLNode
    {
    if ( self = [ super initWithXML: _XMLNode ] )
        {
        NSArray <__kindof NSXMLNode*>* matchingNodes = nil;

        NSString* lvlXPathExpr = @"descendant-or-self::*/lvl";
        NSString* defXPathExpr = @"descendant-or-self::*/def";

        // Extracting the definition information
        matchingNodes = [ self->__xmlNode nodesForXPath:
            [ NSString stringWithFormat: @"%@ | %@", lvlXPathExpr, defXPathExpr ] error: nil ];

        for ( NSXMLNode* _MatchingNode in matchingNodes )
            {
            NSString* nodeName = _MatchingNode.name;
            NSString* nodeObjectValue = _MatchingNode.objectValue;

            if ( [ nodeName isEqualToString: @"lvl" ] )
                self.level = nodeObjectValue;

            else if ( [ nodeName isEqualToString: @"def" ] )
                self.definition = nodeObjectValue;
            }
        }

    return self;
    }

@end // DictrDefBlock class
