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

- (void) loginCredentialWithEmail:(NSString*)email
                         Password:(NSString*)password {
   
    dispatch_async (dispatch_get_main_queue(), ^{
        [self.presenter loginCredentialResponse:0];
    });
}

@end