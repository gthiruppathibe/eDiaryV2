//
//  EDRLoginInteractor.m
//  eDiary
//
//  Created by Thiruppathi Gandhi on 2/11/15.
//  Copyright (c) 2015 Thiruppathi Gandhi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EDRLoginInteractor.h"
#import "EDRAppDelegate.h"

@interface EDRLoginInteractor()

@property (nonatomic,readonly) NSManagedObjectContext *managedObjectContext;

@end

@implementation EDRLoginInteractor

#pragma mark delegate method

- (void) loginCredentialWithEmail:(NSString*)email
                         Password:(NSString*)password {
    dispatch_async (dispatch_get_main_queue(), ^{
        [self processLoginRequestWithEmail:email Password:password];
    });
}

#pragma mark core data context

- (NSManagedObjectContext*) managedObjectContext {
    return [(EDRAppDelegate*) [[UIApplication sharedApplication] delegate] managedObjectContext];
}

#pragma mark process login request

- (void) processLoginRequestWithEmail:(NSString*)email
                             Password:(NSString*)password {
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"EDRUsers"];
    fetchRequest.sortDescriptors = [NSArray arrayWithObject:[NSSortDescriptor sortDescriptorWithKey:@"userName" ascending:YES]];
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:
                              @"email == %@ and password == %@",email,password];
    [fetchRequest setPredicate:predicate];
    
    NSArray *result = [self.managedObjectContext executeFetchRequest:fetchRequest error:nil];
    [self processLoginResponseWithResults:result];
}

- (void) processLoginResponseWithResults:(NSArray*)result {
    if (!result.count) {
        [self.presenter loginCredentialResponse:0];
    }else {
        [self.presenter loginCredentialResponse:1];
    }
        
}



@end