//
//  AppDelegate.m
//  eDiary
//
//  Created by Thiruppathi Gandhi on 2/9/15.
//  Copyright (c) 2015 Thiruppathi Gandhi. All rights reserved.
//

#import "EDRAppDelegate.h"
#import "EDRLoginViewController.h"
#import "EDRHeader.h"


@interface EDRAppDelegate ()

@property (nonatomic,strong) EDRLoginViewController *loginViewController;
@property (nonatomic,strong) EDRLoginPresenter *loginPresenter;
@property (nonatomic,strong) EDRLoginInteractor *loginInteractor;

@end

@implementation EDRAppDelegate

@synthesize loginViewController = _loginViewController;
@synthesize navController = _navController;
@synthesize loginPresenter = _loginPresenter;
@synthesize loginInteractor = _loginInteractor;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [self initialize];
    return YES;
}

#pragma mark - property getter method

- (UIWindow*)window {
    if (!_window) {
        CGRect windowRect = [[UIScreen mainScreen] bounds];
        _window = [[UIWindow alloc] initWithFrame:windowRect];
    }
    return _window;
}

- (EDRLoginViewController*)loginViewController {
    if (!_loginViewController) {
        _loginViewController = [[EDRLoginViewController alloc] init];
    }
    return _loginViewController;
}

- (UINavigationController*)navController {
    if (!_navController) {
        _navController = [[UINavigationController alloc] initWithRootViewController:self.loginViewController];
    }
    return  _navController;
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


#pragma mark create screen

- (void) initialize {
    [self.window setBackgroundColor:[UIColor whiteColor]];
    [self.window setRootViewController:self.navController];
    [self.window makeKeyAndVisible];
    //set delegate for VIPER
    [self.loginViewController setPresenter:self.loginPresenter];
    [self.loginPresenter setView:self.loginViewController];
    [self.loginPresenter setInteractor:self.loginInteractor];
    [self.loginInteractor setPresenter:self.loginPresenter];
}

#pragma mark - Core Data stack

@synthesize managedObjectContext = _managedObjectContext;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;

- (NSURL *)applicationDocumentsDirectory {
    // The directory the application uses to store the Core Data store file. This code uses a directory named "MM.eDiary" in the application's documents directory.
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

- (NSManagedObjectModel *)managedObjectModel {
    // The managed object model for the application. It is a fatal error for the application not to be able to find and load its model.
    if (_managedObjectModel != nil) {
        return _managedObjectModel;
    }
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"eDiary" withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _managedObjectModel;
}

- (NSPersistentStoreCoordinator *)persistentStoreCoordinator {
    // The persistent store coordinator for the application. This implementation creates and return a coordinator, having added the store for the application to it.
    if (_persistentStoreCoordinator != nil) {
        return _persistentStoreCoordinator;
    }
    
    // Create the coordinator and store
    
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"eDiary.sqlite"];
    NSError *error = nil;
    NSString *failureReason = @"There was an error creating or loading the application's saved data.";
    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
        // Report any error we got.
        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
        dict[NSLocalizedDescriptionKey] = @"Failed to initialize the application's saved data";
        dict[NSLocalizedFailureReasonErrorKey] = failureReason;
        dict[NSUnderlyingErrorKey] = error;
        error = [NSError errorWithDomain:@"YOUR_ERROR_DOMAIN" code:9999 userInfo:dict];
        // Replace this with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    
    return _persistentStoreCoordinator;
}


- (NSManagedObjectContext *)managedObjectContext {
    // Returns the managed object context for the application (which is already bound to the persistent store coordinator for the application.)
    if (_managedObjectContext != nil) {
        return _managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (!coordinator) {
        return nil;
    }
    _managedObjectContext = [[NSManagedObjectContext alloc] init];
    [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    return _managedObjectContext;
}

#pragma mark - Core Data Saving support

- (void)saveContext {
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    if (managedObjectContext != nil) {
        NSError *error = nil;
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
            // Replace this implementation with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
    }
}

@end
