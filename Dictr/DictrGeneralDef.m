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
@property ( strong, readwrite ) NSString* translationOfDefinition;
@property ( strong, readwrite ) NSString* languageOfTranslationOfDefinition;

@property ( strong, readwrite ) NSString* label;

@property ( strong, readwrite ) NSOrderedSet <__kindof DictrExample*>* examples;

@end // Private Interfaces

static NSArray* kAllLeafNodeObjectValues( NSXMLNode* _ParentNode )
    {
    NSMutableArray <__kindof NSString*>* leafValues = [ NSMutableArray array ];

    for ( NSXMLNode* _ChildNode in _ParentNode.children )
        {
        if ( _ChildNode.childCount == 0 )
            [ leafValues addObject: _ChildNode.objectValue ];

        [ leafValues addObjectsFromArray: kAllLeafNodeObjectValues( _ChildNode ) ];
        }

    return [ leafValues copy ];
    }

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
             , @"child::definition/trans"
             , @"child::examp"
             , @"child::definition/info/gram"
             ].combinationOfXPathExpressions error: nil ];

        NSMutableOrderedSet* tmpExamps = [ NSMutableOrderedSet orderedSet ];
        for ( NSXMLNode* _MatchingNode in matchingNodes )
            {
            NSString* nodeName = _MatchingNode.name;
            id nodeObjectValue = _MatchingNode.objectValue;

            if ( [ nodeName isEqualToString: @"def" ] )
                self.definition = nodeObjectValue;

            else if ( [ nodeName isEqualToString: @"trans" ] )
                {
                self.translationOfDefinition = nodeObjectValue;
                self.languageOfTranslationOfDefinition = [ ( NSXMLElement* )_MatchingNode attributeForName: @"lang" ].objectValue;
                }

            else if ( [ nodeName isEqualToString: @"examp" ] )
                [ tmpExamps addObject: [ [ DictrExample alloc ] initWithXML: _MatchingNode ] ];

            else if ( [ nodeName isEqualToString: @"gram" ] )
                {
                NSArray* leafValues = kAllLeafNodeObjectValues( _MatchingNode );
                if ( leafValues.count > 0 )
                    self.label = [ leafValues componentsJoinedByString: @"" ];
                }
            }

        self.examples = [ tmpExamps copy ];
        }

    return self;
    }

@end // DictrGeneralDef class
