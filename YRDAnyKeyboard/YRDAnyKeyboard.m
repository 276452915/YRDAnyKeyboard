//
//  YRDAnyKeyboard.m
//  ZenKeyboard
//
//  Created by 王亮 on 15/7/6.
//  Copyright (c) 2015年 宜信.宜人贷 All rights reserved.
//

#import "YRDAnyKeyboard.h"

@interface YRDAnyKeyboard()
@property (nonatomic,assign) id<UITextInput> textInputDelegate;
@end
@implementation YRDAnyKeyboard

-(void)setAnyKeyBoardStyle:(YRDAnyKeyboardStyle)anyKeyBoardStyle
{
    _anyKeyBoardStyle = anyKeyBoardStyle;
    UIButton * btnFunction = self.arrBtnKeys[11];
     btnFunction.enabled = YES;
    UIButton * btnConfirmation = [self.arrBtnKeys objectAtIndex:13];
    NSUInteger loc = [self.txtf.text length];
    btnConfirmation.enabled = (loc > 0);
    
    switch (_anyKeyBoardStyle) {
        case YRDAnyKeyboardStyleNone: {
        
            break;
        }
        case YRDAnyKeyboardStyleBlank: {
            btnFunction.enabled = NO;
            [btnFunction setTitle:@"" forState:(UIControlStateNormal)];
            [btnFunction setTitle:@"" forState:(UIControlStateHighlighted)];
            [btnFunction setTitle:@"" forState:(UIControlStateDisabled)];
            break;
        }
        case YRDAnyKeyboardStyleDot: {
            
            [btnFunction setTitle:@"." forState:(UIControlStateNormal)];
              [btnFunction setTitle:@"." forState:(UIControlStateHighlighted)];
              [btnFunction setTitle:@"." forState:(UIControlStateDisabled)];
            break;
        }
        case YRDAnyKeyboardStyleFork: {
             [btnFunction setTitle:@"X" forState:(UIControlStateNormal)];
             [btnFunction setTitle:@"X" forState:(UIControlStateHighlighted)];
             [btnFunction setTitle:@"X" forState:(UIControlStateDisabled)];
            break;
        }
        case YRDAnyKeyboardStyleMinus: {
               [btnFunction setTitle:@"-" forState:(UIControlStateNormal)];
               [btnFunction setTitle:@"-" forState:(UIControlStateHighlighted)];
               [btnFunction setTitle:@"-" forState:(UIControlStateDisabled)];

            break;
        }
        default: {
            break;
        }
    }
 
}
/**
 *  按键动作
 *
 *  @param sender 键盘上按重的button
 *  @param event  <#event description#>
 */
- (IBAction)pressAction:(UIButton *)sender forEvent:(UIEvent *)event {

    NSUInteger loc = [self.txtf.text length];
    NSRange range =NSMakeRange(loc, 0);
    UIButton * btnConfirmation = [self.arrBtnKeys objectAtIndex:13];

    switch (sender.tag) {
//            收起键盘
        case  11:{
            [self.txtf resignFirstResponder];
            if (_delegate && [self.delegate respondsToSelector:@selector(callapseKeyDidPressed)]) {
                [self.delegate callapseKeyDidPressed];
            }
            break;
            
        }
//            特别盘
        case  12:{
            if (_delegate && [_delegate respondsToSelector:@selector(textField:shouldChangeCharactersInRange:replacementString:)]) {
                BOOL result = [self.delegate textField:self.txtf shouldChangeCharactersInRange:range replacementString:[NSString stringWithFormat:@"%@", sender.titleLabel.text]];
                if (!result) return;
                
            }
            [self.textInputDelegate insertText:[NSString stringWithFormat:@"%@", sender.titleLabel.text]];
            if (_delegate && [self.delegate respondsToSelector:@selector(functionalKeyDidPressed)]) {
                [self.delegate functionalKeyDidPressed];
            }
                btnConfirmation.enabled = YES;
            break;
            
        }
//            确定
        case  13:{
//            self.txtf.text =  @"4";
            if (_delegate && [self.delegate respondsToSelector:@selector( doneKeyDidPressed)]) {
                [self.delegate doneKeyDidPressed];
            
            }
             [self.txtf resignFirstResponder];
            break;
            
        }
//            删除
        case  14:{
            [self.textInputDelegate deleteBackward];
            if (_delegate && [self.delegate respondsToSelector:@selector( backspaceKeyDidPressed)]) {
                [self.delegate backspaceKeyDidPressed];
            }
            loc = [self.txtf.text length];
             btnConfirmation.enabled = loc;
            break;
            
        }
//         按键“0”
        case  10:{
            if (_delegate && [_delegate respondsToSelector:@selector(textField:shouldChangeCharactersInRange:replacementString:)]) {
                BOOL result = [self.delegate textField:self.txtf shouldChangeCharactersInRange: range replacementString:@"0"];
                if (!result) return;
                
            }
            
            int num = 0;
            [self.textInputDelegate insertText:[NSString stringWithFormat:@"%ld",(long)num]];
            if (_delegate && [self.delegate respondsToSelector:@selector( numericKeyDidPressed:)]) {
                [self.delegate numericKeyDidPressed:( int )num];
            }
            btnConfirmation.enabled = YES;
            break;
        }
        default:{
            if (_delegate && [_delegate respondsToSelector:@selector(textField:shouldChangeCharactersInRange:replacementString:)]) {
                BOOL result = [self.delegate textField:self.txtf shouldChangeCharactersInRange: range replacementString:FORMATER(@"%ld",(long)sender.tag)];
                if (!result) return;
                
            }
            [self.textInputDelegate insertText:FORMATER(@"%ld",(long)sender.tag)];
            if (_delegate && [self.delegate respondsToSelector:@selector( numericKeyDidPressed:)]) {
                [self.delegate numericKeyDidPressed:( int )sender.tag];
            }
            btnConfirmation.enabled = YES;
            break;
        }
           
    }
}
/**
 *  把自己设置成UITextField的自定义键盘
 *
 *  @param textField 需要自定的UITextField实例
 */
- (void)setTxtf:(UITextField *)textField {
    if (textField) {
        _txtf = textField;
        _txtf.inputView = self;
        self.textInputDelegate = _txtf;
        NSError * error;
        BWS(blockWeakSelf);
        [textField aspect_hookSelector:@selector(setText:) withOptions:AspectPositionAfter usingBlock: ^(id<AspectInfo> aspectInfo){
            [blockWeakSelf observeValueForKeyPath:nil ofObject:nil change:nil context:nil];
        } error:&error];
    }else{
        _txtf = nil;
        _txtf.inputView = nil;
        self.textInputDelegate = nil;
    }

    
}

/* AOP 切面编程 方法*/
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    NSUInteger loc = [self.txtf.text length];
    UIButton * btnConfirmation = [self.arrBtnKeys objectAtIndex:13];
    btnConfirmation.enabled = (loc > 0);
}

@end
