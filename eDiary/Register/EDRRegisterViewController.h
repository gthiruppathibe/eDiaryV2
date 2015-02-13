//
//  EDRRegisterViewController.h
//  eDiary
//
//  Created by Thiruppathi Gandhi on 2/12/15.
//  Copyright (c) 2015 Thiruppathi Gandhi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EDRRegisterView.h"

@class EDRRegisterPresenter;

@interface EDRRegisterViewController : UIViewController <UITextFieldDelegate,EDRRegisterView>

@property (nonatomic) EDRRegisterPresenter *presenter;

@end
