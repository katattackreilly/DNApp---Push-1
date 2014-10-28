//
//  ViewController.m
//  DNApp2
//
//  Created by Reilly, Kat on 10/25/14.
//  Copyright (c) 2014 Kat Reilly. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *dialogView;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;
- (IBAction)loginButtonDidPress:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
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
        //Change the size of the dialogView
        [self.dialogView setFrame:CGRectMake(self.dialogView.frame.origin.x, self.dialogView.frame.origin.y, self.dialogView.frame.size.width, 320)];} completion:^(BOOL finished) { }];
}
@end
