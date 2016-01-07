//
//  DictrEntry.h
//  Dictr
//
//  Created by Tong G. on 1/7/16.
//  Copyright © 2016 Tong Kuo. All rights reserved.
//

#import "DictrJsonObject.h"

@class DictrDefBlock;

// DictrEntry class
@interface DictrEntry : DictrJsonObject

@property ( strong, readonly ) NSString* pos;

@property ( strong, readonly ) NSURL* UKPronunciation;
@property ( strong, readonly ) NSURL* USPronunciation;

@property ( strong, readonly ) NSString* ipa;

@property ( strong, readonly ) NSArray <__kindof DictrDefBlock*>* defBlocks;


@end // DictrEntry class
