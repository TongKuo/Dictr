//
//  DictrXMLObject.h
//  Dictr
//
//  Created by Tong G. on 1/7/16.
//  Copyright © 2016 Tong Kuo. All rights reserved.
//

@import Foundation;

// DictrXMLObject class
@interface DictrXMLObject : NSObject
    {
@protected
    NSXMLNode __strong* __xmlNode;
    }

#pragma mark - Initializations

// Designated Initializer
- ( instancetype ) initWithXML: ( NSXMLNode* )_XMLNode;

@end // DictrXMLObject class
