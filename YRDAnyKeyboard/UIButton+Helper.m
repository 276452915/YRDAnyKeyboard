//
//  UIButton+Helper.m
//  宜人贷借款
//
//  Created by 王亮 on 15/5/30.
//  Copyright (c) 2015年 宜信.宜人贷. All rights reserved.
//

#import "UIButton+Helper.h"

@implementation UIButton (Helper)


-(void)setButtonStyle:(YRDButtonStyle) buttonStyle
{
    NSString * val =FORMATER(@"%lu", buttonStyle);
    objc_setAssociatedObject(self, kYRD_BUTTON_STYLE, val, OBJC_ASSOCIATION_RETAIN);

}

-(YRDButtonStyle)buttonStyle
{
    NSString * status = objc_getAssociatedObject(self,  kYRD_BUTTON_STYLE);
    if (status) {
        return  [status integerValue];
    }else{
        return 0;
    }
}

@end


@implementation UIButton(Appearance)//YRDButtonKey

-(void)setNormalBackgroundColor:(NSString *)normalBackgroundColor
{
    [self setBackgroundHexColor: normalBackgroundColor  forState:(UIControlStateNormal)];
}
-(NSString *)normalBackgroundColor
{
    return  @"";//空实现
}
-(void)setHighlightedBackgroundColor:(NSString *)highlightedBackgroundColor
{
    [self setBackgroundHexColor: highlightedBackgroundColor forState:(UIControlStateHighlighted)];
}
-(NSString *)highlightedBackgroundColor
{
    return @"";
}
-(void)setDisabledBackgroundColor:(NSString *)disabledBackgroundColor
{
    [self setBackgroundHexColor:disabledBackgroundColor  forState:(UIControlStateDisabled)];
}
-(NSString *)disabledBackgroundColor
{
    return @"";
}

- (void)setBackgroundColor:(UIColor *)color forState:(UIControlState)state
{
    [self setBackgroundImage:[self.class imageWithColor:color size:CGSizeZero] forState:state];

}
- (void)setBackgroundHexColor:(NSString *)hexColor forState:(UIControlState)state
{
    [self setBackgroundColor:[self.class hexColor:hexColor] forState:state];
    
}


+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size
{
    
    if (CGSizeEqualToSize(size,CGSizeZero)) {
        size.height = 2;
        size.width =2;
    }
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    
    UIGraphicsBeginImageContext(rect.size);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return image;
    
}

+ (UIColor *)hexColor:(NSString *)hexColor
{
    unsigned int red, green, blue, alpha;
    NSRange range;
    range.length = 2;
    @try {
        if ([hexColor hasPrefix:@"#"]) {
            hexColor = [hexColor stringByReplacingOccurrencesOfString:@"#" withString:@""];
        }
        range.location = 0;
        [[NSScanner scannerWithString:[hexColor substringWithRange:range]] scanHexInt:&red];
        range.location = 2;
        [[NSScanner scannerWithString:[hexColor substringWithRange:range]] scanHexInt:&green];
        range.location = 4;
        [[NSScanner scannerWithString:[hexColor substringWithRange:range]] scanHexInt:&blue];
        
        if ([hexColor length] > 6) {
            range.location = 6;
            [[NSScanner scannerWithString:[hexColor substringWithRange:range]] scanHexInt:&alpha];
        } else {
            alpha = 100.0;
        }
    }
    @catch (NSException * e) {
        return [UIColor blackColor];
    }
    
    return [UIColor colorWithRed:(float)(red/255.0f) green:(float)(green/255.0f) blue:(float)(blue/255.0f) alpha:(float)(alpha/100.0f)];
}
@end