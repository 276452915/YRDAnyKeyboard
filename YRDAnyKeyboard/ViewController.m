//
//  ViewController.m
//  YRDAnyKeyboard
//
//  Created by 王亮 on 15/11/18.
//  Copyright © 2015年 宜信.宜人贷. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<YRDAnyKeyboardDelegate,UITextFieldDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    [self setAnyKeyboard:YRDAnyKeyboardStyleNone];

}
#pragma mark ----------    设置自定义键盘     ------------------
-(void)setAnyKeyboard:(YRDAnyKeyboardStyle) anyKeyBoardStyle
{
    YRDAnyKeyboard * tmpCustomView;
    if (!self.txtfKeyword.inputView) {
        NSArray *arrNib = [[NSBundle mainBundle] loadNibNamed:@"YRDAnyKeyboard" owner:self options:nil];
        tmpCustomView = [arrNib firstObject];
        tmpCustomView.txtf =  self.txtfKeyword;
        tmpCustomView.delegate = self ;
    }else{
        tmpCustomView = (YRDAnyKeyboard *)self.txtfKeyword.inputView;
    }
    tmpCustomView.anyKeyBoardStyle = anyKeyBoardStyle;
}
#pragma mark ----------    YRDAnyKeyboardDelegate     ------------------
- (void)numericKeyDidPressed:(int)key{
    NSLog(@"按到了 按钮%d",key);
}

- (void)callapseKeyDidPressed{
    NSLog(@"按到了 收起键盘按钮");
}
- (void)functionalKeyDidPressed{
    NSLog(@"按到了 功能按钮");
}
- (void)doneKeyDidPressed{
    NSLog(@"按到了 确定按钮");
}
- (void)backspaceKeyDidPressed{
    NSLog(@"按到了 删除按钮");
}

#pragma mark ----------    UISegmentedControl Delegate     ------------------
- (IBAction)segValueChanged:(UISegmentedControl *)sender
{
    [self setAnyKeyboard:sender.selectedSegmentIndex];
    [self.txtfKeyword becomeFirstResponder];
 }
@end
