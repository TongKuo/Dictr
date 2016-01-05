//
//  DictrMainWindowController.m
//  Dictr
//
//  Created by Tong G. on 1/5/16.
//  Copyright © 2016 Tong Kuo. All rights reserved.
//

#import "DictrMainWindowController.h"

// Private Interfaces
@interface DictrMainWindowController ()

@end // Private Interfaces

// DictrMainWindowController class
@implementation DictrMainWindowController

#pragma mark - Initializations

- ( void ) windowDidLoad
    {
    [ super windowDidLoad ];

    self.window.titleVisibility = NSWindowTitleHidden;
    self.window.titlebarAppearsTransparent = YES;
    self.window.styleMask |= NSFullSizeContentViewWindowMask;
    
    // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
    }

@end // DictrMainWindowController class
