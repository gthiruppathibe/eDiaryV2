//
//  EDRLoginPresenter.h
//  eDiary
//
//  Created by Thiruppathi Gandhi on 2/11/15.
//  Copyright (c) 2015 Thiruppathi Gandhi. All rights reserved.
//


#import <Foundation/Foundation.h>
#import "EDRLoginInteractorIO.h"
#import "EDRLoginPresenterIO.h"

@interface EDRLoginPresenter : NSObject<EDRLoginInteractorOutput,EDRPresenterInput>

@property (nonatomic,strong) id<EDRLoginInteractorInput> interactor;
@property (nonatomic,strong) id<EDRPresenterOutput> view;

@end
