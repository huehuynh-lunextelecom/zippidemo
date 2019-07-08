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
 //   [self.pickerViewWallet setUserInteractionEnabled:YES];
    self.pickerViewWallet.hidden = NO;
}

-(void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}

// pickerview datasource methods
- (NSInteger)numberOfComponentsInPickerView:(nonnull UIPickerView *)pickerView {
    return 1;
}

- (NSInteger)pickerView:(nonnull UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return pvWalletData.count;
}
//------

// pickerview delegate methods
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return pvWalletData[row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    self.tfIdWallet.text = pvWalletData[row];
}

//custom wallet pickerview
-(void)setUpPickerViewWallet{
//    UIPickerView* pvWallet = [UIPickerView new];
//    self.tfIdWallet.inputView = pvWallet;

    //setup picker view
    self.pickerViewWallet.dataSource = self;
    self.pickerViewWallet.delegate = self;
    self.pickerViewWallet.showsSelectionIndicator = YES;
    
    pvWalletData = @[@"111", @"112", @"113", @"114", @"115", @"116"];
    
    // next step is to write this configure method getting called here
    [self configurePickerWalletSubviews];
    
    // lastly, add the dummyTextField to your view.
    [self.view addSubview:self.dummyTextField];
}

-(void)onClickWalletPickerDone{

}

-(void)onClickWalletPickerCancel{
    
}

- (void)configurePickerWalletSubviews {
    // A UIPickerView must be added as an inputView to a UITextField in order to be displayed on button tap
    // So you need to create a dummyTextField to do so.
    self.dummyTextField = [UITextField new];
    
    // Create a toolbar to add a done button
    UIToolbar *toolBar= [[UIToolbar alloc] initWithFrame:CGRectMake(0,0,[UIScreen mainScreen].bounds.size.width,44)];
    [toolBar setBarStyle:UIBarStyleDefault];
    
    //add button done
//    UIBarButtonItem* btnDone = [[UIBarButtonItem alloc] initWithTitle:@"Done" style:UIBarButtonItemStylePlain target:self action:@selector(onClickWalletPickerDone)];
    
    UIButton* btnDone = [[UIButton alloc] init];
//    btnDone.
    
    UIBarButtonItem* btnCancel = [[UIBarButtonItem alloc] initWithTitle:@"Cancel" style:UIBarButtonItemStylePlain target:self action:@selector(onClickWalletPickerCancel)];
    
    UIBarButtonItem* title = [[UIBarButtonItem alloc] initWithTitle:@"Select a Wallet" style:UIBarButtonItemStylePlain target:self action:nil];
    
    
    
    toolBar.items = @[btnCancel, title, btnDone];
    title.tintColor = [UIColor blueColor];
    
 //   title.tintColor = [UIColor colorWithRed:1/255 green:1/255 blue:1/255 alpha:255/255];
    [self.pickerViewWallet addSubview:toolBar];
    
    
//    UIBarButtonItem *done = [[UIBarButtonItem alloc] initWithTitle:@"Done" style:UIBarButtonItemStylePlain target:self action:@selector(locationPressed)];
    
//    // Create a flex space so that done button will be right aligned
//    UIBarButtonItem *flex = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
//    UIBarButtonItem *cancel = [[UIBarButtonItem alloc] initWithTitle:@"Cancel" style:UIBarButtonItemStylePlain target:self action:@selector(dismissPicker)];
//    toolBar.items = @[cancel, flex, done];
//    done.tintColor = [UIColor blackColor];
//
//    [self.pickerViewWallet addSubview:toolBar];
//
//    // Create an input view to add picker + done button as subviews
//    UIView *inputView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, self.pickerViewWallet.frame.size.height + 44)];
//    [self.pickerViewWallet setFrame:CGRectMake(0, 0, inputView.frame.size.width, inputView.frame.size.height)];
//    inputView.backgroundColor = [UIColor clearColor];
//    [inputView addSubview:self.pickerViewWallet];
//    [inputView addSubview:toolBar];
//
//    // Set custom inputView as container for picker view
//    self.dummyTextField.inputView = inputView;
//
//    // Hiding the textfield will hide the picker
//    [self.dummyTextField setHidden:YES];
}
//------

@end
