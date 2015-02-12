//
//  EDRLoginViewController.h
//  eDiary
//
//  Created by Thiruppathi Gandhi on 2/11/15.
//  Copyright (c) 2015 Thiruppathi Gandhi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EDRLoginView.h"
#import "EDRLoginPresenter.h"

@interface EDRLoginViewController : UIViewController <EDRLoginView,UITextFieldDelegate>

@property (nonatomic,strong) EDRLoginPresenter  *presenter;

@end
