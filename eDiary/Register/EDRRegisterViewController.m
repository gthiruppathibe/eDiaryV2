//
//  EDRRegisterViewController.m
//  eDiary
//
//  Created by Thiruppathi Gandhi on 2/12/15.
//  Copyright (c) 2015 Thiruppathi Gandhi. All rights reserved.
//

#import "EDRRegisterViewController.h"
#import "EDRRegisterPresenter.h"

@interface EDRRegisterViewController ()

@property (nonatomic,strong) UILabel *registerCaption;
@property (nonatomic,strong) UITextField *usernameField;
@property (nonatomic,strong) UITextField *emailField;
@property (nonatomic,strong) UITextField *passwordField;
@property (nonatomic,strong) UITextField *confirmPasswordField;
@property (nonatomic,strong) UIButton *registerButton;
@property (nonatomic,strong) UIButton *cancelButton;

@end

@implementation EDRRegisterViewController

@synthesize registerCaption = _registerCaption;
@synthesize usernameField = _usernameField;
@synthesize emailField = _emailField;
@synthesize passwordField = _passwordField;
@synthesize registerButton = _registerButton;
@synthesize confirmPasswordField = _confirmPasswordField;
@synthesize cancelButton = _cancelButton;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self interfaceBuilder];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UILabel*)registerCaption {
    if (!_registerCaption) {
        _registerCaption = [[UILabel alloc] init];
        _registerCaption.text = @"Register";
        _registerCaption.textColor = [UIColor blackColor];
        _registerCaption.textAlignment = NSTextAlignmentCenter;
        _registerCaption.backgroundColor = [UIColor clearColor];
        _registerCaption.font = [UIFont systemFontOfSize:20.0f];
        _registerCaption.adjustsFontSizeToFitWidth = YES;
        _registerCaption.translatesAutoresizingMaskIntoConstraints = NO;
    }
    return _registerCaption;
}

- (UITextField*)usernameField {
    if (!_usernameField) {
        _usernameField = [[UITextField alloc] init] ;
        _usernameField.borderStyle = UITextBorderStyleRoundedRect;
        _usernameField.textColor = [UIColor blackColor];
        _usernameField.backgroundColor = [UIColor clearColor];
        _usernameField.autocorrectionType = UITextAutocorrectionTypeNo;
        _usernameField.keyboardType = UIKeyboardTypeDefault;
        _usernameField.autocapitalizationType = UITextAutocapitalizationTypeNone;
        _usernameField.returnKeyType = UIReturnKeyDone;
        _usernameField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
        _usernameField.clearButtonMode = UITextFieldViewModeAlways;
        _usernameField.placeholder = NSLocalizedString(@"username", nil) ;
        _usernameField.delegate = self;
        _usernameField.userInteractionEnabled = YES;
        _usernameField.translatesAutoresizingMaskIntoConstraints= NO;
    }
    return _usernameField;
}

- (UITextField*)emailField {
    if (!_emailField) {
        _emailField = [[UITextField alloc] init] ;
        _emailField.borderStyle = UITextBorderStyleRoundedRect;
        _emailField.textColor = [UIColor blackColor];
        _emailField.backgroundColor = [UIColor clearColor];
        _emailField.autocorrectionType = UITextAutocorrectionTypeNo;
        _emailField.keyboardType = UIKeyboardTypeDefault;
        _emailField.autocapitalizationType = UITextAutocapitalizationTypeNone;
        _emailField.returnKeyType = UIReturnKeyDone;
        _emailField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
        _emailField.clearButtonMode = UITextFieldViewModeAlways;
        _emailField.placeholder = NSLocalizedString(@"email", nil) ;
        _emailField.delegate = self;
        _emailField.userInteractionEnabled = YES;
        _emailField.translatesAutoresizingMaskIntoConstraints= NO;
    }
    return _emailField;
}

- (UITextField *)passwordField {
    if (!_passwordField) {
        _passwordField = [[UITextField alloc] init];
        _passwordField.borderStyle = UITextBorderStyleRoundedRect;
        _passwordField.textColor = [UIColor blackColor];
        _passwordField.font = [UIFont systemFontOfSize:18.0f];
        _passwordField.backgroundColor = [UIColor clearColor];
        _passwordField.autocorrectionType = UITextAutocorrectionTypeNo;
        _passwordField.keyboardType = UIKeyboardTypeDefault;
        _passwordField.returnKeyType = UIReturnKeyDone;
        _passwordField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
        _passwordField.clearButtonMode = UITextFieldViewModeAlways;
        _passwordField.secureTextEntry = YES;
        _passwordField.delegate = self;
        _passwordField.placeholder = NSLocalizedString(@"password", nil);
        _passwordField.userInteractionEnabled = YES;
        _passwordField.translatesAutoresizingMaskIntoConstraints= NO;
    }
    return _passwordField;
}

- (UITextField *)confirmPasswordField {
    if (!_confirmPasswordField) {
        _confirmPasswordField = [[UITextField alloc] init];
        _confirmPasswordField.borderStyle = UITextBorderStyleRoundedRect;
        _confirmPasswordField.textColor = [UIColor blackColor];
        _confirmPasswordField.font = [UIFont systemFontOfSize:18.0f];
        _confirmPasswordField.backgroundColor = [UIColor clearColor];
        _confirmPasswordField.autocorrectionType = UITextAutocorrectionTypeNo;
        _confirmPasswordField.keyboardType = UIKeyboardTypeDefault;
        _confirmPasswordField.returnKeyType = UIReturnKeyDone;
        _confirmPasswordField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
        _confirmPasswordField.clearButtonMode = UITextFieldViewModeAlways;
        _confirmPasswordField.secureTextEntry = YES;
        _confirmPasswordField.delegate = self;
        _confirmPasswordField.placeholder = NSLocalizedString(@"confirm password", nil);
        _confirmPasswordField.userInteractionEnabled = YES;
        _confirmPasswordField.translatesAutoresizingMaskIntoConstraints= NO;
    }
    return _confirmPasswordField;
}

- (UIButton*)registerButton {
    if(!_registerButton) {
        _registerButton = [[UIButton alloc] init];
        [_registerButton setTranslatesAutoresizingMaskIntoConstraints:NO];
        [_registerButton setTitle:@"Submit" forState:UIControlStateNormal];
        [_registerButton setTitleColor: [UIColor blackColor] forState:UIControlStateNormal];
        [_registerButton addTarget:self action:@selector(btnSubmitClicked:) forControlEvents:UIControlEventTouchDown];
    }
    return _registerButton;
}

- (UIButton*)cancelButton {
    if(!_cancelButton) {
        _cancelButton = [[UIButton alloc] init];
        [_cancelButton setTranslatesAutoresizingMaskIntoConstraints:NO];
        [_cancelButton setTitle:@"Cancel" forState:UIControlStateNormal];
        [_cancelButton setTitleColor: [UIColor blackColor] forState:UIControlStateNormal];
        [_cancelButton addTarget:self action:@selector(btnCancelClicked:) forControlEvents:UIControlEventTouchDown];
    }
    return _cancelButton;
}

#pragma mark textfield delegate method

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    return (YES);
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField {
    return (YES);
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
}

-(BOOL) textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return TRUE;
}

#pragma mark perform action

- (void) btnCancelClicked:(id)sender {
    [self dismissViewControllerAnimated:NO completion:nil];
}

- (void) btnSubmitClicked:(id)sender {
    
    void (^Success)(NSString*) = ^(NSString* status) {
      
        UIAlertView *loginAlert = [[UIAlertView alloc] initWithTitle: nil message:status delegate:self cancelButtonTitle:nil otherButtonTitles:@"Ok", nil];
        [loginAlert show];
    };
    
    [self.presenter registerUserDetailsWithUserName:self.usernameField.text
                                              Email:self.emailField.text
                                           Password:self.passwordField.text
                                           ConfirmPassword:self.confirmPasswordField.text
                                           resultBlock:Success];
}

#pragma mark screen

- (void) registerResponse:(NSString*)message {
    UIAlertView *loginAlert = [[UIAlertView alloc] initWithTitle: nil message:message delegate:self cancelButtonTitle:nil otherButtonTitles:@"Ok", nil];
    [loginAlert show];
    [self dismissViewControllerAnimated:NO completion:nil];
}


- (void) interfaceBuilder {
    [self.view addSubview:self.registerCaption];
    [self.view addSubview:self.usernameField];
    [self.view addSubview:self.emailField];
    [self.view addSubview:self.passwordField];
    [self.view addSubview:self.registerButton];
    [self.view addSubview:self.confirmPasswordField];
    [self.view addSubview:self.cancelButton];
    
    NSDictionary *elementDict = NSDictionaryOfVariableBindings(_registerCaption,_usernameField,_emailField,_passwordField,_registerButton,_confirmPasswordField,_cancelButton);
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-(<=100)-[_registerCaption(25)]-10-[_usernameField(25)]-10-[_emailField(25)]-10-[_passwordField(25)]-10-[_confirmPasswordField(25)]-[_registerButton(25)]-(<=400)-|"
                                                                      options:NSLayoutFormatDirectionLeadingToTrailing
                                                                      metrics:nil
                                                                        views:elementDict]];
    
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-(<=100)-[_registerCaption(25)]-10-[_usernameField(25)]-10-[_emailField(25)]-10-[_passwordField(25)]-10-[_confirmPasswordField(25)]-[_cancelButton(25)]-(<=400)-|"
                                                                      options:NSLayoutFormatDirectionLeadingToTrailing
                                                                      metrics:nil
                                                                        views:elementDict]];
    
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[_registerCaption]-|"
                                                                      options:NSLayoutFormatDirectionLeadingToTrailing
                                                                      metrics:nil
                                                                        views:elementDict]];
    
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[_usernameField]-|"
                                                                      options:NSLayoutFormatDirectionLeadingToTrailing
                                                                      metrics:nil
                                                                        views:elementDict]];
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[_emailField]-|"
                                                                      options:NSLayoutFormatDirectionLeadingToTrailing
                                                                      metrics:nil
                                                                        views:elementDict]];
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[_passwordField]-|"
                                                                      options:NSLayoutFormatDirectionLeadingToTrailing
                                                                      metrics:nil
                                                                        views:elementDict]];
   
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[_confirmPasswordField]-|"
                                                                      options:NSLayoutFormatDirectionLeadingToTrailing
                                                                      metrics:nil
                                                                        views:elementDict]];
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[_registerButton(100)]-10-[_cancelButton(100)]-|"
                                                                      options:NSLayoutFormatDirectionLeadingToTrailing
                                                                      metrics:nil
                                                                        views:elementDict]];
    
    
}



@end
