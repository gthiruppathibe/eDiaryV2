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
{
    void * isQueueContextKey;
}

@property (nonatomic,strong) dispatch_queue_t queue;

@end

NSString *const EDRGCDQueueName = @"EDRGCDQueueName";

@implementation EDRLoginInteractor

@synthesize queue = _queue;

#pragma mark delegate method

- (void) loginCredentialWithEmail:(NSString*)email Password:(NSString*)password{
 
    dispatch_block_t loginRequestBlock = ^{ @autoreleasepool {
        
        [self processLoginRequestWithEmail:email Password:password];
        
    }};
    dispatch_async(self.queue, loginRequestBlock);
}

#pragma mark property getter method

- (dispatch_queue_t)queue {
    if (!_queue) {
        _queue = dispatch_queue_create([EDRGCDQueueName UTF8String], NULL);
        void *nonNullUnusedPointer = (__bridge void *)self;
        dispatch_queue_set_specific(_queue, &isQueueContextKey, nonNullUnusedPointer, NULL);
    }
    return _queue;
}

#pragma mark process the message

- (void) processLoginRequestWithEmail:(NSString*)email Password:(NSString*)password {

    //TODO: send a request to core data or web service to validate the account details
    //TODO: Assume that i send async request to web service or core data
    
    //TODO: Assume i got async response from server
    dispatch_block_t loginResponseBlock = ^{ @autoreleasepool {
        
        [self processLoginResponse:1]; //1- success,0-failure
        
    }};
    dispatch_async(dispatch_get_main_queue(), loginResponseBlock);
}

- (void) processLoginResponse:(NSInteger) authentication {
    
    if ([self.presenter respondsToSelector:@selector(loginCredentialResponse:)]) {
        [self.presenter loginCredentialResponse:authentication];
    }
}

@end