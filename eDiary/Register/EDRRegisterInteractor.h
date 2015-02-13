//
//  EDRRegisterInteractor.h
//  eDiary
//
//  Created by Thiruppathi Gandhi on 2/12/15.
//  Copyright (c) 2015 Thiruppathi Gandhi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EDRRegisterInteractorIO.h"

@interface EDRRegisterInteractor : NSObject <EDRRegisterInteractorInput>

@property (nonatomic,strong) id<EDRRegisterInteractorOutput> presenter;

@end
