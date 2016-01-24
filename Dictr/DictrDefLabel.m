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

                   , @"[before noun]" : @[ @"[before noun]"
                                         , @"An adjective that only goes before a noun." ]

                   , @"comparative" : @[ @"comparative"
                                       , @"The form of an adjective or adverb that expresses a difference in amount, number, degree, or quality." ]

                   , @"superlative" : @[ @"superlative"
                                       , @"The form of an adjective or adverb that expresses that the thing or person being described has more of the particular quality than anything or anyone else of the same type." ]

                   , @"[not gradable]" : @[ @"[not gradable]"
                                          , @"An adjective that has no comparative or superlative form." ]

                     // Nouns
                   , @"noun" : @[ @"<i>noun</i>"
                                , @"A word that refers to a person, place or thing." ]

                   , @"[C]" : @[ @"[C]"
                               , @"Countable noun: a noun that has a plural." ]

                   , @"[U]" : @[ @"[U]"
                               , @"Uncountable or singular noun: a noun that has no plural." ]

                   , @"[S]" : @[ @"[S]"
                               , @"A singular noun." ]

                   , @"plural" : @[ @"<i>plural</i>"
                                  , @"The plural form of a noun." ]

                   , @"noun [plural]" : @[ @"<span><i>noun</i> [plural]</span>"
                                         , @"A noun that can only be used in the plural." ]

                   , @"[usually plural]" : @[ @"[usually plural]"
                                            , @"A noun usually used in the plural." ]

                   , @"[usually singular]" : @[ @"[usually singular]"
                                              , @"A countable noun usually used in the singular." ]

                   , @"[+ sing/pl verb]" : @[ @"[+ sing/pl verb]"
                                            , @"A noun that refers to a group of people acting collectively. When used in the singular it can be followed by either a singular or a plural verb in British English. In American English a singular verb is preferred." ]

                     // Verbs
                   , @"verb" : @[ @"<i>verb</i>"
                                , @"A word that describes an action, state or experience." ]

                   , @"[T]" : @[ @"[T]"
                               , @"Transitive verb: a verb that has an object." ]

                   , @"[I]" : @[ @"[I]"
                               , @"Intransitive verb: a verb that has no object." ]

                   , @"auxiliary verb" : @[ @"<i>auxiliary verb</i>"
                                          , @"<span>The verbs <color>be</color> <color>have</color> and <color>do</color></span>, which combine with other verbs to make different forms like <i>passives</i>, <i>questions</i> and the <i>continuous</i>." ]

                   , @"modal verb" : @[ @"<i>modal verb</i>"
                                      , @"<span>Verbs, such as <color>must</color> and <color>can</color>, that add meaning such as <i>certainty</i> and <i>obligation</i>.</span>" ]

                   , @"past simple" : @[ @"<i>past simple</i>"
                                       , @"<span>The past simple form of the verb (eat <color>ate</color> eaten).</span>" ]

                   , @"past participle" : @[ @"<i>past participle</i>"
                                           , @"<span>The past participle of the verb (eat ate <color>eaten</color>).</span>" ]

                   , @"present simple" : @[ @"<i>present simple</i>"
                                          , @"<span>The present participle of the verb (<color>tying</color> tied).</span>" ]

                   , @"phrasal verb" : @[ @"<i>phrasal verb</i>"
                                        , @"A verb followed by an adverb or a preposition." ]

                   , @"[L]" : @[ @"[L]"
                               , @"Linking verb: an intransitive verb that is followed by a noun or adjective that refers back to the subject of the sentence." ]

                   , @"[L only + adjective]" : @[ @"[L only + adjective]"
                                                , @"A linking verb only followed by an adjective." ]

                   , @"[L only + noun]" : @[ @"[L only + noun]"
                                           , @"A linking verb only followed by a noun." ]

                   , @"[+ adv/prep]" : @[ @"[+ adv/prep]"
                                        , @"A verb that must be followed by an adverb or preposition." ]

                   , @"[+ that clause]" : @[ @"<span>[+ <i>that</i> clause]</span>"
                                           , @"<span>A verb followed by a clause beginning with <i>that</i>.</span>" ]

                   , @"[+ question word]" : @[ @"[+ question word]"
                                             , @"A verb followed by a question word." ]

                   , @"[+ speech]" : @[ @"[+ speech]"
                                      , @"A verb used with direct speech." ]

                   , @"[+ to infinitive]" : @[ @"<span>[+ <i>to</i> infinitive]</span>"
                                             , @"<span>A verb followed by the infinitive with <i>to</i>.</span>" ]

                   , @"[+ infinitive without to]" : @[ @"<span>[+ infinitive without <i>to</i>]</span>"
                                                     , @"<span>A verb followed by the infinitive without <i>to</i>.</span>" ]

                   , @"[+ -ing] verb" : @[ @"<span>[+ <i>-ing</i>] verb</span>"
                                         , @"A verb followed by the -ing form of the verb." ]

                   , @"[+ not or so]" : @[ @"<span>[+ <i>not</i> or <i>so</i>]</span>"
                                         , @"<span>A verb followed immediately by <i>not</i> or <i>so</i> where these replace a clause.</span>" ]

                   , @"[+ two objects]" : @[ @"[+ two objects]"
                                           , @"A verb that has a direct and indirect object." ]

                   , @"[+ obj + adjective]" : @[ @"[+ obj + adjective]"
                                               , @"A verb with an object followed by an adjective." ]

                   , @"[+ obj + noun]" : @[ @"[+ obj + noun]"
                                          , @"A verb with an object followed by a noun." ]

                   , @"[+ obj + noun or adjective]" : @[ @"[+ obj + noun or adjective]"
                                                       , @"A verb with an object followed by a noun or adjective." ]

                   , @"[+ obj + as noun or adjective]" : @[ @"<span>[+ obj + <i>as</i> noun or adjective]</span>"
                                                          , @"<span>A verb with an object followed by <i>as</i> and a noun or an adjective.</span>" ]

                   , @"[+ obj + to be noun or adjective]" : @[ @"<span>[+ obj + <i>to be</i> noun or adjective]</span>"
                                                            , @"<span>A verb with an object followed by <i>to be</i> and a noun or an adjective.</span>" ]

                   , @"[+ obj + that clause]" : @[ @"<span>[+ obj + <i>that</i> clause]</span>"
                                                 , @"<span>A verb with an object followed by a <i>that</i> clause.</span>" ]

                   , @"[+ obj + to infinitive]" : @[ @"<span>[+ obj + <i>to</i> infinitive]</span>"
                                                   , @"<span>A verb with an object followed by an infinitive with <i>to</i>.</span>" ]

                   , @"[+ obj + infinitive without to]" : @[ @"<span>[+ obj + infinitive without <i>to</i></span>]"
                                                           , @"<span>A verb with an object followed by an infinitive without <i>to</i>.</span>" ]

                   , @"[+ obj + past participle]" : @[ @"[+ obj + past participle]"
                                                     , @"A verb with an object followed by a past participle." ]

                   , @"[+ obj + ing verb]" : @[ @"<span>[+ obj + <i>ing</i> verb]</span>"
                                              , @"<span>A verb with an object followed by the <i>-ing</i> form of a verb.</span>" ]

                   , @"[+ obj + question word]" : @[ @"[+ obj + question word]"
                                                   , @"A verb with an object followed by a question word." ]

                   , @"[usually passive]" : @[ @"[usually passive]"
                                             , @"A verb usually used in the passive." ]

                   , @"[not continuous]" : @[ @"[not continuous]"
                                            , @"A verb not used in the continuous form." ]

                     // Other labels
                   , @"adverb" : @[ @"<i>adverb</i>"
                                  , @"A word that gives information about a verb, adjective, another adverb, or a sentence." ]

                   , @"conjunction" : @[ @"<i>conjunction</i>"
                                       , @"<span>A word such as <color>and</color> or <color>although</color> used to link two parts of a sentence</span>" ]

                   , @"determiner" : @[ @"<span><i>determiner</i></span>"
                                      , @"<span>A word such as <color>the</color> or <color>this</color> used before a noun to show which particular example of a noun is being referred to.</span>" ]

                   , @"number" : @[ @"<i>number</i>"
                                  , @"A word that refers to a number." ]

                   , @"ordinal number" : @[ @"<i>ordinal number</i>"
                                          , @"A number such as 1st, 2nd, 3rd, 4th, that shows the position of something in a list of things." ]

                   , @"preposition" : @[ @"<i>preposition</i>"
                                       , @"A word that is used before a noun, a noun phrase, or a pronoun, connecting it to another word." ]

                   , @"predeterminer" : @[ @"<i>predeterminer</i>"
                                         , @"<span>A word such as <color>both</color> or <color>all</color> used before other determiners.</span>" ]

                   , @"pronoun" : @[ @"<i>pronoun</i>"
                                   , @"<span>A word such as <color>it</color>, or <color>mine</color> used to replace a noun.</span>" ]

                   , @"prefix" : @[ @"<i>prefix</i>"
                                  , @"<span>A letter or group of letters such as <color>un-</color>, <color>pre-</color> or <color>anti-</color> added to the beginning of a word to make a new word.</span>" ]

                   , @"suffix" : @[ @"<i>suffix</i>"
                                  , @"<span>A letter or group of letters such as <color>-less</color> or <color>-ment</color> added to the end of a word to make a new word.</span>" ]

                   , @"exclamation" : @[ @"<i>exclamation</i>"
                                       , @"<span>A word or expression such as <color>damn!</color> or <color>oh dear!</color> used to express strong feelings.</span>" ]

                   , @"[+ ing verb]" : @[ @"<span>[+ <i>ing</i> verb]</span>"
                                        , @"<span>A word or phrase followed by the <i>-ing</i> form of the verb.</span>" ]

                   , @"[+ to infinitive]" : @[ @"<span>[+ <i>to</i> infinitive]</span>"
                                             , @"<span>A word or phrase followed by the infinitive with to.</span>" ]

                   , @"[+ that]" : @[ @"<span>[+ <i>that</i>]</span>"
                                    , @"<span>A word or phrase followed by a clause beginning with <i>that</i>.</span>" ]

                   , @"[+ question word]" : @[ @"[+ question word]"
                                             , @"A word or phrase followed by a question word." ]

                   , @"[as form of address]" : @[ @"[as form of address]"
                                                , @"<span>A word or phrase such as <color>Mr</color> or <color>dear</color> used to address someone.</span>" ]
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
