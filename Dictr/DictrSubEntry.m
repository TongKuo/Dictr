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
            @"descendant-or-self::audio[@type='pronunciation' and @region='%@']"
             "/descendant::source[@type=\"audio/mpeg\"]";

        matchingNodes = [ self->__xmlNode nodesForXPath: [ NSString stringWithFormat: pronAudiosXPathTemplate, @"uk" ] error: nil ];
        self.UKPronunciation = [ NSURL URLWithString: [ ( NSXMLElement* )( matchingNodes.firstObject ) attributeForName: @"src" ].objectValue ];

        matchingNodes = [ self->__xmlNode nodesForXPath: [ NSString stringWithFormat: pronAudiosXPathTemplate, @"us" ] error: nil ];
        self.USPronunciation = [ NSURL URLWithString: [ ( NSXMLElement* )( matchingNodes.firstObject ) attributeForName: @"src" ].objectValue ];

        // Extracting the IPA
        matchingNodes = [ self->__xmlNode nodesForXPath: @"//pron" error: nil ];

        NSOrderedSet* uniquedMatchingNodes = [ NSOrderedSet orderedSetWithArray: matchingNodes ];

        NSMutableOrderedSet* tmpIPAs = [ NSMutableOrderedSet orderedSet ];
        for ( NSXMLNode* _Node in uniquedMatchingNodes )
            {
            NSUInteger countOfTextNodes = kCountOfSomeKindOfChildren( _Node, NSXMLTextKind, YES );
            NSArray <__kindof NSXMLNode*>* textNodes = [ _Node nodesForXPath: @"descendant-or-self::text()" error: nil ];

            NSString* ipaString =
                [ [ textNodes subarrayWithRange: NSMakeRange( 0, countOfTextNodes ) ] componentsJoinedByString: @"" ];

            if ( ipaString )
                [ tmpIPAs addObject: ipaString ];
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
