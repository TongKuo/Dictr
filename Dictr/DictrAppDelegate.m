//
//  DictrAppDelegate.m
//  Dictr
//
//  Created by Tong G. on 1/5/16.
//  Copyright © 2016 Tong Kuo. All rights reserved.
//

#import "DictrAppDelegate.h"

// Private Interfaces
@interface DictrAppDelegate ()

- ( void ) __timerFireMethod: ( NSTimer* )_Timer;

@end // Private Interfaces

// DictrAppDelegate class
@implementation DictrAppDelegate

#pragma mark - Delegations

- ( void ) applicationDidFinishLaunching: ( NSNotification* )_Notif
    {
    // Insert code here to initialize your application
    }

- ( void ) applicationWillTerminate: ( NSNotification* )_Notif
    {
    // Insert code here to tear down your application
    }

#pragma mark - Conforms to <NSTextFieldDelegate>

- ( void ) controlTextDidChange: ( NSNotification* )_Notif
    {
    NSText* fieldEditor = _Notif.userInfo[ @"NSFieldEditor" ];
    NSString* searchValue = [ fieldEditor string ];

    if ( searchValue.length > 0 )
        {
        [ self->__searchTimer invalidate ];
        self->__searchTimer = [ NSTimer timerWithTimeInterval: ( NSTimeInterval ).6f
                                                       target: self
                                                     selector: @selector( __timerFireMethod: )
                                                     userInfo: @{ kSearchString : searchValue ?: @"" }
                                                      repeats: NO ];

        [ [ NSRunLoop currentRunLoop ] addTimer: self->__searchTimer forMode: NSDefaultRunLoopMode ];
        }
    // if user emptied the search field
    else if ( searchValue.length == 0 )
        {
        [ [ NSNotificationCenter defaultCenter ]
            postNotificationName: DictrTranslatorShouldClearSearchResultNotif
                          object: self
                        userInfo: nil ];
        }
    }

#pragma mark - Private Interfaces

- ( void ) __timerFireMethod: ( NSTimer* )_Timer
    {
    NSString* searchWord = _Timer.userInfo[ kSearchString ];
//    [ [ DictrTranslator defaultTranslator ] translateWordWithBestMatching: searchWord
//                                                                  success:
//        ^( NSXMLNode* _XMLData )
//            {
//            [ DictrBestMatchingCardsFactory makeCardsWithMaterial: _XMLData ];
////            NSLog( @"%@", [ _XMLData XMLStringWithOptions: NSXMLNodePrettyPrint ] );
//            [ [ NSNotificationCenter defaultCenter ] postNotificationName: DictrTranslatorDidBestMatchingNotif
//                                                                   object: self
//                                                                 userInfo: @{ kEntry : _XMLData ?: [ NSNull null ] } ];
//            } failure:
//                ^( NSError* _Error )
//                    {
//                    NSLog( @"%@", _Error );
//                    } ];

    [ [ DictrTranslator defaultTranslator ] translateWord: searchWord
                                                   cursor: 1
                                                  success:
        ^( NSDictionary* _MatchesJSON )
            {
//            NSLog( @"%@", _MatchesJSON );

            NSArray <__kindof NSDictionary*>* results = _MatchesJSON[ @"results" ];

            [ [ NSNotificationCenter defaultCenter ]
                postNotificationName: DictrTranslatorDidFinishSearchingNotif
                              object: self
                            userInfo: @{ kResults : results ?: @[]
                                       , kOperation : kReplaceOperation
                                       } ];
            } failure:
                ^( NSError* _Error )
                    {
                    NSLog( @"%@", _Error );
                    } ];

    [ self->__searchTimer invalidate ];
    }

@end // DictrAppDelegate class
