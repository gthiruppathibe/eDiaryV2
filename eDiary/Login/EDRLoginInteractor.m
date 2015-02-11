//
//  EDRLoginInteractor.m
//  eDiary
//
//  Created by Thiruppathi Gandhi on 2/11/15.
//  Copyright (c) 2015 Thiruppathi Gandhi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EDRLoginInteractor.h"

@interface EDRLoginInteractor()

@end

@implementation EDRLoginInteractor

#pragma mark delegate method

- (void) loginCredentialWithEmail:(NSString*)email Password:(NSString*)password{
 
    //perform async login request
    dispatch_block_t loginRequestBlock = ^{ @autoreleasepool {
        
        [self processLoginRequestWithEmail:email Password:password];
        
    }};
    dispatch_async(dispatch_get_main_queue(), loginRequestBlock);
}

#pragma mark process the message

- (void) processLoginRequestWithEmail:(NSString*)email Password:(NSString*)password {

    //TODO: send a request to core data or web service to validate the account details
    //TODO: Assume that i send async request to web service or core data
    
    //TODO: Assume i got async response from server
    dispatch_block_t loginResponseBlock = ^{ @autoreleasepool {
        
        [self processLoginResponse:0]; //1- success,0-failure
        
    }};
    dispatch_async(dispatch_get_main_queue(), loginResponseBlock);
}

- (void) processLoginResponse:(NSInteger) authentication {
    
    if ([self.presenter respondsToSelector:@selector(loginCredentialResponse:)]) {
        [self.presenter loginCredentialResponse:authentication];
    }
}

@end