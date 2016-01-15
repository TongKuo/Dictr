//
//  DictrExample.h
//  Dictr
//
//  Created by Tong G. on 1/7/16.
//  Copyright © 2016 Tong Kuo. All rights reserved.
//

#import "DictrXMLObject.h"

// DictrExample class
@interface DictrExample : DictrXMLObject

@property ( strong, readonly ) NSAttributedString* example;
@property ( strong, readonly ) NSAttributedString* translationOfExample;
@property ( strong, readonly ) NSString* languageOfTranslation;

@end // DictrExample class
