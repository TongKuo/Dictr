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
@property ( strong, readwrite ) NSString* pos;
@property ( strong, readwrite ) NSString* ipa;
@property ( strong, readwrite ) NSURL* UKPronunciation;
@property ( strong, readwrite ) NSURL* USPronunciation;

@property ( strong, readwrite ) NSArray <__kindof DictrDefBlock*>* defBlocks;
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

            NSXMLNode* node = self.__entryContentXML.rootDocument.rootElement;
            while ( ( node = [ node nextNode ] ) )
                {
                NSArray <__kindof NSXMLNode*>* attributes = nil;

                if ( [ node isKindOfClass: [ NSXMLElement class ] ] )
                    attributes = [ ( NSXMLElement* )node attributes ];

                // Extracting the pronunciation in UK & US
                //
                // Sample:
                //
                // <audio type="pronunciation" region="uk">
                //     <source type="audio/mpeg" src="https://dictionary.cambridge.org/media/english-chinese-simplified/uk_pron/u/ukw/ukwom/ukwoman009.mp3"></source>
                //     <source type="audio/ogg" src="https://dictionary.cambridge.org/media/english-chinese-simplified/uk_pron_ogg/u/ukw/ukwom/ukwoman009.ogg"></source>
                // </audio>
                // <audio type="pronunciation" region="us">
                //     <source type="audio/mpeg" src="https://dictionary.cambridge.org/media/english-chinese-simplified/us_pron/w/won/wonde/wonderful.mp3"></source>
                //     <source type="audio/ogg" src="https://dictionary.cambridge.org/media/english-chinese-simplified/us_pron_ogg/w/won/wonde/wonderful.ogg"></source>
                // </audio>
                if ( [ node.name isEqualToString: @"audio" ]
                        && [ attributes.firstObject.name isEqualToString: @"type" ]
                        && [ attributes.firstObject.objectValue isEqualToString: @"pronunciation" ]
                        && [ attributes.lastObject.name isEqualToString: @"region" ] )
                    {
                    NSXMLElement* mpegNode = ( NSXMLElement* )( node.children /* <source> */.firstObject );
                    NSArray <__kindof NSXMLNode*>* attrsOfMpegNode = mpegNode.attributes;

                    NSURL* mpegSrc = [ NSURL URLWithString: attrsOfMpegNode.lastObject.objectValue ];

                    if ( [ attributes.lastObject.objectValue isEqualToString: @"uk" ] )
                        self.UKPronunciation = mpegSrc;
                    else if ( [ attributes.lastObject.objectValue isEqualToString: @"us" ] )
                        self.USPronunciation = mpegSrc;
                    }
                }
            }
        }

    return self;
    }

@end // DictrEntry class
