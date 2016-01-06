//
//  DictrMainContentViewController.h
//  Dictr
//
//  Created by Tong G. on 1/5/16.
//  Copyright © 2016 Tong Kuo. All rights reserved.
//

@import Cocoa;

// DictrMainContentViewController class
@interface DictrMainContentViewController : NSViewController

#pragma mark - Outlets

@property ( weak ) IBOutlet NSTextField* searchField;
@property ( weak ) IBOutlet NSScrollView* moreRelatedEntriesScrollView;
@property ( weak ) IBOutlet NSButton* showTranslateIntoButton;

@end // DictrMainContentViewController class

