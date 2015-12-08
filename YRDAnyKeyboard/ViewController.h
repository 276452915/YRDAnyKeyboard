//
//  ViewController.h
//  YRDAnyKeyboard
//
//  Created by 王亮 on 15/11/18.
//  Copyright © 2015年 宜信.宜人贷. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YRDAnyKeyboard.h"
@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UISegmentedControl *segFun;
@property (weak, nonatomic) IBOutlet UITextField *txtfKeyword;

- (IBAction)segValueChanged:(UISegmentedControl *)sender;

@end

