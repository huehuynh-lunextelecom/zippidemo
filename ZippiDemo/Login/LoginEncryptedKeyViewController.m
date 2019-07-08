//
//  LoginEncryptedKeyViewController.m
//  ZippiDemo
//
//  Created by Macbook on 7/5/19.
//  Copyright © 2019 Macbook. All rights reserved.
//

#import "LoginEncryptedKeyViewController.h"

@interface LoginEncryptedKeyViewController ()
- (IBAction)actionLoginBySavedWallet:(id)sender;
- (IBAction)actionCreateWallet:(id)sender;


@end

@implementation LoginEncryptedKeyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)actionLoginBySavedWallet:(id)sender {
    UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController* loginSavedWalletVC = [storyboard instantiateViewControllerWithIdentifier:@"LoginViewController"];
    [self presentViewController:loginSavedWalletVC animated:YES completion:^{
        // Call back
    }];
}

- (IBAction)actionCreateWallet:(id)sender {
    UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController* createWalletVC = [storyboard instantiateViewControllerWithIdentifier:@"CreateEncryptedKeyVC"];
    [self presentViewController:createWalletVC animated:YES completion:^{
        // Call back
    }];
}
@end
