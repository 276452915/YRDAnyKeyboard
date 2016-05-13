//
//  UITextField+ExtentRange.h
//  YRDAnyKeyboard
//
//  Created by 王亮 on 16/5/12.
//  Copyright © 2016年 王亮. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField (Helper)
- (NSRange) selectedRange;
- (void) setSelectedRange:(NSRange) range;
@end
