//
//  EDRWireFrame.m
//  eDiary
//
//  Created by Thiruppathi Gandhi on 2/12/15.
//  Copyright (c) 2015 Thiruppathi Gandhi. All rights reserved.
//

#import "EDRWireFrame.h"
#import "EDRAppDelegate.h"
#import "EDRLoginViewController.h"
#import "EDRRegisterViewController.h"
#import "EDRHeader.h"
#import "EDRRegisterInteractor.h"
#import "EDRRegisterPresenter.h"

@interface EDRWireFrame ()

@property (nonatomic,strong) EDRRegisterInteractor *registerInteractor;
@property (nonatomic,strong) EDRRegisterPresenter *registerPresenter;

@end

@implementation EDRWireFrame

@synthesize loginViewController = _loginViewController;
@synthesize registerViewController = _registerViewController;
@synthesize loginPresenter = _loginPresenter;
@synthesize loginInteractor = _loginInteractor;
@synthesize registerInteractor = _registerInteractor;
@synthesize registerPresenter = _registerPresenter;

- (void)pushViewControllerByViewName:(NSString*)viewname {
    if ([viewname isEqualToString:@"LOGIN"]) {
        [self.registerViewController dismissViewControllerAnimated:NO completion:nil];
    }
    else if ([viewname isEqualToString:@"REGISTER"]) {
        [self.registerViewController setPresenter:self.registerPresenter];
        [self.registerPresenter setView:self.registerViewController];
        [self.registerPresenter setInteractor:self.registerInteractor];
        [self.registerInteractor setPresenter:self.registerPresenter];
        
        [self.loginViewController presentViewController:self.registerViewController animated:NO completion:nil];
    }
}

- (EDRLoginViewController*)loginViewController {
    if (!_loginViewController) {
        _loginViewController = [[EDRLoginViewController alloc] init];
    }
    return _loginViewController;
}

- (EDRRegisterViewController*)registerViewController {
    if (!_registerViewController) {
        _registerViewController = [[EDRRegisterViewController alloc] init];
    }
    return _registerViewController;
}

- (EDRLoginPresenter*)loginPresenter {
    if (!_loginPresenter) {
        _loginPresenter = [[EDRLoginPresenter alloc] init];
    }
    return _loginPresenter;
}

- (EDRLoginInteractor*)loginInteractor {
    if (!_loginInteractor) {
        _loginInteractor = [[EDRLoginInteractor alloc] init];
    }
    return _loginInteractor;
}

- (EDRRegisterInteractor*)registerInteractor {
    if(!_registerInteractor) {
        _registerInteractor = [[EDRRegisterInteractor alloc] init];
    }
    return _registerInteractor;
}

-(EDRRegisterPresenter*)registerPresenter {
    if(!_registerPresenter) {
        _registerPresenter = [[EDRRegisterPresenter alloc] init];
    }
    return _registerPresenter;
}

@end
