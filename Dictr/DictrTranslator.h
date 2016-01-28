//
//  DictrTranslator.h
//  Dictr
//
//  Created by Tong G. on 1/6/16.
//  Copyright © 2016 Tong Kuo. All rights reserved.
//

@import Foundation;

typedef NS_ENUM( NSUInteger, DictrCambridgeTranslatorType )
    { DictrCambridgeEnglish2English
    , DictrCambridgeEnglish2Arabic
    , DictrCambridgeEnglish2Catalan
    , DictrCambridgeEnglish2Italian
    , DictrCambridgeEnglish2Japanese
    , DictrCambridgeEnglish2Korean
    , DictrCambridgeEnglish2Portuguese
    , DictrCambridgeEnglish2Polish
    , DictrCambridgeEnglish2Russian
    , DictrCambridgeEnglish2SimplifiedChinese
    , DictrCambridgeEnglish2TranditionalChinese
    };

typedef void ( ^DictrGeneralSuccessBlockType )( NSXMLNode* _XMLData );
typedef void ( ^DictrGeneralFailureBlockType )( NSError* _Error );

// DictrTranslator class
@interface DictrTranslator : NSObject <NSTextFieldDelegate>
    {
@private
    NSURL* __apiBaseURL;

    AFHTTPSessionManager* __httpSessionManager;
    }

@property ( strong, readwrite ) NSString* accessKey;
@property ( assign, readwrite ) DictrCambridgeTranslatorType translatorType;

#pragma mark - Initializations

+ ( instancetype ) defaultTranslator;

#pragma mark - Dictionary Actions

- ( void ) translateWord: ( NSString* )_Word
                  cursor: ( NSUInteger )_Cursor
                 success: ( void (^)( NSDictionary* _MatchedJSON ) )_SuccessBlock
                 failure: ( DictrGeneralFailureBlockType )_FailureBlock;

- ( void ) translateWordWithBestMatching: ( NSString* )_Word
                                 success: ( DictrGeneralSuccessBlockType )_SuccessBlock
                                 failure: ( DictrGeneralFailureBlockType )_FailureBlock;

- ( void ) stopTranslating;

@end // DictrTranslator class
