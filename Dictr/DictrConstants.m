//
//  DictrConstants.m
//  Dictr
//
//  Created by Tong G. on 1/6/16.
//  Copyright © 2016 Tong Kuo. All rights reserved.
//

#import "DictrConstants.h"

// UI Constants
CGFloat const DictrMainWindowMinHeight = 480.f;

CGFloat const DictrSearchFieldFixedHeight = 80.f;
CGFloat const DictrGapBetweenSearchFieldAndTop = 0.f;

// Notification Names
NSString* const DictrTranslatorShouldBeginSearchingNotif = @"Dictr.TranslatorShouldBeginSearching.Notif";
NSString* const DictrTranslatorDidFinishSearchingNotif = @"Dictr.TranslatorDidFinishSearching.Notif";
NSString* const DictrTranslatorDidBestMatchingNotif = @"Dictr.TranslatorDidBestMatching.Notif";
NSString* const DictrTranslatorShouldStopSearchingNotif = @"Dictr.TranslatorShouldStopSearching.Notif";
NSString* const DictrTranslatorShouldClearSearchResultNotif = @"Dictr.TranslatorShouldClearSearchResult.Notif";

// Notification Keys
NSString* const kSearchString = @"kSearchString";
NSString* const kError = @"kError";
NSString* const kEntry = @"kEntry";
NSString* const kResults = @"kResults";
NSString* const kOperation = @"kOperation";

// Operations
NSString* const kReplaceOperation = @"kReplaceOperation";
NSString* const kAppendOperation = @"kAppendOperation";