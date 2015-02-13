//
//  EDRRegisterPresenter.m
//  eDiary
//
//  Created by Thiruppathi Gandhi on 2/12/15.
//  Copyright (c) 2015 Thiruppathi Gandhi. All rights reserved.
//

#import "EDRRegisterPresenter.h"

@implementation EDRRegisterPresenter

- (void) registerUserDetailsWithUserName:(NSString*)username
                                   Email:(NSString*)email
                                Password:(NSString*)password
                         ConfirmPassword:(NSString*)confirmPassword
                        resultBlock:(void (^)(NSString *))resultBlock {
    
    if ([username isEqualToString:@""]) {
        resultBlock(@"Username can't be blank");
        return;
    }
    if ([email isEqualToString:@""]) {
        resultBlock(@"Email can't be blank");
         return;
    }
    if (![password isEqualToString:confirmPassword]) {
        resultBlock(@"Password doesn't match");
         return;
    }
    [self.interactor registerUserDetailsWithUserName:username
                                               Email:email
                                            Password:password];
}

- (void) registerStatus:(NSInteger)status {
    NSString *message = nil;
    switch (status) {
        case 1:
            message = @"Register is success";
            break;
        case 2:
            message = @"Already email exists";
            break;
            
        default:
            break;
    }
    [self.view registerResponse:message];
}


@end
