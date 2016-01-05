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

#import "RequestHandler.h"

@interface SkPublishAPI: NSObject

@property(nonatomic, retain) NSString *accessKey;
@property(nonatomic, retain) NSString *baseUrl;
@property(nonatomic, assign) id<RequestHandler> requestHandler;


-(SkPublishAPI*) initWithUrlAndAcessKey: (NSString*) url : (NSString*) key;

-(NSString*) baseUrl;

-(NSString*) didYouMean : (NSString*) code : (NSString*) searchWord : (NSNumber*) entryNumber;

-(NSString*) getDictionaries;

-(NSString*) getDictionary : (NSString*) code;

-(NSString*) getEntry : (NSString*) code : (NSString*) entry : (NSString*) format;

-(NSString*) getEntryPronunciations : (NSString*) code : (NSString*) entry : (NSString*) lang;

-(NSString*) getNearbyEntries : (NSString*) code : (NSString*) entry : (NSNumber*) entryNumber;

-(NSString*) getRelatedEntries : (NSString*) code : (NSString*) entry;

-(NSString*) getThesaurusList : (NSString*) code;

-(NSString*) getTopic : (NSString*) code : (NSString*) thesaurusName : (NSString*) topic;

-(NSString*) getWordOfTheDay : (NSString*) code : (NSString*) day : (NSString*) format;

-(NSString*) getWordOfTheDayPreview : (NSString*) code : (NSString*) day;

-(NSString*) search : (NSString*) code : (NSString*) searchWord : (NSNumber*) pageSize : (NSNumber*) pageIndex;

-(NSString*) searchFirst : (NSString*) code : (NSString*) searchWord : (NSString*) format;

-(void) setBaseUrl:(NSString*) url;

-(void) setRequestHandler:(id<RequestHandler>)handler;

@end
