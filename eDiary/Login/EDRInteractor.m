//
//  EDRLoginInteractor.m
//  eDiary
//
//  Created by Thiruppathi Gandhi on 2/11/15.
//  Copyright (c) 2015 Thiruppathi Gandhi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EDRInteractor.h"
#import "EDRCommand.h"

@interface EDRInteractor()

@end

@implementation EDRInteractor

#pragma mark delegate method

- (void) commandRequest:(ICommand*)command {
    
    if ([command isKindOfClass: [LoginRequestCommand class]]) {
        [self processLoginRequest:(LoginRequestCommand*)command];
    }
        
}

#pragma mark process the message

- (void) processLoginRequest:(LoginRequestCommand*)loginCommand {

    dispatch_async (dispatch_get_main_queue(), ^{
        //NSString *email = loginCommand.email;
        //NSString *password = loginCommand.password;
        //send to server to validate the login
    });
    
    //got the response from server
    dispatch_async (dispatch_get_main_queue(), ^{
        LoginResponseCommand *loginResponse = [[LoginResponseCommand alloc] init];
        loginResponse.loginStatus = 0; //failure
        [self.presenter commandResponse:loginResponse];
        
       });

}

@end