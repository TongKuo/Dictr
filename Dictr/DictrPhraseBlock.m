//
//  DictrPhraseBlock.m
//  Dictr
//
//  Created by Tong G. on 1/7/16.
//  Copyright © 2016 Tong Kuo. All rights reserved.
//

#import "DictrPhraseBlock.h"

// Private Interfaces
@interface DictrDefBlock ()

@property ( strong, readwrite ) NSOrderedSet <__kindof DictrDefBlock*>* defBlocks;

@end // Private Interfaces

// DictrPhraseBlock class
@implementation DictrPhraseBlock

#pragma mark - Initializations

- ( instancetype ) initWithXML: ( NSXMLNode* )_XMLNode
    {
    if ( self = [ super initWithXML: _XMLNode ] )
        {
        NSArray <__kindof NSXMLNode*>* matchingNodes = nil;

        // Extracting the def-block nodes
        matchingNodes = [ self->__xmlNode nodesForXPath: @"descendant-or-self::def-block" error: nil ];

        NSMutableOrderedSet* tmpDefBlocks = [ NSMutableOrderedSet orderedSet ];
        for ( NSXMLNode* _DefBlockNodes in matchingNodes )
            [ tmpDefBlocks addObject: [ [ DictrDefBlock alloc ] initWithXML: _DefBlockNodes ] ];
        }

    return self;
    }

@end // DictrPhraseBlock class
