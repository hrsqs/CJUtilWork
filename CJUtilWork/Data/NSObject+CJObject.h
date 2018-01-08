//
//  NSObject+CJObject.h
//  CJUtilWork
//
//  Created by 陈敬 on 2018/1/8.
//  Copyright © 2018年 陈敬. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (CJObject)

// try catch
+ (NSException *)tryCatch:(void(^)())block;
+ (NSException *)tryCatch:(void(^)())block finally:(void(^)())aFinisheBlock;

/**
 *  在主线程运行block
 *
 *  @param aInMainBlock 被运行的block
 */
+ (void)performInMainThreadBlock:(void(^)())aInMainBlock;
/**
 *  延时在主线程运行block
 *
 *  @param aInMainBlock 被运行的block
 *  @param delay        延时时间
 */
+ (void)performInMainThreadBlock:(void(^)())aInMainBlock afterSecond:(NSTimeInterval)delay;
/**
 *  在非主线程运行block
 *
 *  @param aInThreadBlock 被运行的block
 */
+ (void)performInThreadBlock:(void(^)())aInThreadBlock;
/**
 *  延时在非主线程运行block
 *
 *  @param aInThreadBlock 被运行的block
 *  @param delay          延时时间
 */
+ (void)performInThreadBlock:(void(^)())aInThreadBlock afterSecond:(NSTimeInterval)delay;

@end
