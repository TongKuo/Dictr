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

            NSUInteger countOfPosBlock = 0;
            NSXMLNode* node = self.__entryContentXML;
            NSMutableArray <__kindof DictrSubEntry*>* tmpEntries = [ NSMutableArray array ];
            while ( ( node = [ node nextNode ] ) )
                {
                if ( [ node.name isEqualToString: @"pos-block" ] )
                    {
                    [ tmpEntries addObject: [ [ DictrSubEntry alloc ] initWithTitle: self.label xmlNode: node ] ];
                    countOfPosBlock++;
                    }
                }

            if ( countOfPosBlock == 0 )
                [ tmpEntries addObject: [ [ DictrSubEntry alloc ] initWithTitle: self.label xmlNode: self.__entryContentXML ] ];

            self.subEntries = [ tmpEntries copy ];
            }
        }

    return self;
    }

@end // DictrEntry class
