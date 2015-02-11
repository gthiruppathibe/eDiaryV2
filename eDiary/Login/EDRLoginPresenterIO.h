//
//  EDRPresenterIO.h
//  eDiary
//
//  Created by Thiruppathi Gandhi on 2/11/15.
//  Copyright (c) 2015 Thiruppathi Gandhi. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol EDRPresenterInput <NSObject>

- (void) loginCredentialWithEmail:(NSString*)email
                         Password:(NSString*)password;

@end

@protocol EDRPresenterOutput <NSObject>

- (void)loginCredentialResponse:(NSString*)message;

@end