//
//  DictrProtocols.h
//  Dictr
//
//  Created by Tong G. on 1/30/16.
//  Copyright © 2016 Tong Kuo. All rights reserved.
//

@import Cocoa;

// DictrSubEntryWrapper protocol
@protocol DictrSubEntryWrapper <NSObject>

#pragma mark - Initializations
- ( instancetype ) initWithDictrSubEntry: ( DictrSubEntry* )_DictrSubEntry;

#pragma mark - Dynamic Properties
@property ( strong, readwrite ) DictrSubEntry* dictSubEntry;

@end // DictrSubEntryWrapper protocol
