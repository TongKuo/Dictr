/*
 * Copyright (c) 2012, IDM
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without modification, are permitted
 * provided that the following conditions are met:
 *     * Redistributions of source code must retain the above copyright notice, this list of
 *       conditions and the following disclaimer.
 *     * Redistributions in binary form must reproduce the above copyright notice, this list
 *       of conditions and the following disclaimer in the documentation and/or other materials
 *       provided with the distribution.
 *     * Neither the name of the IDM nor the names of its contributors may be used to endorse or
 *       promote products derived from this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR
 * IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND
 * FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR
 * CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
 * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
 * DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
 * WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN
 * ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 *
 */

#import "SkPublishAPI.h"

@implementation SkPublishAPI

@synthesize accessKey;
@synthesize baseUrl;
@synthesize requestHandler;



-(SkPublishAPI*) initWithUrlAndAcessKey : (NSString*) url : (NSString*) key {
    [self setBaseUrl:url];
    [self setAccessKey:key];

    return self;
}


//-(void) dealloc {
//    [super dealloc];
//}

-(NSString*) baseUrl {
    return [self valueForKey:@"baseUrl"];
}

-(NSString*) didYouMean : (NSString*) code : (NSString*) searchWord : (NSNumber*) entryNumber {
    NSMutableString *uri = [[NSMutableString alloc] initWithString:baseUrl];

    if(![self isValidDictionaryCode: code])
        return NULL;

    [uri appendString:[NSString stringWithFormat:@"dictionaries/%@/search/didyoumean?q=%@", code,
                       [self encodeString:searchWord:NSUTF8StringEncoding]]];

    char c = '&';
    if(entryNumber != NULL)
    {
        [uri appendString:[NSString stringWithFormat:@"%centrynumber=%d", c, [entryNumber intValue]]];
        c = '&';
    }

    NSMutableURLRequest *request = [self prepareGetRequest:uri];

    NSData *response = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    NSString *resData = [[NSString alloc] initWithData:response encoding:NSUTF8StringEncoding];

    return resData;
};

-(NSString*) getDictionaries {
    NSMutableURLRequest *request = [self prepareGetRequest:[NSString stringWithFormat:@"%@dictionaries", baseUrl]];

    NSData *response = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    NSString *resData = [[NSString alloc] initWithData:response encoding:NSUTF8StringEncoding];

    return resData;
}

-(NSString*) getDictionary : (NSString*) code {
    if(![self isValidDictionaryCode: code])
        return NULL;

    NSMutableURLRequest *request = [self prepareGetRequest:[NSString stringWithFormat:@"%@dictionaries/%@", baseUrl, code]];

    NSData *response = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    NSString *resData = [[NSString alloc] initWithData:response encoding:NSUTF8StringEncoding];

    return resData;
}

-(NSString*) getEntry : (NSString*) code : (NSString*) entry : (NSString*) format {
    NSMutableString *uri = [[NSMutableString alloc] initWithString:baseUrl];

    if(![self isValidDictionaryCode: code])
        return NULL;

    [uri appendString:[NSString stringWithFormat:@"dictionaries/%@/entries/%@", code, [self encodeString:entry:NSUTF8StringEncoding]]];

    char c = '?';
    if(format != NULL)
    {
        if(![self isValidEntryFormat: format])
            return NULL;
        [uri appendString:[NSString stringWithFormat:@"%cformat=%@", c, format]];
        c = '&';
    }

    NSMutableURLRequest *request = [self prepareGetRequest:uri];

    NSData *response = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    NSString *resData = [[NSString alloc] initWithData:response encoding:NSUTF8StringEncoding];

    return resData;
}

-(NSString*) getEntryPronunciations : (NSString*) code : (NSString*) entry : (NSString*) lang {
    NSMutableString *uri = [[NSMutableString alloc] initWithString:baseUrl];

    if(![self isValidDictionaryCode: code])
        return NULL;

    [uri appendString:[NSString stringWithFormat:@"dictionaries/%@/entries/%@/pronunciations", code,
                       [self encodeString:entry:NSUTF8StringEncoding]]];

    char c = '?';
    if(lang){
        if(![self isValidEntryLang: lang])
            return NULL;
        [uri appendString:[NSString stringWithFormat:@"%clang=%@", c, lang]];
        c = '&';
    }

    NSMutableURLRequest *request = [self prepareGetRequest:uri];
    return NULL;

    NSData *response = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    NSString *resData = [[NSString alloc] initWithData:response encoding:NSUTF8StringEncoding];

    return resData;
}

-(NSString*) getNearbyEntries : (NSString*) code : (NSString*) entry : (NSNumber*) entryNumber {
    NSMutableString *uri = [[NSMutableString alloc] initWithString:baseUrl];

    if(![self isValidDictionaryCode: code])
        return NULL;

    [uri appendString:[NSString stringWithFormat:@"dictionaries/%@/entries/%@/nearbyentries", code,
                       [self encodeString:entry:NSUTF8StringEncoding]]];

    char c = '?';
    if(entryNumber != NULL)
    {
        [uri appendString:[NSString stringWithFormat:@"%centrynumber=%d", c, [entryNumber intValue]]];
        c = '&';
    }

    NSMutableURLRequest *request = [self prepareGetRequest:uri];

    NSData *response = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    NSString *resData = [[NSString alloc] initWithData:response encoding:NSUTF8StringEncoding];

    return resData;
}

-(NSString*) getRelatedEntries : (NSString*) code : (NSString*) entry {
    NSMutableString *uri = [[NSMutableString alloc] initWithString:baseUrl];

    if(![self isValidDictionaryCode: code])
        return NULL;

    [uri appendString:[NSString stringWithFormat:@"dictionaries/%@/entries/%@/relatedentries", code,
                       [self encodeString:entry:NSUTF8StringEncoding]]];

    NSMutableURLRequest *request = [self prepareGetRequest:uri];

    NSData *response = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    NSString *resData = [[NSString alloc] initWithData:response encoding:NSUTF8StringEncoding];

    return resData;
}

-(NSString*) getThesaurusList : (NSString*) code {
    NSMutableString *uri = [[NSMutableString alloc] initWithString:baseUrl];

    if(![self isValidDictionaryCode: code])
        return NULL;

    [uri appendString:[NSString stringWithFormat:@"dictionaries/%@/topics", code]];

    NSMutableURLRequest *request = [self prepareGetRequest:uri];

    NSData *response = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    NSString *resData = [[NSString alloc] initWithData:response encoding:NSUTF8StringEncoding];

    return resData;
}

-(NSString*) getTopic : (NSString*) code : (NSString*) thesaurusName : (NSString*) topic {
    NSMutableString *uri = [[NSMutableString alloc] initWithString:baseUrl];

    if(![self isValidDictionaryCode: code])
        return NULL;

    [uri appendString:[NSString stringWithFormat:@"dictionaries/%@/topics/%@", code,
                       [self encodeString:thesaurusName:NSUTF8StringEncoding]]];

    if(topic != NULL)
        [uri appendString:[NSString stringWithFormat:@"/%@", topic]];


    NSMutableURLRequest *request = [self prepareGetRequest:uri];

    NSData *response = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    NSString *resData = [[NSString alloc] initWithData:response encoding:NSUTF8StringEncoding];

    return resData;
}

-(NSString*) getWordOfTheDay : (NSString*) code : (NSString*) day : (NSString*) format {
    NSMutableString *uri = [[NSMutableString alloc] initWithString:baseUrl];

    if(code != NULL)
    {
        if(![self isValidDictionaryCode: code])
            return NULL;
        [uri appendString:[NSString stringWithFormat:@"dictionaries/%@/", code]];
    }

    [uri appendString:@"wordoftheday"];

    char c = '?';
    if(day != NULL)
    {
        if(![self isValidWotDay: day])
            return NULL;
        [uri appendString:[NSString stringWithFormat:@"%cday=%@", c, day]];
        c = '&';
    }
    if(format != NULL)
    {
        if(![self isValidEntryFormat: format])
            return NULL;
        [uri appendString:[NSString stringWithFormat:@"%cformat=%@", c, format]];
        c = '&';
    }

    NSMutableURLRequest *request = [self prepareGetRequest:uri];

    NSData *response = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    NSString *resData = [[NSString alloc] initWithData:response encoding:NSUTF8StringEncoding];

    return resData;
}

-(NSString*) getWordOfTheDayPreview : (NSString*) code : (NSString*) day {
    NSMutableString *uri = [[NSMutableString alloc] initWithString:baseUrl];

    if(code != NULL)
    {
        if(![self isValidDictionaryCode: code])
            return NULL;
        [uri appendString:[NSString stringWithFormat:@"dictionaries/%@/", code]];
    }

    [uri appendString:@"wordoftheday/preview"];

    char c = '?';
    if(day != NULL)
    {
        if(![self isValidWotDay: day])
            return NULL;
        [uri appendString:[NSString stringWithFormat:@"%cday=%@", c, day]];
        c = '&';
    }

    NSMutableURLRequest *request = [self prepareGetRequest:uri];

    NSData *response = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    NSString *resData = [[NSString alloc] initWithData:response encoding:NSUTF8StringEncoding];

    return resData;
}

-(BOOL) isValidDictionaryCode: (NSString*) code {
    if(code.length < 1)
        return false;
    for(int i=0 ; i<code.length ; i++)
    {
        char c = [code characterAtIndex:i];
        // Make sure no param are injected
        if(c == '/' || c == '%')
            return false;
        if(c == '*' || c == '$')
            return false;
    }
    return true;
}

-(BOOL) isValidEntryFormat: (NSString*) format {
    for(int i=0 ; i<format.length ; i++)
    {
        char c = [format characterAtIndex:i];
        // Make sure no param are injected
        if(c == '/' || c == '%')
            return false;
    }
    return true;
}

-(BOOL) isValidEntryLang: (NSString*) lang {
    for(int i=0 ; i<lang.length ; i++)
    {
        char c = [lang characterAtIndex:i];
        // Make sure no param are injected
        if(c == '/' || c == '%')
            return false;
    }
    return true;
}

-(BOOL) isValidWotDay: (NSString*) day {
    for(int i=0 ; i<day.length ; i++)
    {
        char c = [day characterAtIndex:i];
        // Make sure no param are injected
        if(c == '/' || c == '%')
            return false;
    }
    return true;
}

-(NSMutableURLRequest*) prepareGetRequest: (NSString*) uri {
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:uri]];
    [request addValue:accessKey forHTTPHeaderField:@"accessKey"];
    if(requestHandler != NULL)
        [requestHandler prepareGetRequest:request];
    return request;
}

-(NSString*) search : (NSString*) code : (NSString*) searchWord : (NSNumber*) pageSize : (NSNumber*) pageIndex {
    NSMutableString *uri = [[NSMutableString alloc] initWithString:baseUrl];

    if(![self isValidDictionaryCode: code])
        return NULL;

    [uri appendString:[NSString stringWithFormat:@"dictionaries/%@/search?q=%@", code,
                       [self encodeString:searchWord:NSUTF8StringEncoding]]];

    char c = '&';
    if(pageSize != NULL)
    {
        [uri appendString:[NSString stringWithFormat:@"%cpagesize=%d", c, [pageSize intValue]]];
        c = '&';
    }
    if(pageIndex != NULL)
    {
        [uri appendString:[NSString stringWithFormat:@"%cpageindex=%d", c, [pageIndex intValue]]];
        c = '&';
    }

    NSMutableURLRequest *request = [self prepareGetRequest:uri];

    NSData *response = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    NSString *resData = [[NSString alloc] initWithData:response encoding:NSUTF8StringEncoding];

    return resData;
}

-(NSString*) searchFirst : (NSString*) code : (NSString*) searchWord : (NSString*) format {
    NSMutableString *uri = [[NSMutableString alloc] initWithString:baseUrl];

    if(![self isValidDictionaryCode: code])
        return NULL;

    [uri appendString:[NSString stringWithFormat:@"dictionaries/%@/search/first?q=%@", code,
                       [self encodeString:searchWord:NSUTF8StringEncoding]]];

    char c = '&';
    if(format != NULL)
    {
        if(![self isValidEntryFormat: format])
            return NULL;
        [uri appendString:[NSString stringWithFormat:@"%cformat=%@", c, format]];
        c = '&';
    }

    NSMutableURLRequest *request = [self prepareGetRequest:uri];

    NSData *response = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    NSString *resData = [[NSString alloc] initWithData:response encoding:NSUTF8StringEncoding];

    return resData;
}

-(void) setBaseUrl : (NSString*) url {
    if([url characterAtIndex:url.length-1] == '/')
        baseUrl = url;
    else {
        baseUrl = [NSString stringWithFormat:@"%@/", url];
    }
}

-(void) setRequestHandler:(id<RequestHandler>)handler{
    requestHandler = handler;
}

-(NSString *)encodeString: (NSString *)str : (NSStringEncoding)encoding
{
    return (NSString *) CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(NULL, (CFStringRef)str,
                                                                NULL, (CFStringRef)@";/?:@&=$+{}<>,",
                                                                CFStringConvertNSStringEncodingToEncoding(encoding)));
}

@end
