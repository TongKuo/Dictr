//
//  DictrDefBlock.h
//  Dictr
//
//  Created by Tong G. on 1/7/16.
//  Copyright © 2016 Tong Kuo. All rights reserved.
//

#import "DictrXMLObject.h"

// DictrDefBlock class
@interface DictrDefBlock : DictrXMLObject

@property ( strong, readonly ) NSString* level;
@property ( strong, readonly ) NSString* definition;

@end // DictrDefBlock class
