//
//  DictrJsonObject.m
//  Dictr
//
//  Created by Tong G. on 1/7/16.
//  Copyright © 2016 Tong Kuo. All rights reserved.
//

#import "DictrJsonObject.h"

// DictrJsonObject class
@implementation DictrJsonObject

#pragma mark - Initializations

// Designated Initializer
- ( instancetype ) initWithJson: ( NSDictionary* )_JsonDict
    {
    if ( !( _JsonDict.count > 0 ) )
        return nil;

    if ( self = [ super init ] )
        self->__jsonDict = _JsonDict;

    return self;
    }

@end // DictrJsonObject class

// Utilities
id DictrCocoaValueWhichHasBeenParsedOutOfJson( NSDictionary* _JsonObject, NSString* _JsonPropertyKey )
    {
    id cocoaValue = _JsonObject[ _JsonPropertyKey ];

    if ( !cocoaValue || ( ( id )cocoaValue == [ NSNull null ] ) )
        return nil;

    return cocoaValue;
    }