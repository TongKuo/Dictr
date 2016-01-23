//
//  DictrUtilities.h
//  Dictr
//
//  Created by Tong G. on 1/23/16.
//  Copyright © 2016 Tong Kuo. All rights reserved.
//

@import Foundation;

extern NSUInteger kCountOfSomeKindOfChildren( NSXMLNode* _ParentNode
                                            , NSXMLNodeKind _NodeKind
                                            , BOOL _DoesRecurse );

extern NSArray* kAllLeafNodeObjectValues( NSXMLNode* _ParentNode );