//
//  LoginViewController.h
//  ZippiDemo
//
//  Created by Macbook on 7/4/19.
//  Copyright © 2019 Macbook. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LoginViewController : UIViewController<UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate>
- (IBAction)actionCreateWallet:(id)sender;
- (IBAction)actionLoginByEncryptedKey:(id)sender;

@property (weak, nonatomic) IBOutlet UITextField *tfIdWallet;
@property (weak, nonatomic) IBOutlet UITextField *tfPassphraseWallet;

- (IBAction)loginWithSavedWallet:(id)sender;
- (IBAction)showPickerViewWallet:(id)sender;

@property (strong, nonatomic) IBOutlet UIPickerView *pickerViewWallet;
@property (strong, nonatomic) UITextField *dummyTextField;

@end

NS_ASSUME_NONNULL_END
