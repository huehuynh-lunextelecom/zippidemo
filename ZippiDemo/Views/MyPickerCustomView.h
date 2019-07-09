//
//  MyPickerCustomView.h
//  ZippiDemo
//
//  Created by Macbook on 7/9/19.
//  Copyright © 2019 Macbook. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MyPickerCustomViewDelegate <NSObject>

@optional
-(void) tapInLeft;
-(void) tapInRight;

@end

NS_ASSUME_NONNULL_BEGIN

@interface MyPickerCustomView : UIView<UIPickerViewDataSource, UIPickerViewDelegate>

@property(nonatomic, weak) id<MyPickerCustomViewDelegate> delegate;

@property(nonatomic, retain) UIButton* leftBtn;
@property(nonatomic, retain) UIButton* rightBtn; 
@property(nonatomic, retain) UIPickerView* picker;

@property(nonatomic, retain) NSMutableArray* pickerDatas;

-(void)initPickerView:(int)heightMenu;
-(void)initDataPickerView:(NSMutableArray *) arrayData;

-(void)showWithAnimRunUp;
-(void)hideWithAnimRunDown;

//data selected <-- tam thoi la string
@property(nonatomic, weak) NSString * idWallet;

-(id) initWithFrame:(CGRect)frame;
@end

NS_ASSUME_NONNULL_END
