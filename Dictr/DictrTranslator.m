//
//  DictrTranslator.m
//  Dictr
//
//  Created by Tong G. on 1/6/16.
//  Copyright © 2016 Tong Kuo. All rights reserved.
//

#import "DictrTranslator.h"

// DictrTranslator class
@implementation DictrTranslator

#pragma mark - Initializations

+ ( instancetype ) defaultTranslator
    {
    return [ [ self alloc ] init ];
    }

DictrTranslator static* sDefaultTranslator;
- ( instancetype ) init
    {
    if ( !sDefaultTranslator )
        if ( self = [ super init ] )
            sDefaultTranslator = self;

    return sDefaultTranslator;
    }

#pragma mark - Conforms to <NSTextFieldDelegate>

- ( void ) controlTextDidBeginEditing: ( NSNotification* )_Notif
    {
    NSLog( @"%@", _Notif );
    }

@end // DictrTranslator class
