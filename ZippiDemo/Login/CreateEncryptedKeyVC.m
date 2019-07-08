//
//  CreateEncryptedKeyVC.m
//  ZippiDemo
//
//  Created by Macbook on 7/8/19.
//  Copyright © 2019 Macbook. All rights reserved.
//

#import "CreateEncryptedKeyVC.h"

@interface CreateEncryptedKeyVC ()
- (IBAction)actionLoginSavedWallet:(id)sender;
- (IBAction)actionLoginByEncryptedKey:(id)sender;

@end

@implementation CreateEncryptedKeyVC

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

- (IBAction)actionLoginSavedWallet:(id)sender {
    UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController* loginSavedWalletVC = [storyboard instantiateViewControllerWithIdentifier:@"LoginViewController"];
    [self presentViewController:loginSavedWalletVC animated:YES completion:^{
        // Call back
    }];
}

- (IBAction)actionLoginByEncryptedKey:(id)sender {
    UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController* loginByEncryptedKeyVC = [storyboard instantiateViewControllerWithIdentifier:@"LoginEncryptedKeyViewController"];
    [self presentViewController:loginByEncryptedKeyVC animated:YES completion:^{
        // Call back
    }];
}
@end
