//
//  DictrPhraseBlock.m
//  Dictr
//
//  Created by Tong G. on 1/7/16.
//  Copyright © 2016 Tong Kuo. All rights reserved.
//

#import "DictrPhraseBlock.h"

// Private Interfaces
@interface DictrPhraseBlock ()

@property ( strong, readwrite ) NSAttributedString* title;
@property ( strong, readwrite ) NSXMLNode* lab;
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

        NSString* titleXPathExpr = @"child::header/title";
        NSString* labXPathExpr = @"child::header/info/lab";
        NSString* defBlockXPathExpr = @"child::def-block";

        // Extracting the def-block nodes
        matchingNodes = [ self->__xmlNode nodesForXPath:
            [ NSString stringWithFormat: @"%@ | %@ | %@", titleXPathExpr, labXPathExpr, defBlockXPathExpr ] error: nil ];

        NSMutableOrderedSet* tmpDefBlocks = [ NSMutableOrderedSet orderedSet ];
        for ( NSXMLNode* _MatchingNodes in matchingNodes )
            {
            NSString* nodeName = _MatchingNodes.name;
            NSXMLNode* nodeCopy = [ _MatchingNodes copy ];
            if ( [ nodeName isEqualToString: @"title" ] )
                {
                nodeCopy.name = @"span";
                self.title = [ [ NSAttributedString alloc ] initWithHTML: [ nodeCopy.XMLString dataUsingEncoding: NSUTF8StringEncoding ] documentAttributes: nil ];
                }

            else if ( [ nodeName isEqualToString: @"lab" ] )
                self.lab = nodeCopy;

            else if ( [ nodeName isEqualToString: @"def-block" ] )
                [ tmpDefBlocks addObject: [ [ DictrDefBlock alloc ] initWithXML: _MatchingNodes ] ];
            }

        self.defBlocks = [ tmpDefBlocks copy ];
        }

    return self;
    }

@end // DictrPhraseBlock class
