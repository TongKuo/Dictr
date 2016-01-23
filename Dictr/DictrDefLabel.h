//
//  DictrDefLabel.h
//  Dictr
//
//  Created by Tong G. on 1/23/16.
//  Copyright © 2016 Tong Kuo. All rights reserved.
//

#import "DictrXMLObject.h"

// DictrDefLabel class
@interface DictrDefLabel : DictrXMLObject

@property ( strong, readonly ) NSString* name;
@property ( strong, readonly ) NSString* briefDescription;

@end // DictrDefLabel class
