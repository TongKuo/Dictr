//
//  DictrEntry.m
//  Dictr
//
//  Created by Tong G. on 1/7/16.
//  Copyright © 2016 Tong Kuo. All rights reserved.
//

#import "DictrEntry.h"

// Private Interfaces
@interface DictrEntry ()

// Public properties
@property ( strong, readwrite ) NSArray <__kindof DictrSubEntry*>* subEntries;

@property ( strong, readwrite ) NSArray <__kindof NSDictionary*>* topicDict;

@property ( strong, readwrite ) NSString* dictCode;
@property ( strong, readwrite ) NSString* label;
@property ( strong, readwrite ) NSURL* URL;
@property ( strong, readwrite ) NSString* ID;

// Private properties
@property ( strong, readwrite ) NSXMLNode* __entryContentXML;

@end // Private Interfaces

// DictrEntry class
@implementation DictrEntry

#pragma mark - Initializations

// Designated Initializer
- ( instancetype ) initWithJson: ( NSDictionary* )_JsonDict
    {
    if ( self = [ super initWithJson: _JsonDict ] )
        {
        NSArray <__kindof NSXMLNode*>* matchingNodes = nil;

        self.topicDict = DictrCocoaValueWhichHasBeenParsedOutOfJson( self->__jsonDict, @"topics" );

        self.dictCode = DictrCocoaValueWhichHasBeenParsedOutOfJson( self->__jsonDict, @"dictionaryCode" );
        self.label = DictrCocoaValueWhichHasBeenParsedOutOfJson( self->__jsonDict, @"entryLabel" );
        self.URL = [ NSURL URLWithString: DictrCocoaValueWhichHasBeenParsedOutOfJson( self->__jsonDict, @"entryUrl" ) ];
        self.ID = DictrCocoaValueWhichHasBeenParsedOutOfJson( self->__jsonDict, @"entryId" );

        NSError* error = nil;
        NSString* entryContentXMLString = DictrCocoaValueWhichHasBeenParsedOutOfJson( self->__jsonDict, @"entryContent" );
        if ( entryContentXMLString )
            {
            self.__entryContentXML =
                [ [ NSXMLDocument alloc ] initWithXMLString: entryContentXMLString options: NSXMLDocumentXMLKind error: &error ];

            if ( error )
                NSLog( @"%@", error );

            // Extracting the pos-block nodes
            matchingNodes = [ self.__entryContentXML nodesForXPath: @"//pos-block" error: nil ];

            NSMutableArray <__kindof DictrSubEntry*>* tmpEntries = [ NSMutableArray array ];
            if ( matchingNodes.count > 0 )
                {
                for ( NSXMLNode* _PosBlockNode in matchingNodes )
                    [ tmpEntries addObject: [ [ DictrSubEntry alloc ] initWithTitle: self.label xmlNode: _PosBlockNode ] ];
                }
            else
                [ tmpEntries addObject: [ [ DictrSubEntry alloc ] initWithTitle: self.label xmlNode: self.__entryContentXML ] ];

            self.subEntries = [ tmpEntries copy ];
            }
        }

    return self;
    }

@end // DictrEntry class
