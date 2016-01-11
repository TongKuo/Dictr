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

        NSString* egXPathExpr = @"descendant-or-self::eg";
        NSString* transXPathExpr = @"descendant-or-self::trans";
        matchingNodes = [ self->__xmlNode nodesForXPath:
            [ NSString stringWithFormat: @"%@ | %@", egXPathExpr, transXPathExpr ] error: nil ];

        NSLog( @"%@", matchingNodes );
        for ( NSXMLNode* _MatchingNode in matchingNodes )
            {
            NSString* oldName = _MatchingNode.name;
            _MatchingNode.name = @"span";

            NSAttributedString* tmpAttrString = [ [ NSAttributedString alloc ] initWithHTML: [ _MatchingNode.XMLString dataUsingEncoding: NSUTF8StringEncoding ] documentAttributes: nil ];

            if ( [ oldName isEqualToString: @"eg" ] )
                self.example = tmpAttrString;
            else if ( [ oldName isEqualToString: @"trans" ] )
                self.translationOfExample = tmpAttrString;
            }
        }

    return self;
    }

@end // DictrExample class
