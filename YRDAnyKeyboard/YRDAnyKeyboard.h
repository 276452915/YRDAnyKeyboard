//
//  YRDAnyKeyboard.h
//  ZenKeyboard
//
//  Created by 王亮 on 15/7/6.
//  Copyright (c) 2015年 宜信.宜人贷 All rights reserved.
//
#import "Aspects.h"
#import <UIKit/UIKit.h>

/**
 *  业务场景下的功能键类型
 */
typedef NS_ENUM(NSUInteger, YRDAnyKeyboardStyle) {
    /**
     *  无功能键
     */
    YRDAnyKeyboardStyleNone,
    /**
     *  空(@"")白功能键
     */
    YRDAnyKeyboardStyleBlank,
    /**
     *  点(.)功能键
     */
    YRDAnyKeyboardStyleDot,
    /**
     *  叉(X)功能键
     */
    YRDAnyKeyboardStyleFork,
    /**
     *  横杠(-)功能键
     */
    YRDAnyKeyboardStyleMinus
 

};
@protocol YRDAnyKeyboardDelegate <NSObject>
@optional
/**
 *  点击数字键后的回调方法 数字键仅有: 0 - 9
 *
 *  @param key 点击的数字
 */
- (void)numericKeyDidPressed:(int)key;
/**
 *  点击收起键后的回调方法
 */
- (void)callapseKeyDidPressed;
/**
 *  点击功能键后的回调方法 功能键仅有: "" , "." ,"X", "-"
 */
- (void)functionalKeyDidPressed;
/**
 * 点击确定键后的回调方法
 */
- (void)doneKeyDidPressed;
/**
 *  点击删除键后的回调方法  如果文本框的内容为空时候，就会停用确定键
 */
- (void)backspaceKeyDidPressed;

@end
@interface YRDAnyKeyboard : UIView
/**
 *  所有的键盘键
 */
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *arrBtnKeys;
/**
 *  键盘所关联的UITextField
 */
@property (nonatomic, weak) UITextField *txtf;
/**
 *  键盘的功能键类型
 */
@property (nonatomic,unsafe_unretained) YRDAnyKeyboardStyle anyKeyBoardStyle;
/**
 *  键盘的功能键代理
 */
@property (nonatomic,weak) id<YRDAnyKeyboardDelegate,UITextFieldDelegate> delegate;


@end
