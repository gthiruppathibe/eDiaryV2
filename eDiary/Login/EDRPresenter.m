//
//  EDRLoginPresenter.m
//  eDiary
//
//  Created by Thiruppathi Gandhi on 2/11/15.
//  Copyright (c) 2015 Thiruppathi Gandhi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EDRPresenter.h"
#import "EDRCommand.h"


@implementation EDRPresenter

- (void) commandRequest:(ICommand*)command {
    
    [self.interactor commandRequest:command];
}

- (void) commandResponse:(ICommand*)command {
 
    if ([command isKindOfClass: [LoginResponseCommand class]]) {
        [self loginCredentialResponse:(LoginResponseCommand*)command];
    }
}


- (void) loginCredentialResponse:(LoginResponseCommand*)command {
    
    switch (command.loginStatus) {
        case 1:
            //redirect to main screen using wire frame
            break;
        case 2:
            command.loginMessage = @"Invalid password";
            break;
        case 3:
            command.loginMessage = @"Invalid email";
        default:
            command.loginMessage = @"Login is failure";
            break;
    }
    [self.view commandResponse:command];
}

@end