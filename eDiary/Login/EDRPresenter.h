//
//  EDRLoginPresenter.h
//  eDiary
//
//  Created by Thiruppathi Gandhi on 2/11/15.
//  Copyright (c) 2015 Thiruppathi Gandhi. All rights reserved.
//


#import <Foundation/Foundation.h>
#import "EDRInteractorIO.h"
#import "EDRPresenterIO.h"


@interface EDRPresenter : NSObject<EDRInteractorOutput,EDRPresenterInput>

@property (nonatomic,strong) id<EDRInteractorInput> interactor;
@property (nonatomic,strong) id<EDRPresenterOutput> view;

@end
