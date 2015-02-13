//
//  EDRRegisterInteractor.m
//  eDiary
//
//  Created by Thiruppathi Gandhi on 2/12/15.
//  Copyright (c) 2015 Thiruppathi Gandhi. All rights reserved.
//

#import "EDRRegisterInteractor.h"
#import "EDRAppDelegate.h"
#import "EDRUsers.h"

@implementation EDRRegisterInteractor

#pragma interactor delegate

- (void) registerUserDetailsWithUserName:(NSString*)username
                                   Email:(NSString*)email
                                Password:(NSString*)password {
    dispatch_async (dispatch_get_main_queue(), ^{
        [self processRegisterRequest:username Email:email Password:password];
    });
}

#pragma mark core data context

- (NSManagedObjectContext*) managedObjectContext {
    return [(EDRAppDelegate*) [[UIApplication sharedApplication] delegate] managedObjectContext];
}

#pragma mark process register request

- (void) processRegisterRequest:(NSString*)username
                          Email:(NSString*)email
                          Password:(NSString*)password {
    if([self isEmailExists:email]) {
        [self.presenter registerStatus:2];
        return;
    }
    EDRUsers *newUser = [NSEntityDescription insertNewObjectForEntityForName:@"EDRUsers" inManagedObjectContext:self.managedObjectContext];
    newUser.userName = username;
    newUser.password = password;
    newUser.email = email;
    newUser.userId = [NSNumber numberWithInt:1];
    [self.managedObjectContext save:nil];
    [self.presenter registerStatus:1];
}

- (BOOL) isEmailExists:(NSString*)email {
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"EDRUsers"];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"email == %@",email];
    [fetchRequest setPredicate:predicate];
    NSArray *result = [self.managedObjectContext executeFetchRequest:fetchRequest
                                                               error:nil];
    if(result.count>0)
        return YES;
    else
        return NO;
}

@end
