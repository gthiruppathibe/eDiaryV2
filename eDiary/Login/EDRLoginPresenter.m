//
//  EDRLoginPresenter.m
//  eDiary
//
//  Created by Thiruppathi Gandhi on 2/11/15.
//  Copyright (c) 2015 Thiruppathi Gandhi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EDRLoginPresenter.h"


@implementation EDRLoginPresenter

- (void) loginCredentialWithEmail:(NSString*)email Password:(NSString*)password{
    
    [self.interactor loginCredentialWithEmail:email Password:password];
}

- (void) loginCredentialResponse:(NSInteger)authentication {
    NSString *message = nil;
    switch (authentication) {
        case 1:
            message = @"Login is success";
            break;
        case 2:
            message = @"Invalid password";
            break;
        case 3:
            message = @"Invalid email";
        default:
            message = @"Login is failure";
            break;
    }
    [self.view loginCredentialResponse:message];
}

@end