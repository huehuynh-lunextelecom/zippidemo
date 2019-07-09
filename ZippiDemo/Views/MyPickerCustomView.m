//
//  MyPickerCustomView.m
//  ZippiDemo
//
//  Created by Macbook on 7/9/19.
//  Copyright © 2019 Macbook. All rights reserved.
//

#import "MyPickerCustomView.h"

@implementation MyPickerCustomView

@synthesize leftBtn = _leftBtn;
@synthesize rightBtn = _rightBtn;
@synthesize picker = _picker;
@synthesize delegate = _delegate;
@synthesize pickerDatas = _pickerDatas;
@synthesize idWallet = _idWallet;

-(id) initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self != nil){
        self.frame = frame;
        self.backgroundColor = [UIColor colorWithRed:239.0/255.0 green:239.0/255.0 blue:244.0/255.0 alpha:1.0];
        NSLog(@"Init custom view");
        _pickerDatas = @[@"item1", @"item2", @"item3"];
    }
    return self;
}

-(void) initPickerView:(int)heightMenu{
    CGRect cgRectPicker = CGRectMake(0, heightMenu, self.frame.size.width, self.frame.size.height - heightMenu);
    _picker.backgroundColor = [UIColor whiteColor];
    _picker = [[UIPickerView alloc]initWithFrame:cgRectPicker];
    _picker.backgroundColor = [UIColor whiteColor];
    _picker.dataSource = self;
    _picker.delegate = self;
    
    int wBtnDefault = 80;
    
    CGRect cgRectLeftBtn = CGRectMake(0, 0, wBtnDefault, heightMenu);
    _leftBtn = [[UIButton alloc]initWithFrame:cgRectLeftBtn];
    _leftBtn.backgroundColor = [UIColor colorWithRed:239.0/255.0 green:239.0/255.0 blue:244.0/255.0 alpha:1.0];
    [_leftBtn setTitleColor: [UIColor blueColor] forState:UIControlStateNormal];
    _leftBtn.tag = 0;
    [_leftBtn setTitle:@"Cancel" forState:UIControlStateNormal];
    [_leftBtn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    
    CGRect cgRectRightBtn = CGRectMake(self.frame.size.width - wBtnDefault, 0, wBtnDefault, heightMenu);
    _rightBtn = [[UIButton alloc]initWithFrame:cgRectRightBtn];
    _rightBtn.backgroundColor = [UIColor colorWithRed:239.0/255.0 green:239.0/255.0 blue:244.0/255.0 alpha:1.0];
    [_rightBtn setTitleColor: [UIColor blueColor] forState:UIControlStateNormal];
    _rightBtn.tag = 1;
    [_rightBtn setTitle:@"Done" forState:UIControlStateNormal];
    [_rightBtn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    
    [self addSubview:_picker];
    [self addSubview:_leftBtn];
    [self addSubview:_rightBtn];
    
    
}

-(void)initDataPickerView:(NSMutableArray *) arrayData {
    _pickerDatas = arrayData;
}

-(void) btnAction:(UIButton*) sender {
    if(sender.tag == 0) {
        if(_delegate != nil && [_delegate respondsToSelector:@selector(tapInLeft)]){
            [_delegate performSelector:@selector(tapInLeft)];
        }
    }
    else if(sender.tag == 1)  {
        if(_delegate != nil && [_delegate respondsToSelector:@selector(tapInRight)]){
            [_delegate performSelector:@selector(tapInRight)];
        }
    }
}


// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return _pickerDatas.count;
}

- (nullable NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return _pickerDatas[row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    _idWallet = _pickerDatas[row];
}

-(void)showWithAnimRunUp{
    [self setUserInteractionEnabled:NO];
    [UIView animateWithDuration:0.5 animations:^{
        self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y - self.frame.size.height, self.frame.size.width, self.frame.size.height);
    } completion:^(BOOL finished) {
        [self setUserInteractionEnabled:YES];
    }];
}
-(void)hideWithAnimRunDown{
    [self setUserInteractionEnabled:NO];
    [UIView animateWithDuration:0.5 animations:^{
        self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y + self.frame.size.height, self.frame.size.width, self.frame.size.height);
    } completion:^(BOOL finished) {
        [self setUserInteractionEnabled:YES];
    }];
}

@end
