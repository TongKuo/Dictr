//
//  DebugPlaygroundController.m
//  Dictr
//
//  Created by Tong G. on 1/30/16.
//  Copyright © 2016 Tong Kuo. All rights reserved.
//

#import "DebugPlaygroundController.h"

@interface DebugPlaygroundController ()

@end

@implementation DebugPlaygroundController

- ( void ) viewDidLoad
    {
    [ super viewDidLoad ];

//    NSURL* url = [ NSURL URLWithString: @"file:///EsquireTongG/tmp/do-entry.xml" ];
//    NSXMLDocument* doEntry = [ [ NSXMLDocument alloc ] initWithContentsOfURL: url options: NSXMLDocumentXMLKind error: nil ];

    NSError* err = nil;
    NSData* doEntryJsonData = [ NSData dataWithContentsOfFile: @"/Users/EsquireTongG/tmp/do-entry.json" options: 0 error: &err ];
    NSDictionary* doEntryJsonDict = [ NSJSONSerialization JSONObjectWithData: doEntryJsonData options: 0 error: nil ];

    self.entry = [ [ DictrEntry alloc ] initWithJson: doEntryJsonDict ];
    }

- ( void ) setRepresentedObject: ( id )_RepresentedObject
    {
    
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
