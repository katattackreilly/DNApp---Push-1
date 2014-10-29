//
//  ViewController.m
//  DNApp2
//
//  Created by Reilly, Kat on 10/25/14.
//  Copyright (c) 2014 Kat Reilly. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UIView *dialogView;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;
- (IBAction)loginButtonDidPress:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *emailTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UIImageView *emailImageView;
@property (weak, nonatomic) IBOutlet UIImageView *passwordImageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.emailTextField.delegate = self;
    self.passwordTextField.delegate = self;
}

    
    // detect the kind of field
    - (void)textFieldDidBeginEditing:(UITextField*)textField {
        //if the field is email
        if ([textField isEqual: self.emailTextField]) {
            //do the following:
                    //NSLog(@"Email!");
            // set the background image to the active field state
            [self.emailTextField setBackground:[UIImage imageNamed:@"input-outline-active"]];
            
            // set the icon image to its active state
            self.emailImageView.image = [UIImage imageNamed:@"icon-mail-active"];
        } else{
            // set the background image to the inactive field state
            [self.emailTextField setBackground:[UIImage imageNamed:@"input-outline"]];
            
            // set the icon image to its inactive state
            self.emailImageView.image = [UIImage imageNamed:@"icon-mail"];
        }
        
        //if the field is password
        if ([textField isEqual: self.passwordTextField]) {
            //do the following
            NSLog(@"Password!");
            // set the background image to the active field state
            [self.passwordTextField setBackground:[UIImage imageNamed:@"input-outline-active"]];
            
            // set the icon image to its active state
            self.passwordImageView.image = [UIImage imageNamed:@"icon-password-active"];
        }else {
            // set the background image to the inactive field state
            [self.passwordTextField setBackground:[UIImage imageNamed:@"input-outline"]];
            
            // set the icon image to its inactive state
            self.passwordImageView.image = [UIImage imageNamed:@"icon-password"];
        }
    }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

- (IBAction)loginButtonDidPress:(id)sender {
    //Animate login  button
    [UIView animateWithDuration:0.1 animations: ^{
        self.loginButton.transform = CGAffineTransformMakeTranslation(10, 0);
    } completion:^(BOOL finished) {
    //Step 2
    [UIView animateWithDuration:0.1 animations: ^{
        self.loginButton.transform = CGAffineTransformMakeTranslation(-10, 0);
        } completion:^(BOOL finished) {
    //Step 3
    [UIView animateWithDuration:0.1 animations: ^{
        self.loginButton.transform = CGAffineTransformMakeTranslation(0, 0);
            }];
        }];
    }];
    
    //animateWithDuration with Damping
    [UIView animateWithDuration:0.7 delay:0.3 usingSpringWithDamping:0.5 initialSpringVelocity:0 options:0 animations:^{
        //Elongate the size of the dialog view, and make it jump 60 pixels up when keyboard is up
        if (self.dialogView.frame.origin.y ==144) {
             [self.dialogView setFrame:CGRectMake(self.dialogView.frame.origin.x, self.dialogView.frame.origin.y-60, self.dialogView.frame.size.width, 320)];
        }
       } completion:^(BOOL finished) { }];
}
@end
