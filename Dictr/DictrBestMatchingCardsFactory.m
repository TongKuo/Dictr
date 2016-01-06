//
//  DictrBestMatchingCardsFactory.m
//  Dictr
//
//  Created by Tong G. on 1/7/16.
//  Copyright © 2016 Tong Kuo. All rights reserved.
//

#import "DictrBestMatchingCardsFactory.h"

// DictrBestMatchingCardsFactory class
@implementation DictrBestMatchingCardsFactory

+ ( NSArray <__kindof DictrBestMatchingCardViewController*>* ) makeCardsWithMaterial: ( NSXMLNode* )_Material
    {
    NSMutableArray <__kindof DictrBestMatchingCardViewController*>* cards = [ NSMutableArray array ];
    NSMutableArray <__kindof NSXMLNode*>* posBlocks = [ NSMutableArray array ];

    NSXMLNode* node = [ [ _Material rootDocument ] rootElement ];
    while ( ( node = [ node nextNode ] ) )
        if ( [ node.name isEqualToString: @"pos-block" ] )
            [ posBlocks addObject: node ];

    return [ cards copy ];
    }

@end // DictrBestMatchingCardsFactory class
