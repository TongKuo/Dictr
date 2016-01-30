//
//  DebugPlaygroundController.h
//  Dictr
//
//  Created by Tong G. on 1/30/16.
//  Copyright © 2016 Tong Kuo. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@class DictrSubentryView;

@interface DebugPlaygroundController : NSViewController
    {
@private
    DictrEntry __strong* __entry;
    }

@property ( strong, readwrite ) DictrEntry* entry;

@property ( strong, readonly ) DictrSubentryView* subEntryBoardView;

@end
