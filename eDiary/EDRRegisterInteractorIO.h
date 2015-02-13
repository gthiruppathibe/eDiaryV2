//
//  EDRRegisterInteractor.h
//  eDiary
//
//  Created by Thiruppathi Gandhi on 2/12/15.
//  Copyright (c) 2015 Thiruppathi Gandhi. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol EDRRegisterInteractorInput <NSObject>

- (void) registerUserDetailsWithUserName:(NSString*)username
                               Email:(NSString*)email
                            Password:(NSString*)password;

@end

@protocol EDRRegisterInteractorOutput <NSObject>

- (void) registerStatus:(NSInteger)status;

@end
