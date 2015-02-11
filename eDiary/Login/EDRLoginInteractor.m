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
 
    dispatch_async (dispatch_get_main_queue(), ^{
        //send a request to web service or core data
        //receive response from web service or core data and send to presener
         [self processLoginResponse:0]; //1- success,0-failure
    });
}

#pragma mark process the message

- (void) processLoginResponse:(NSInteger) authentication {
    
    if ([self.presenter respondsToSelector:@selector(loginCredentialResponse:)]) {
        [self.presenter loginCredentialResponse:authentication];
    }
}

@end