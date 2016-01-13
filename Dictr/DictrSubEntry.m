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

@property ( strong, readwrite ) NSURL* UKPronunciation;
@property ( strong, readwrite ) NSURL* USPronunciation;

@property ( strong, readwrite ) NSOrderedSet <__kindof NSString*>* IPAs;

@property ( strong, readwrite ) NSOrderedSet <__kindof DictrSenseBlock*>* senseBlocks;

@end // Private Interfaces

static NSUInteger kCountOfSomeKindOfChildren( NSXMLNode* _ParentNode
                                            , NSXMLNodeKind _NodeKind
                                            , BOOL _DoesRecurse )
    {
    NSUInteger count = 0;

    if ( _ParentNode.childCount > 0 )
        {
        for ( NSXMLNode* _ChildNode in _ParentNode.children )
            {
            if ( _ChildNode.kind == _NodeKind )
                count++;

            if ( _DoesRecurse )
                count += kCountOfSomeKindOfChildren( _ChildNode, _NodeKind, YES );
            }
        }

    return count;
    }

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
            @"descendant-or-self::audio[@type='pronunciation' and @region='%@']";

        NSString* posXPathExpr = @"descendant-or-self::info/posgram/pos";
        NSString* pronXPathExpr = @"descendant-or-self::pron";

        matchingNodes = [ self->__xmlNode nodesForXPath:
            [ NSString stringWithFormat: @"%@ | %@ | %@ | %@"
                                       , [ NSString stringWithFormat: pronAudiosXPathTemplate, @"uk" ]
                                       , [ NSString stringWithFormat: pronAudiosXPathTemplate, @"us" ]
                                       , posXPathExpr
                                       , pronXPathExpr
                                       ] error: nil ];

        NSMutableOrderedSet* tmpIPAs = [ NSMutableOrderedSet orderedSet ];
        for ( NSXMLNode* _Node in matchingNodes )
            {
            NSString* nodeName = _Node.name;
            NSString* nodeObjectValue = _Node.objectValue;

            // Extracting the word that refers to a person, place, idea, event or thing.
            // (e.g. noun, verb)
            if ( [ nodeName isEqualToString: @"pos" ] )
                self.pos = nodeObjectValue;

            // Extracting the British/American English pronunciation
            else if ( [ nodeName isEqualToString: @"audio" ] )
                {
                NSXMLElement* srcNode = [ _Node nodesForXPath: @"child::source[@type=\"audio/mpeg\"]" error: nil ].firstObject;
                NSString* tmpPronSrc = [ srcNode attributeForName: @"src" ].objectValue;
                NSURL* tmpPronURL = [ NSURL URLWithString: tmpPronSrc ];

                NSString* region = [ ( NSXMLElement* )_Node attributeForName: @"region" ].objectValue;
                if ( [ region isEqualToString: @"uk" ] )
                    self.UKPronunciation = tmpPronURL;
                else if ( [ region isEqualToString: @"us" ] )
                    self.USPronunciation = tmpPronURL;
                }

            // Extracting the IPA
            else if ( [ nodeName isEqualToString: @"pron" ] )
                {
                NSUInteger countOfTextNodes = kCountOfSomeKindOfChildren( _Node, NSXMLTextKind, YES );
                NSArray <__kindof NSXMLNode*>* textNodes = [ _Node nodesForXPath: @"descendant-or-self::text()" error: nil ];

                NSString* ipaString =
                    [ [ textNodes subarrayWithRange: NSMakeRange( 0, countOfTextNodes ) ] componentsJoinedByString: @"" ];

                if ( ipaString )
                    [ tmpIPAs addObject: ipaString ];
                }
            }

        self.IPAs = [ tmpIPAs copy ];

        #if DEBUG // DEBUG
        NSLog( @"Count: %ld %@", self.IPAs.count, self );
        for ( NSString* _IPA in self.IPAs )
            NSLog( @"%@", _IPA );

        NSLog( @"======" );
        #endif

        // Extracting the def-block nodes

        // To obtain all the def-block nodes that are not descendants of nodes phrase-block
        NSString* defBlockXPathExpr = @"descendant-or-self::def-block[not(ancestor::phrase-block)]";
        // To obtain all the phrase-block nodes
        NSString* phraseBlockXPathExpr = @"descendant-or-self::phrase-block";

        matchingNodes = [ self->__xmlNode nodesForXPath:
            [ NSString stringWithFormat: @"%@ | %@", defBlockXPathExpr, phraseBlockXPathExpr ] error: nil ];

        NSMutableOrderedSet* tmpSenseBlocks = [ NSMutableOrderedSet orderedSet ];
        for ( NSXMLNode* _SenseBlockNode in matchingNodes )
            {
            Class senseClass = nil;

            if ( [ _SenseBlockNode.name isEqualToString: @"def-block" ] )
                senseClass = [ DictrDefBlock class ];
            else if ( [ _SenseBlockNode.name isEqualToString: @"phrase-block" ] )
                senseClass = [ DictrPhraseBlock class ];

            [ tmpSenseBlocks addObject: [ [ senseClass alloc ] initWithXML: _SenseBlockNode ] ];
            }

        self.senseBlocks = [ tmpSenseBlocks copy ];
        }

    return self;
    }

@end // DictrSubEntry class
