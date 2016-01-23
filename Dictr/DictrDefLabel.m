//
//  DictrDefLabel.m
//  Dictr
//
//  Created by Tong G. on 1/23/16.
//  Copyright © 2016 Tong Kuo. All rights reserved.
//

#import "DictrDefLabel.h"

// Private Interfaces
@interface DictrDefLabel ()

@property ( strong, readwrite ) NSString* name;
@property ( strong, readwrite ) NSString* briefDescription;

@end // Private Interfaces

// DictrDefLabel class
@implementation DictrDefLabel

#pragma mark - Initializations

NSMutableDictionary static* sLabelsDB;
NSXMLDocument static* sSpareLabelsHTMLDoc;
NSDictionary static* sLabelsDict;

+ ( void ) initialize
    {
    sLabelsDict = @{ // Adjectives
                     @"adjective" : @[ @"<i>adjective</i>"
                                     , @"A word that describes a noun or pronoun." ]

                   , @"[after noun]" : @[ @"[after noun]"
                                        , @"An adjective that only follows a noun." ]

                   , @"[after verb]" : @[ @"[after verb]"
                                        , @"An adjective that only follows a verb." ]

                   , @"[before noun]" : @"An adjective that only goes before a noun."
                   , @"comparative" : @"The form of an adjective or adverb that expresses a difference in amount, number, degree, or quality."
                   , @"superlative" : @"The form of an adjective or adverb that expresses that the thing or person being described has more of the particular quality than anything or anyone else of the same type."
                   , @"[not gradable]" : @"An adjective that has no comparative or superlative form."

                     // Nouns
                   , @"noun" : @"A word that refers to a person, place or thing."
                   , @"[C]" : @"Countable noun: a noun that has a plural."
                   , @"[U]" : @"Uncountable or singular noun: a noun that has no plural."
                   , @"[S]" : @"A singular noun."
                   , @"plural" : @"The plural form of a noun."
                   , @"noun [plural]" : @"A noun that can only be used in the plural."
                   , @"[usually plural]" : @"A noun usually used in the plural."
                   , @"[usually singular]" : @"A countable noun usually used in the singular."
                   , @"[+ sing/pl verb]" : @"A noun that refers to a group of people acting collectively. When used in the singular it can be followed by either a singular or a plural verb in British English. In American English a singular verb is preferred."

                     // Verbs
                   , @"verb" : @"A word that describes an action, state or experience."
                   , @"[T]" : @"Transitive verb: a verb that has an object."
                   , @"[I]" : @"Intransitive verb: a verb that has no object."
                   , @"auxiliary verb" : @"<span>The verbs <color>be</color> <color>have</color> and <color>do</color></span>"
                   , @"" : @""
                   , @"" : @""
                   , @"" : @""
                   , @"" : @""
                   , @"" : @""
                   , @"" : @""
                   };
    }

- ( instancetype ) initWithXML: ( NSXMLNode* )_XMLNode
    {
    if ( ![ _XMLNode.name isEqualToString: @"gram" ] )
        return nil;

    if ( self = [ super initWithXML: _XMLNode ] )
        {
        NSArray* leafValues = kAllLeafNodeObjectValues( self->__xmlNode );

        if ( leafValues.count > 0 )
            self.name = [ leafValues componentsJoinedByString: @"" ];
        }

    return self;
    }

@end // DictrDefLabel class
