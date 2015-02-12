//
//  EDRLoginInteractorIO.h
//  eDiary
//
//  Created by Thiruppathi Gandhi on 2/11/15.
//  Copyright (c) 2015 Thiruppathi Gandhi. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ICommand;

@protocol EDRInteractorInput <NSObject>

- (void) commandRequest:(ICommand*)command;

@end

@protocol EDRInteractorOutput <NSObject>

- (void) commandResponse:(ICommand*)command;

@end
