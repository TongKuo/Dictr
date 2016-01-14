//
//  DictrSense.m
//  Dictr
//
//  Created by Tong G. on 1/11/16.
//  Copyright © 2016 Tong Kuo. All rights reserved.
//

#import "DictrSense.h"

// Private Interfaces
@interface DictrSense ()

@property ( strong, readwrite ) NSString* level;

@property ( strong, readwrite ) NSString* guideWord;

@end // Private Interfaces

// DictrSense class
@implementation DictrSense

#pragma mark - Initializations

- ( instancetype ) initWithXML: ( NSXMLNode* )_XMLNode
    {
    if ( self = [ super initWithXML: _XMLNode ] )
        {
        NSArray <__kindof NSXMLNode*>* matchingNodes = nil;

        matchingNodes = [ self->__xmlNode nodesForXPath:
            @[ @"child::definition/info/lvl"
             , @"parent::sense-block/header/title"
             ].combinationOfXPathExpressions error: nil ];

        for ( NSXMLNode* _MatchingNode in matchingNodes )
            {
            NSString* nodeName = _MatchingNode.name;
            id nodeObjectValue = _MatchingNode.objectValue;

            if ( [ nodeName isEqualToString: @"lvl" ] )
                self.level = nodeObjectValue;

            else if ( [ nodeName isEqualToString: @"title" ] )
                self.guideWord = _MatchingNode.objectValue;
            }
        }

    return self;
    }

#pragma mark - Dynamic Properties

@dynamic kind;

- ( DictrSenseKind ) kind
    {
    DictrSenseKind kind = DictrSenseUnknownKind;

    if ( self->__xmlNode )
        {
        if ( [ self->__xmlNode.name isEqualToString: @"def-block" ] )
            kind = DictrSenseDefKind;
        else if ( [ self->__xmlNode.name isEqualToString: @"phrase-block" ] )
            kind = DictrSensePhraseKind;
        }

    return kind;
    }

@end // DictrSense class
