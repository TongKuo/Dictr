//
//  DictrBestMatchingCardsFactory.h
//  Dictr
//
//  Created by Tong G. on 1/7/16.
//  Copyright © 2016 Tong Kuo. All rights reserved.
//

@import Cocoa;

@class DictrBestMatchingCardViewController;

// DictrBestMatchingCardsFactory class
@interface DictrBestMatchingCardsFactory : NSObject

+ ( NSArray <__kindof DictrBestMatchingCardViewController*>* ) makeCardsWithMaterial: ( NSXMLNode* )_Material;

@end // DictrBestMatchingCardsFactory class
