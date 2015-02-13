//
//  EDRWireFrame.h
//  eDiary
//
//  Created by Thiruppathi Gandhi on 2/12/15.
//  Copyright (c) 2015 Thiruppathi Gandhi. All rights reserved.
//

#import <Foundation/Foundation.h>

@class EDRAppDelegate;
@class EDRLoginViewController;
@class EDRRegisterViewController;
@class EDRLoginInteractor;
@class EDRLoginPresenter;

@interface EDRWireFrame : NSObject

- (void)pushViewControllerByViewName:(NSString*)viewname;

@property (nonatomic,weak) EDRAppDelegate *appDelegate;
@property (nonatomic,strong) EDRLoginPresenter *loginPresenter;
@property (nonatomic,strong) EDRLoginInteractor *loginInteractor;
@property (nonatomic,strong) EDRLoginViewController *loginViewController;
@property (nonatomic,strong) EDRRegisterViewController *registerViewController;

@end
