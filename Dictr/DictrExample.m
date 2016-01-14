//
//  DictrExample.m
//  Dictr
//
//  Created by Tong G. on 1/7/16.
//  Copyright © 2016 Tong Kuo. All rights reserved.
//

#import "DictrExample.h"

// Private Interfaces
@interface DictrExample ()

@property ( strong, readwrite ) NSAttributedString* example;
@property ( strong, readwrite ) NSAttributedString* translationOfExample;
@property ( strong, readwrite ) NSString* language;

@end // Private Interfaces

// DictrExample class
@implementation DictrExample

#pragma mark - Initializations

- ( instancetype ) initWithXML: ( NSXMLNode* )_XMLNode
    {
    if ( self = [ super initWithXML: _XMLNode ] )
        {
        NSArray <__kindof NSXMLNode*>* matchingNodes = nil;

        matchingNodes = [ self->__xmlNode nodesForXPath:
            @[ @"child::eg"
             , @"child::trans"
             ].combinationOfXPathExpressions error: nil ];

        for ( NSXMLNode* _MatchingNode in matchingNodes )
            {
            NSString* oldName = _MatchingNode.name;

            NSXMLNode* nodeCopy = [ _MatchingNode copy ];
            nodeCopy.name = @"span";

            NSLog( @"%@", nodeCopy );

            NSAttributedString* tmpAttrString = [ [ NSAttributedString alloc ] initWithHTML: [ nodeCopy.XMLString dataUsingEncoding: NSUTF8StringEncoding ] documentAttributes: nil ];

            if ( [ oldName isEqualToString: @"eg" ] )
                self.example = tmpAttrString;
            else if ( [ oldName isEqualToString: @"trans" ] )
                self.translationOfExample = tmpAttrString;
            }

//        NSLog( @"%@", self.example );
//        NSLog( @"%@", self.translationOfExample );
//        NSLog( @"=======" );
        }

    return self;
    }

@end // DictrExample class
