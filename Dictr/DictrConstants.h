//
//  DictrConstants.h
//  Dictr
//
//  Created by Tong G. on 1/6/16.
//  Copyright © 2016 Tong Kuo. All rights reserved.
//

@import Foundation;

// UI Constants
extern CGFloat const DictrMainWindowMinHeight;
extern CGFloat const DictrSearchFieldFixedHeight;
extern CGFloat const DictrGapBetweenSearchFieldAndTop;

// Notification Names
extern NSString* const DictrTranslatorShouldBeginSearchingNotif;
extern NSString* const DictrTranslatorDidFinishSearchingNotif;
extern NSString* const DictrTranslatorDidBestMatchingNotif;
extern NSString* const DictrTranslatorShouldStopSearchingNotif;
extern NSString* const DictrTranslatorShouldClearSearchResultNotif;

// Notification Keys
extern NSString* const kSearchString;
extern NSString* const kError;
extern NSString* const kEntry;
extern NSString* const kResults;
extern NSString* const kOperation;

// Operations
extern NSString* const kReplaceOperation;
extern NSString* const kAppendOperation;