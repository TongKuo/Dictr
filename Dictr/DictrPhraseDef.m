//
//  DictrPhraseDef.m
//  Dictr
//
//  Created by Tong G. on 1/7/16.
//  Copyright © 2016 Tong Kuo. All rights reserved.
//

#import "DictrPhraseDef.h"

// Private Interfaces
@interface DictrPhraseDef ()

@property ( strong, readwrite ) NSAttributedString* title;
@property ( strong, readwrite ) NSXMLNode* lab;
@property ( strong, readwrite ) NSOrderedSet <__kindof DictrGeneralDef*>* defBlocks;

@end // Private Interfaces

// DictrPhraseDef class
@implementation DictrPhraseDef

#pragma mark - Initializations

- ( instancetype ) initWithXML: ( NSXMLNode* )_XMLNode
    {
    if ( self = [ super initWithXML: _XMLNode ] )
        {
        NSArray <__kindof NSXMLNode*>* matchingNodes = nil;

        // Extracting the def-block nodes
        matchingNodes = [ self->__xmlNode nodesForXPath:
            @[ @"child::header/title"
             , @"child::header/info/lab"
             , @"child::def-block"
             ].combinationOfXPathExpressions error: nil ];

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
                [ tmpDefBlocks addObject: [ [ DictrGeneralDef alloc ] initWithXML: _MatchingNodes ] ];
            }

        self.defBlocks = [ tmpDefBlocks copy ];
        }

    return self;
    }

@end // DictrPhraseDef class
