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

// DictrTranslator class
@interface DictrTranslator : NSObject <NSTextFieldDelegate>
    {
@private
    NSURL* __apiBaseURL;
    }

@property ( strong, readwrite ) NSString* accessKey;
@property ( assign, readwrite ) DictrCambridgeTranslatorType translatorType;

#pragma mark - Initializations

+ ( instancetype ) defaultTranslator;

@end // DictrTranslator class
