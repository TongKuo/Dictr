//
//  DebugPlaygroundController.m
//  Dictr
//
//  Created by Tong G. on 1/30/16.
//  Copyright © 2016 Tong Kuo. All rights reserved.
//

#import "DebugPlaygroundController.h"
#import "DictrSubEntryView.h"

@interface DebugPlaygroundController ()

@property ( strong, readwrite ) DictrSubEntryView* subEntryBoardView;

@end

@implementation DebugPlaygroundController

- ( void ) viewDidLoad
    {
    [ super viewDidLoad ];

    NSError* err = nil;
    NSData* doEntryJsonData = [ NSData dataWithContentsOfFile: @"/Users/EsquireTongG/tmp/do-entry.json" options: 0 error: &err ];
    NSDictionary* doEntryJsonDict = [ NSJSONSerialization JSONObjectWithData: doEntryJsonData options: 0 error: nil ];

    self.entry = [ [ DictrEntry alloc ] initWithJson: doEntryJsonDict ];
    }

- ( void ) setRepresentedObject: ( id )_RepresentedObject
    {
    DictrSubEntry* subEntry = self.entry.subEntries.firstObject;

    if ( !self.subEntryBoardView )
        {
        self.subEntryBoardView = [ [ DictrSubEntryView alloc ] initWithDictrSubEntry: subEntry ];
        [ self.view addSubview: self.subEntryBoardView ];
        [ self.subEntryBoardView autoPinEdgesToSuperviewEdges ];
        }

    [ self.subEntryBoardView setDictSubEntry: subEntry ];
    }

@dynamic entry;

- ( void ) setEntry: ( DictrEntry* )_Entry
    {
    self->__entry = _Entry;
    [ self setRepresentedObject: self->__entry ];
    }

- ( DictrEntry* ) entry
    {
    return self->__entry;
    }

@end
