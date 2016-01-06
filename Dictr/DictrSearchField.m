//
//  DictrSearchField.m
//  Dictr
//
//  Created by Tong G. on 1/6/16.
//  Copyright © 2016 Tong Kuo. All rights reserved.
//

#import "DictrSearchField.h"

// DictrSearchField class
@implementation DictrSearchField

- ( void ) awakeFromNib
    {
    [ self setDelegate: [ NSApp delegate ] ];
    }

@end // DictrSearchField class
