//
//  DictrJsonObject.h
//  Dictr
//
//  Created by Tong G. on 1/7/16.
//  Copyright © 2016 Tong Kuo. All rights reserved.
//

@import Foundation;

// DictrJsonObject class
@interface DictrJsonObject : NSObject
    {
@protected
    NSDictionary __strong* __jsonDict;
    }

#pragma mark - Initializations

// Designated Initializer
- ( instancetype ) initWithJson: ( NSDictionary* )_JsonDict;

@end // DictrJsonObject class

// Utilities
id DictrCocoaValueWhichHasBeenParsedOutOfJson( NSDictionary* _JsonObject, NSString* _JsonPropertyKey );