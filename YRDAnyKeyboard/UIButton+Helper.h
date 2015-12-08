//  UIButton+Helper.h
//  宜人贷借款
//
//  Created by 王亮 on 15/5/30.
//  Copyright (c) 2015年 宜信.宜人贷. All rights reserved.
//

#import <UIKit/UIKit.h>
#define kYRD_STANDERED1 RGBCOLOR(1, 148, 221)
#define kYRD_BUTTON_STYLE @"YRDButtonStyle"

#define kYRD_BUTTON_STYLE_D02_CORNER_RADIUS 8.0f
#define kYRD_BUTTON_STYLE_D02_BORDER_WIDTH  2.0f

typedef NS_OPTIONS(NSUInteger, YRDButtonStyle) {
 
    YRDButtonStyleDefault                   = 0,
    YRDButtonStyleD02
//    Normal                    = 1  ,
//    YRDButtonStyleD02Highlighted               = 2  ,
//    YRDButtonStyleD02Disabled                  = 3
 
};


@interface UIButton (Helper)

@property (unsafe_unretained,nonatomic) YRDButtonStyle buttonStyle;
@end


IB_DESIGNABLE
@interface UIButton(Appearance) // YRDButtonKey : UIButton

@property (nonatomic,copy)IBInspectable NSString * normalBackgroundColor;
@property (nonatomic,copy)IBInspectable NSString * highlightedBackgroundColor;
@property (nonatomic,copy)IBInspectable NSString * disabledBackgroundColor;


- (void)setBackgroundColor:(UIColor *)color forState:(UIControlState)state;
- (void)setBackgroundHexColor:(NSString *)hexColor forState:(UIControlState)state;

+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size;
@end
