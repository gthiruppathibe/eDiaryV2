//
//  EDRLoginViewController.h
//  eDiary
//
//  Created by Thiruppathi Gandhi on 2/11/15.
//  Copyright (c) 2015 Thiruppathi Gandhi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EDRLoginPresenterIO.h"

@interface EDRLoginViewController : UIViewController <EDRPresenterOutput>

@property (nonatomic,strong) id<EDRPresenterInput>  presenter;

@end
