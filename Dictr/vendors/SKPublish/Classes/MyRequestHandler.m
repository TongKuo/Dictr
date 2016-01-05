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
#import "MyRequestHandler.h"

@implementation MyRequestHandler

@synthesize outputRes;

//-(void) dealloc {
//    [super dealloc];
//}

-(void) prepareGetRequest:(NSMutableURLRequest*) request {
    char* accept = getenv("API_ACCEPT");
    if(accept)
    {
        NSLog(@"%@ %s", request.URL, accept);
        [outputRes appendString:[NSString stringWithFormat:@"%@ %s\n", request.URL, accept]];
    }
    else {
        NSLog(@"%@", request.URL);
        [outputRes appendString:[NSString stringWithFormat:@"%@\n", request.URL]];
    }

    if(accept) {
        [request setValue:[[NSString alloc] initWithUTF8String:accept] forHTTPHeaderField:@"Accept"];
    }
/*
    NSURLCredential *credential = [NSURLCredential credentialWithUser:@"xxx-userlogin"
                                                             password:@"xxx-userpassword"
                                                          persistence:NSURLCredentialPersistenceForSession];
    NSURLProtectionSpace *protectionSpace = [[NSURLProtectionSpace alloc]
                                             initWithHost: @"myskpublishsite.mydomain.com"
                                             port:80
                                             protocol: @"http"
                                             realm: @"Restricted Area"
                                             authenticationMethod:nil];

    [[NSURLCredentialStorage sharedCredentialStorage] setDefaultCredential:credential
                                                        forProtectionSpace:protectionSpace];
    [protectionSpace release];
*/
}

-(void) setOutputRes:(NSMutableString*) res {
    outputRes = res;
}

@end
