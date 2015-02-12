//
//  Command.h
//  eDiary
//
//  Created by Thiruppathi Gandhi on 2/12/15.
//  Copyright (c) 2015 Thiruppathi Gandhi. All rights reserved.
//
#import <Foundation/Foundation.h>

@interface ICommand : NSObject

@property (nonatomic) NSInteger commandId;

@end

@interface LoginRequestCommand : ICommand

@property (nonatomic,strong) NSString *email;
@property (nonatomic,strong) NSString *password;

@end

@interface LoginResponseCommand : ICommand

@property (nonatomic) NSInteger loginStatus;
@property (nonatomic,strong) NSString* loginMessage;

@end