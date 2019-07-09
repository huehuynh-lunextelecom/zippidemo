//
//  LoginViewController.m
//  ZippiDemo
//
//  Created by Macbook on 7/4/19.
//  Copyright © 2019 Macbook. All rights reserved.
//

#import "LoginViewController.h"


@interface LoginViewController ()
{
    //fake data picker view
    NSArray *pvWalletData;
}
@property(weak,nonatomic) NSString *idWallet;
@property(weak,nonatomic) NSString *passPhraseWallet;
@property(retain,nonatomic) MyPickerCustomView *walletPickerView;

@end

@implementation LoginViewController

@synthesize idWallet = _idWallet;
@synthesize passPhraseWallet = _passPhraseWallet;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //fake data
    self.idWallet = @"1";
    self.passPhraseWallet = @"1";
    
    //setup textfield for enter key
    [self.tfIdWallet setDelegate:self];
    [self.tfPassphraseWallet setDelegate:self];
    
    //wallet pickerview
    [self setUpPickerViewWallet];
}

- (IBAction)actionCreateWallet:(id)sender {
    UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController* createWalletVC = [storyboard instantiateViewControllerWithIdentifier:@"CreateEncryptedKeyVC"];
    [self presentViewController:createWalletVC animated:YES completion:^{
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

//-(void) viewWillAppear:(BOOL)animated {
//
//}
//
//-(void) viewDidAppear:(BOOL)animated {
//
//}
//
//-(void) viewWillDisappear:(BOOL)animated {
//
//}
//
//-(void)  viewDidDisappear:(BOOL)animated {
//
//}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)loginWithSavedWallet:(id)sender {
    bool isCorrectIdWallet = [self.idWallet isEqualToString:[self.tfIdWallet text]];
    bool isCorrectPassPhrase = [self.passPhraseWallet isEqualToString:[self.tfPassphraseWallet text]];
    if(isCorrectIdWallet && isCorrectPassPhrase)
    {
        NSLog(@"Login success!!!!!");
    }
}

- (IBAction)showPickerViewWallet:(id)sender {
    [_walletPickerView setHidden:NO];
    [_walletPickerView showWithAnimRunUp];
}

-(void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}

//// pickerview datasource methods
//- (NSInteger)numberOfComponentsInPickerView:(nonnull UIPickerView *)pickerView {
//    return 1;
//}
//
//- (NSInteger)pickerView:(nonnull UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
//    return pvWalletData.count;
//}
////------
//
//// pickerview delegate methods
//- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
//    return pvWalletData[row];
//}
//
//- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
////    self.tfIdWallet.text = pvWalletData[row];
//    self.selectedWallet = pvWalletData[row];
//}

//custom wallet pickerview
-(void)setUpPickerViewWallet{
    NSLog(@"setUpPickerViewWallet");
    pvWalletData = @[@"111", @"112", @"113", @"114", @"115", @"116"];
    
    _walletPickerView = [[MyPickerCustomView alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.origin.x, [UIScreen mainScreen].bounds.size.height - 216, [UIScreen mainScreen].bounds.size.width, 216)];
    
    _walletPickerView.delegate = self;
    [_walletPickerView initDataPickerView:pvWalletData];
    
    [_walletPickerView initPickerView:44];
    [_walletPickerView setHidden:YES];
    [_walletPickerView hideWithAnimRunDown];
    
    [self.view addSubview:_walletPickerView];
    
}

-(void)onClickWalletPickerDone{

}

-(void)onClickWalletPickerCancel{
    
}

//------

-(void) tapInLeft {
    NSLog(@"Login View Handle tapInLeft");
    if(_walletPickerView == nil) return;
        
    //cancel select wallet in picker view
    
    [_walletPickerView hideWithAnimRunDown];
}

-(void) tapInRight {
    NSLog(@"Login View Handle tapInRight");
    if(_walletPickerView == nil) return;
    
    //done select wallet in picker view
    if(_walletPickerView.idWallet != nil){
        _tfIdWallet.text = _walletPickerView.idWallet;
    }
//    [_walletPickerView setHidden:YES];
    [_walletPickerView hideWithAnimRunDown];
}

//texfield enter key
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

@end
