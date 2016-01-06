//
//  DictrTranslator.m
//  Dictr
//
//  Created by Tong G. on 1/6/16.
//  Copyright © 2016 Tong Kuo. All rights reserved.
//

#import "DictrTranslator.h"

// Private Interfaces
@interface DictrTranslator ()

@property ( strong, readonly ) NSString* __dictCode;

@end // Private Interfaces

// DictrTranslator class
@implementation DictrTranslator

#pragma mark - Initializations

+ ( instancetype ) defaultTranslator
    {
    return [ [ self alloc ] init ];
    }

DictrTranslator static* sDefaultTranslator;
- ( instancetype ) init
    {
    if ( !sDefaultTranslator )
        {
        if ( self = [ super init ] )
            {
            self->__apiBaseURL = [ NSURL URLWithString: @"https://dictionary.cambridge.org/api/v1/" ];

            self.accessKey = @"rv88bp4e1EKjDNMZKOuO6nex5Wa5mq1ykQtBcT8bldDM10SjTnMEaOPBKZpWAzC4";
            self.translatorType = DictrCambridgeEnglish2English;

            NSURLSessionConfiguration* config = [ NSURLSessionConfiguration defaultSessionConfiguration ];
            [ config setHTTPAdditionalHeaders: @{ @"accessKey" : self.accessKey
                                                , @"Accept" : @"application/json"
                                                } ];

            self->__httpSessionManager = [ [ AFHTTPSessionManager alloc ] initWithBaseURL: self->__apiBaseURL sessionConfiguration:config ];
            self->__httpSessionManager.responseSerializer = [ AFJSONResponseSerializer serializer ];

            sDefaultTranslator = self;
            }
        }

    return sDefaultTranslator;
    }

#pragma mark - Dictionary Actions

- ( void ) translateWordWithBestMatching: ( NSString* )_Word
                                 success: ( DictrGeneralSuccessBlockType )_SuccessBlock
                                 failure: ( DictrGeneralFailureBlockType )_FailureBlock
    {
    NSParameterAssert( ( _Word.length ) > ( 0 ) );

    [ self stopTranslating ];
    [ self->__httpSessionManager GET: [ NSString stringWithFormat: @"dictionaries/%@/search/first", self.__dictCode ]
                          parameters: @{ @"format" : @"xml"
                                       , @"q" : _Word
                                       }
                             success:
        ^( NSURLSessionDataTask* _Nonnull _Task, id  _Nonnull _ResponseObject )
            {
            NSError* error = nil;
            NSXMLDocument* xmlDoc =
                [ [ NSXMLDocument alloc ] initWithXMLString: _ResponseObject[ @"entryContent" ] options: NSXMLDocumentXMLKind error: &error ];

            NSLog( @"🍉%p", xmlDoc.rootElement );
            NSLog( @"🍓%p", xmlDoc.rootDocument.rootElement );

            if ( _SuccessBlock )
                _SuccessBlock( xmlDoc );

            if ( error )
                if ( _FailureBlock )
                    _FailureBlock( error );
            } failure:
                ^( NSURLSessionDataTask* _Nonnull _Task, NSError* _Nonnull _Error )
                    {
                    if ( _FailureBlock )
                        _FailureBlock( _Error );
                    } ];
    }

- ( void ) stopTranslating
    {
    [ self->__httpSessionManager.operationQueue cancelAllOperations ];
    }

#pragma mark - Private Interfaces

@dynamic __dictCode;

- ( NSString* ) __dictCode
    {
    NSString* dictCode = nil;

    switch ( self.translatorType )
        {
        // Cambridge Advanced Learner's Dictionary
        case DictrCambridgeEnglish2English: dictCode = @"british"; break;

        // English-Arabic Dictionary
        case DictrCambridgeEnglish2Arabic: dictCode = @"english-arabic"; break;

        // English-Catalan Dictionary
        case DictrCambridgeEnglish2Catalan: dictCode = @"english-catalan"; break;

        // English-Italian Dictionary
        case DictrCambridgeEnglish2Italian: dictCode = @"english-italian"; break;

        // English-Japanese Dictionary
        case DictrCambridgeEnglish2Japanese: dictCode = @"english-japanese"; break;

        // English-Korean Dictionary
        case DictrCambridgeEnglish2Korean: dictCode = @"english-korean"; break;

        // English-Portuguese Dictionary
        case DictrCambridgeEnglish2Portuguese: dictCode = @"english-portuguese"; break;

        // Cambridge Learner's Dictionary English-Polish
        case DictrCambridgeEnglish2Polish: dictCode = @"english-polish"; break;

        // Cambridge Learner's Dictionary English-Russian
        case DictrCambridgeEnglish2Russian: dictCode = @"english-russian"; break;

        // Cambridge Advanced Learner's Dictionary English-Chinese (Simplified)
        case DictrCambridgeEnglish2SimplifiedChinese: dictCode = @"english-chinese-simplified"; break;

        // Cambridge Advanced Learner's Dictionary English-Chinese (Traditional)
        case DictrCambridgeEnglish2TranditionalChinese: dictCode = @"english-chinese-traditional"; break;
        }

    return dictCode;
    }

@end // DictrTranslator class
