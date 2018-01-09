//
//  UIButton+CJButton.m
//  CJUtilWork
//
//  Created by 陈敬 on 2018/1/8.
//  Copyright © 2018年 陈敬. All rights reserved.
//

#import "UIButton+CJButton.h"

@implementation UIButton (CJButton)

@dynamic block;

-(void)addCallBackAction:(ButtonActionCallBack)action
{
    self.block = action;
    [self addTarget:self action:@selector(doAction:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)doAction:(UIButton *)button {
    
    self.block(button);
}

@end
