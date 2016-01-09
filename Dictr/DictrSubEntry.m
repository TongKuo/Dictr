//
//  DictrSubEntry.m
//  Dictr
//
//  Created by Tong G. on 1/7/16.
//  Copyright © 2016 Tong Kuo. All rights reserved.
//

#import "DictrSubEntry.h"

// Private Interfaces
@interface DictrSubEntry ()

// Public properties
@property ( strong, readwrite ) NSString* title;

@property ( strong, readwrite ) NSString* pos;
@property ( strong, readwrite ) NSString* UKIpa;
@property ( strong, readwrite ) NSString* USIpa;
@property ( strong, readwrite ) NSURL* UKPronunciation;
@property ( strong, readwrite ) NSURL* USPronunciation;

@property ( strong, readwrite ) NSArray <__kindof DictrDefBlock*>* defBlocks;

@end // Private Interfaces

// DictrSubEntry class
@implementation DictrSubEntry

#pragma mark - Initializations

- ( instancetype ) initWithTitle: ( NSString* )_Title
                         xmlNode: ( NSXMLNode* )_XMLNode
    {
    if ( self = [ super initWithXML: _XMLNode ] )
        {
        self.title = _Title;

        NSArray <__kindof NSXMLNode*>* matchingNodes = nil;

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
        NSString* pronAudiosXPathTemplate =
            @"descendant-or-self::audio[@type='pronunciation' and @region='%@']"
             "/descendant::source[@type=\"audio/mpeg\"]";

        matchingNodes = [ self->__xmlNode nodesForXPath: [ NSString stringWithFormat: pronAudiosXPathTemplate, @"uk" ] error: nil ];
        self.UKPronunciation = [ NSURL URLWithString: [ ( NSXMLElement* )( matchingNodes.firstObject ) attributeForName: @"src" ].objectValue ];

        matchingNodes = [ self->__xmlNode nodesForXPath: [ NSString stringWithFormat: pronAudiosXPathTemplate, @"us" ] error: nil ];
        self.USPronunciation = [ NSURL URLWithString: [ ( NSXMLElement* )( matchingNodes.firstObject ) attributeForName: @"src" ].objectValue ];

        // Extracting the IPA
        matchingNodes = [ self->__xmlNode nodesForXPath: @"//pron" error: nil ];
//        matchingNodes = [ self->__xmlNode nodesForXPath: @"//pron/descendant-or-self::text()" error: nil ];

        for ( NSXMLNode* _Node in matchingNodes )
            {
            NSUInteger countOfTextNodes = 0;
            NSUInteger count = _Node.childCount;
            for ( NSXMLNode* subNode in _Node.children )
                if ( subNode.kind == NSXMLTextKind )
                    countOfTextNodes++;

            NSLog( @"%ld", countOfTextNodes );

            matchingNodes = [ _Node nodesForXPath: @"descendant-or-self::text()" error: nil ];
//            NSLog( @"%@", matchingNodes );
            }

        NSLog( @"%@", matchingNodes );

//        NSXMLNode* node = self->__xmlNode;
//        while ( ( node = [ node nextNode ] ) )
//            {
//            NSArray <__kindof NSXMLNode*>* attributes = nil;
//
//            if ( [ node isKindOfClass: [ NSXMLElement class ] ] )
//                attributes = [ ( NSXMLElement* )node attributes ];
//
//            if ( [ node.name isEqualToString: @"audio" ]
//                    && [ attributes.firstObject.name isEqualToString: @"type" ]
//                    && [ attributes.firstObject.objectValue isEqualToString: @"pronunciation" ]
//                    && [ attributes.lastObject.name isEqualToString: @"region" ] )
//                {
//                NSXMLElement* mpegNode = ( NSXMLElement* )( node.children /* <source> */.firstObject );
//                NSArray <__kindof NSXMLNode*>* attrsOfMpegNode = mpegNode.attributes;
//
//                NSURL* mpegSrc = [ NSURL URLWithString: attrsOfMpegNode.lastObject.objectValue ];
//
//                if ( [ attributes.lastObject.objectValue isEqualToString: @"uk" ] )
//                    self.UKPronunciation = mpegSrc;
//                else if ( [ attributes.lastObject.objectValue isEqualToString: @"us" ] )
//                    self.USPronunciation = mpegSrc;
//                }
//
//            NSMutableString* ipaString = [ NSMutableString string ];
//            if ( [ node.name isEqualToString: @"pron" ] )
//                {
//                NSXMLNode* ipaNode = node;
//                while ( ( ipaNode = [ ipaNode nextNode ] ) )
//                    {
//                    [ ipaString appendString: ipaNode.objectValue ];
//
//                    if ( ipaNode == node.nextSibling )
//                        break;
//                    }
//                }
//
//            self.UKIpa = ipaString;
//            NSLog( @"%@", self.UKIpa );
//            }
        }

    return self;
    }

@end // DictrSubEntry class
