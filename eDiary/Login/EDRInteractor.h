//
//  EDRLoginInteractor.h
//  eDiary
//
//  Created by Thiruppathi Gandhi on 2/11/15.
//  Copyright (c) 2015 Thiruppathi Gandhi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EDRInteractorIO.h"

@interface EDRInteractor : NSObject <EDRInteractorInput>

@property (nonatomic,strong) id<EDRInteractorOutput> presenter;

@end