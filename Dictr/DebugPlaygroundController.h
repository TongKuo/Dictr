//
//  DebugPlaygroundController.h
//  Dictr
//
//  Created by Tong G. on 1/30/16.
//  Copyright © 2016 Tong Kuo. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@class DictrSubEntryView;

@interface DebugPlaygroundController : NSViewController
    {
@private
    DictrEntry __strong* __entry;
    }

@property ( strong, readwrite ) DictrEntry* entry;

@property ( strong, readonly ) DictrSubEntryView* subEntryBoardView;

@end
