//
//  UIButton+CJButton.h
//  CJUtilWork
//
//  Created by 陈敬 on 2018/1/8.
//  Copyright © 2018年 陈敬. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^ButtonActionCallBack)(UIButton *button);

@interface UIButton (CJButton)

@property (nonatomic, copy) ButtonActionCallBack block;

-(void)addCallBackAction:(ButtonActionCallBack)action;

@end
