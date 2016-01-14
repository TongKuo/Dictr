//
//  DictrSubEntry.h
//  Dictr
//
//  Created by Tong G. on 1/7/16.
//  Copyright © 2016 Tong Kuo. All rights reserved.
//

#import "DictrXMLObject.h"

@class DictrSense;

// DictrSubEntry class
@interface DictrSubEntry : DictrXMLObject

@property ( strong, readonly ) NSString* title;

@property ( strong, readonly ) NSString* pos;

@property ( strong, readonly ) NSURL* UKPronunciation;
@property ( strong, readonly ) NSURL* USPronunciation;

@property ( strong, readonly ) NSOrderedSet <__kindof NSString*>* IPAs;

@property ( strong, readonly ) NSOrderedSet <__kindof DictrSense*>* senseBlocks;

#pragma mark - Initializations

- ( instancetype ) initWithTitle: ( NSString* )_Title xmlNode: ( NSXMLNode* )_XMLNode;

@end // DictrSubEntry class
