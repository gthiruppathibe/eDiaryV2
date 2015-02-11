//
//  EDRLoginInteractor.h
//  eDiary
//
//  Created by Thiruppathi Gandhi on 2/11/15.
//  Copyright (c) 2015 Thiruppathi Gandhi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EDRLoginInteractorIO.h"

@interface EDRLoginInteractor : NSObject <EDRLoginInteractorInput>

@property (nonatomic,strong) id<EDRLoginInteractorOutput> presenter;

@end