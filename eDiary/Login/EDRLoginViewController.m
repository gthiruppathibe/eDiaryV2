//
//  EDRLoginViewController.m
//  eDiary
//
//  Created by Thiruppathi Gandhi on 2/11/15.
//  Copyright (c) 2015 Thiruppathi Gandhi. All rights reserved.
//

#import "EDRLoginViewController.h"

@interface EDRLoginViewController ()

@property (nonatomic,strong) UILabel *captionDesc;
@property (nonatomic,strong) UITextField *emailField;
@property (nonatomic,strong) UITextField *passwordField;
@property (nonatomic,strong) UIButton *loginButton;

@end

@implementation EDRLoginViewController

@synthesize captionDesc = _captionDesc;
@synthesize emailField = _emailField;
@synthesize passwordField = _passwordField;
@synthesize loginButton = _loginButton;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self interfaceBuilder];
}

- (void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    [self screenEnable:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark property getter method

- (UILabel*)captionDesc {
    if (!_captionDesc) {
        _captionDesc = [[UILabel alloc] init];
        _captionDesc.text = @"eDiary";
        _captionDesc.textColor = [UIColor blackColor];
        _captionDesc.textAlignment = NSTextAlignmentCenter;
        _captionDesc.backgroundColor = [UIColor clearColor];
        _captionDesc.font = [UIFont systemFontOfSize:20.0f];
        _captionDesc.adjustsFontSizeToFitWidth = YES;
        _captionDesc.translatesAutoresizingMaskIntoConstraints = NO;
    }
    return _captionDesc;
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

- (UIButton*)loginButton {
    if(!_loginButton) {
        _loginButton = [[UIButton alloc] init];
        [_loginButton setTranslatesAutoresizingMaskIntoConstraints:NO];
        [_loginButton setTitle:@"Sign in" forState:UIControlStateNormal];
        [_loginButton setTitleColor: [UIColor blackColor] forState:UIControlStateNormal];
        [_loginButton addTarget:self action:@selector(btnLoginClicked:) forControlEvents:UIControlEventTouchDown];
    }
    return _loginButton;
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

#pragma mark create screen

- (void) interfaceBuilder {
    [self.view addSubview:self.captionDesc];
    [self.view addSubview:self.emailField];
    [self.view addSubview:self.passwordField];
    [self.view addSubview:self.loginButton];
    
    NSDictionary *elementDict = NSDictionaryOfVariableBindings(_captionDesc,_emailField,_passwordField,_loginButton);
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-(<=100)-[_captionDesc(25)]-10-[_emailField(25)]-10-[_passwordField(25)]-10-[_loginButton(25)]-(<=400)-|"
                                                                      options:NSLayoutFormatDirectionLeadingToTrailing
                                                                      metrics:nil
                                                                        views:elementDict]];
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[_captionDesc]-|"
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
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[_loginButton]-|"
                                                                      options:NSLayoutFormatDirectionLeadingToTrailing
                                                                      metrics:nil
                                                                        views:elementDict]];
    
    
    
}

#pragma mark presenter delegate method

- (void) loginCredentialResponse:(NSString*) message {
    
    UIAlertView *loginAlert = [[UIAlertView alloc] initWithTitle: nil message:message delegate:self cancelButtonTitle:nil otherButtonTitles:@"Ok", nil];
    [loginAlert show];
    
    [self screenEnable:YES];
}


#pragma mark perform action

- (void) screenEnable:(BOOL)value {
    [self.emailField setEnabled:value];
    [self.passwordField setEnabled:value];
    [self.loginButton setEnabled:value];
    if (value == YES) {
        [self.loginButton setTitleColor: [UIColor blackColor] forState:UIControlStateNormal];
    }
    else {
        [self.loginButton setTitleColor: [UIColor grayColor] forState:UIControlStateNormal];
    }
}

- (void) btnLoginClicked: (id) sender {
    [self screenEnable:NO];
    [self.presenter loginCredentialWithEmail:self.emailField.text Password:self.passwordField.text];
}

@end
