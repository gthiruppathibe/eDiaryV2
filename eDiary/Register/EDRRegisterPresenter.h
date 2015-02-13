//
//  EDRRegisterPresenter.h
//  eDiary
//
//  Created by Thiruppathi Gandhi on 2/12/15.
//  Copyright (c) 2015 Thiruppathi Gandhi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EDRRegisterInteractorIO.h"
#import "EDRRegisterView.h"

@interface EDRRegisterPresenter : NSObject <EDRRegisterInteractorOutput>

- (void) registerUserDetailsWithUserName:(NSString*)username
                                   Email:(NSString*)email
                                Password:(NSString*)password
                         ConfirmPassword:(NSString*)confirmPassword
                             resultBlock:(void (^)(NSString*))resultBlock;

@property (nonatomic,strong) id<EDRRegisterView> view;
@property (nonatomic,strong) id<EDRRegisterInteractorInput> interactor;

@end
