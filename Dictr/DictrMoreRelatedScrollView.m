//
//  DictrMoreRelatedScrollView.m
//  Dictr
//
//  Created by Tong G. on 1/28/16.
//  Copyright © 2016 Tong Kuo. All rights reserved.
//

#import "DictrMoreRelatedScrollView.h"

// DictrMoreRelatedScrollView class
@implementation DictrMoreRelatedScrollView

#pragma mark - Initializations

- ( void ) awakeFromNib
    {
    [ [ NSNotificationCenter defaultCenter ]
        addObserver: self
           selector: @selector( __didFinishSearching: )
               name: DictrTranslatorDidFinishSearchingNotif
             object: nil ];
    }

- ( void ) __didFinishSearching: ( NSNotification* )_Notif
    {
    if ( !self->__results )
        self->__results = [ NSMutableOrderedSet orderedSet ];

    NSArray* resultsArr = _Notif.userInfo[ kResults ];
    NSString* operation = _Notif.userInfo[ kOperation ];

    if ( [ operation isEqualToString: kReplaceOperation ] )
        if ( self->__results.count > 0 )
            [ self->__results removeAllObjects ];

    if ( resultsArr.count > 0 )
        [ self->__results addObjectsFromArray: resultsArr ];
    }

#pragma mark - Drawing

- ( void ) drawRect: ( NSRect )_DirtyRect
    {
    [ super drawRect: _DirtyRect ];
    
    // Drawing code here.
    }

#pragma mark - Conforms to <NSTableViewDataSource>

- ( NSInteger ) numberOfRowsInTableView: ( NSTableView* )_TableView
    {
    return self->__results.count;
    }

- ( id )            tableView: ( NSTableView* )_TableView
    objectValueForTableColumn: ( NSTableColumn* )_TableColumn
                          row: ( NSInteger )_Row
    {
    return self->__results[ _Row ];
    }

#pragma mark - Conforms to <NSTableViewDelegate>

- ( NSView* ) tableView: ( NSTableView* )_TableView
     viewForTableColumn: ( NSTableColumn* )_TableColumn
                    row: ( NSInteger )_Row
    {
    NSTableCellView* resultView = [ _TableView makeViewWithIdentifier: _TableColumn.identifier owner: self ];

    NSDictionary* data = [ self tableView: _TableView objectValueForTableColumn: _TableColumn row: _Row ];
    [ resultView.textField setStringValue: data[ @"entryLabel" ] ];

    return resultView;
    }

@end // DictrMoreRelatedScrollView class
