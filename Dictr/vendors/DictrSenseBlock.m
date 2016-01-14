//
//  DictrSenseBlock.m
//  Dictr
//
//  Created by Tong G. on 1/14/16.
//  Copyright © 2016 Tong Kuo. All rights reserved.
//

#import "DictrSenseBlock.h"

// Private Interfaces
@interface DictrSenseBlock ()

@property ( strong, readwrite ) NSString* guideWord;

@property ( strong, readwrite ) NSOrderedSet <__kindof DictrSense*>* senses;

@end // Private Interfaces

// DictrSenseBlock class
@implementation DictrSenseBlock

#pragma mark - Initializations

- ( instancetype ) initWithXML:( NSXMLNode* )_XMLNode
    {
    NSXMLNode* selfXMLNode = nil;

    // To obtain all the def-block nodes that are not children of nodes phrase-block
    NSString* defBlockRelativeXPath = @"def-block[not(parent::phrase-block)]";

    // To obtain all the phrase-block nodes
    NSString* phraseBlockRelativeXPath = @"phrase-block";

    if ( [ _XMLNode.name isEqualToString: @"sense-block" ] )
        selfXMLNode = _XMLNode;
    else
        {
        NSArray* xPathsOfSenseSubBlocks = @[ [ @"descendant-or-self::" stringByAppendingString: defBlockRelativeXPath ]
                                           , [ @"descendant-or-self::" stringByAppendingString: phraseBlockRelativeXPath ]
                                           ];

        NSArray <__kindof NSXMLNode*>* senseSubBlocks =
            [ _XMLNode nodesForXPath: [ xPathsOfSenseSubBlocks componentsJoinedByString: @"|" ] error: nil ];

        selfXMLNode = [ NSXMLElement elementWithName: @"sense-block" children: senseSubBlocks attributes: nil ];
        }

    if ( self = [ super initWithXML: selfXMLNode ] )
        {
        NSArray <__kindof NSXMLNode*>* matchingNodes = nil;

        NSArray* xPathExprs = @[ @"child::header/title"

                               , [ @"child::" stringByAppendingString: defBlockRelativeXPath ]
                               , [ @"child::" stringByAppendingString: phraseBlockRelativeXPath ]
                               ];

        matchingNodes = [ self->__xmlNode nodesForXPath: [ xPathExprs componentsJoinedByString: @"|" ] error: nil ];

        NSMutableOrderedSet* tmpSenseBlocks = [ NSMutableOrderedSet orderedSet ];
        for ( NSXMLNode* _MatchingNode in matchingNodes )
            {
            NSString* nodeName = _MatchingNode.name;

            Class senseClass = nil;

            if ( [ nodeName isEqualToString: @"title" ] )
                self.guideWord = _MatchingNode.objectValue;

            // Extracting the def-block nodes
            else if ( [ nodeName isEqualToString: @"def-block" ] )
                senseClass = [ DictrGeneralDef class ];

            // Extracting the phrase-block nodes
            else if ( [ nodeName isEqualToString: @"phrase-block" ] )
                senseClass = [ DictrPhraseDef class ];

            // The local variable senseClass is nil by default.
            // senseClass will be assigned to a valid value
            // if the node name is equal to either "def-block" or "phrase-block".
            // Then we'll be able to construct the instances of senseClass.
            if ( senseClass )
                [ tmpSenseBlocks addObject: [ [ senseClass alloc ] initWithXML: _MatchingNode ] ];
            }

        self.senses = [ tmpSenseBlocks copy ];
        }

    return self;
    }

@end // DictrSenseBlock class
