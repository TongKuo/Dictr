//
//  DictrSenseSubBlock.m
//  Dictr
//
//  Created by Tong G. on 1/11/16.
//  Copyright © 2016 Tong Kuo. All rights reserved.
//

#import "DictrSenseSubBlock.h"

// Private Interfaces
@interface DictrSenseSubBlock ()

@property ( strong, readwrite ) NSString* level;

@property ( strong, readwrite ) NSString* guideWord;

@end // Private Interfaces

// DictrSenseSubBlock class
@implementation DictrSenseSubBlock

#pragma mark - Initializations

- ( instancetype ) initWithXML: ( NSXMLNode* )_XMLNode
    {
    if ( self = [ super initWithXML: _XMLNode ] )
        {
        NSArray <__kindof NSXMLNode*>* matchingNodes = nil;

        NSArray* xPathExprs = @[ @"child::definition/info/lvl"
                               , @"parent::sense-block/header/title"
                               ];

        matchingNodes = [ self->__xmlNode nodesForXPath: [ xPathExprs componentsJoinedByString: @"|" ] error: nil ];

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

- ( DictrSenseSubBlockKind ) kind
    {
    DictrSenseSubBlockKind kind = DictrSenseSubBlockUnknownKind;

    if ( self->__xmlNode )
        {
        if ( [ self->__xmlNode.name isEqualToString: @"def-block" ] )
            kind = DictrSenseSubBlockDefKind;
        else if ( [ self->__xmlNode.name isEqualToString: @"phrase-block" ] )
            kind = DictrSenseSubBlockPhraseKind;
        }

    return kind;
    }

@end // DictrSenseSubBlock class
