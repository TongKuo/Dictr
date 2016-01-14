//
//  DictrGeneralDef.m
//  Dictr
//
//  Created by Tong G. on 1/7/16.
//  Copyright © 2016 Tong Kuo. All rights reserved.
//

#import "DictrGeneralDef.h"

// Private Interfaces
@interface DictrGeneralDef ()

@property ( strong, readwrite ) NSString* definition;

@property ( strong, readwrite ) NSOrderedSet <__kindof DictrExample*>* examples;

@end // Private Interfaces

// DictrGeneralDef class
@implementation DictrGeneralDef

#pragma mark - Initializations

- ( instancetype ) initWithXML: ( NSXMLNode* )_XMLNode
    {
    if ( self = [ super initWithXML: _XMLNode ] )
        {
        NSArray <__kindof NSXMLNode*>* matchingNodes = nil;

        // Extracting the definition information
        matchingNodes = [ self->__xmlNode nodesForXPath:
            @[ @"child::definition/def"
             , @"child::examp"
             ].combinationOfXPathExpressions error: nil ];

        NSMutableOrderedSet* tmpExamps = [ NSMutableOrderedSet orderedSet ];
        for ( NSXMLNode* _MatchingNode in matchingNodes )
            {
            NSString* nodeName = _MatchingNode.name;
            id nodeObjectValue = _MatchingNode.objectValue;

            if ( [ nodeName isEqualToString: @"def" ] )
                self.definition = nodeObjectValue;

            else if ( [ nodeName isEqualToString: @"examp" ] )
                [ tmpExamps addObject: [ [ DictrExample alloc ] initWithXML: _MatchingNode ] ];
            }

        self.examples = [ tmpExamps copy ];
        }

    return self;
    }

@end // DictrGeneralDef class
