//
//  NSString+CJString.h
//  CJUtilWork
//
//  Created by 陈敬 on 2018/1/8.
//  Copyright © 2018年 陈敬. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NSString (CJString)

/**
 * 判空方法
 */
- (NSString *)isNullToString;

/**
 * 计算文字高度
 * @param font 字体
 * @param width 最大宽度
 * @return value
 */
- (CGFloat) heightWithFontSize:(UIFont*)font width:(CGFloat)width;

/**
 * 计算文字宽度
 * @param font 字体
 * @param maxHeight 最大高度
 * @return value
 */
- (CGFloat) widthWithFontSize:(UIFont*)font height:(CGFloat)maxHeight;

/**
 * 电话号码中间4位*显示
 * @param phoneNum 电话号码
 * @return 159****6505
 */
+ (NSString*) getSecrectStringWithPhoneNumber:(NSString*)phoneNum;


/**
 * 银行卡号中间8位*显示
 * @param accountNo 银行卡号
 * @return xxxx **** **** xxxx
 */
+ (NSString*) getSecrectStringWithAccountNo:(NSString*)accountNo;


/**
 * 转为手机格式，默认为-
 * @param mobile 手机号
 * @return xxx-xxxx-xxxx
 */
+ (NSString*) stringMobileFormat:(NSString*)mobile;

/**
 * NSString转为NSNumber
 * @return NSNumber
 */
- (NSNumber*) toNumber;

/**
 * 去掉前后空格
 * @return string
 */
- (NSString*) trimmedString;

/**
 通过时间戳计算时间差（几小时前、几天前
 @param compareDate 时间戳
 @return 时间间隔
 */
+ (NSString *) compareCurrentTime:(NSTimeInterval) compareDate;

/**
 通过时间戳得出对应的时间
 @param timestamp 时间戳
 @return xxxx年xx月xx日
 */
+ (NSString *) getDateStringWithTimestamp:(NSTimeInterval)timestamp;

/**
 //通过时间戳和显示时间
 @param timestamp 时间戳
 @param formatter 格式
 @return 自定义格式的时间
 */
+ (NSString *) getStringWithTimestamp:(NSTimeInterval)timestamp formatter:(NSString*)formatter;

/**
 通过时间字符串和自定义格式获取年龄
 @param timeStr 时间字符串
 @param formatter 格式
 @return 年龄
 */
+ (NSInteger) getAgeWithTimeStr:(NSString*)timeStr formatter:(NSString*)formatter;

//有效的电话号码
- (BOOL) isValidMobileNumber;

//有效的真实姓名
- (BOOL) isValidRealName;

//是否只有中文
- (BOOL) isOnlyChinese;

//有效的验证码(根据自家的验证码位数进行修改)
- (BOOL) isValidVerifyCode;

//有效的银行卡号
- (BOOL) isValidBankCardNumber;

//有效的邮箱
- (BOOL) isValidEmail;

//有效的字母数字密码
- (BOOL) isValidAlphaNumberPassword;

//检测有效身份证
//15位
- (BOOL) isValidIdentifyFifteen;

//18位
- (BOOL) isValidIdentifyEighteen;

//限制只能输入数字
- (BOOL) isOnlyNumber;

//安全的SubstringFromIndex
- (NSString *)safeSubstringFromIndex:(NSUInteger)from;

//安全的SubstringToIndex
- (NSString *)safeSubstringToIndex:(NSUInteger)to;

//安全的SubstringWithRange
- (NSString *)safeSubstringWithRange:(NSRange)range;

//安全的RangeOfString
- (NSRange)safeRangeOfString:(NSString *)aString;
- (NSRange)safeRangeOfString:(NSString *)aString options:(NSStringCompareOptions)mask;

//安全的StringByAppendingString
- (NSString *)safeStringByAppendingString:(NSString *)aString;

@end


@interface NSAttributedString (CJAttributedString)
//由于系统计算富文本的高度不正确，自己写了方法
- (CGFloat)heightWithContainWidth:(CGFloat)width;

@end



@interface NSMutableString (CJMutableString)

- (void)safeInsertString:(NSString *)aString atIndex:(NSUInteger)loc;

- (void)safeAppendString:(NSString *)aString;

- (void)safeSetString:(NSString *)aString;

- (NSUInteger)safeReplaceOccurrencesOfString:(NSString *)target withString:(NSString *)replacement options:(NSStringCompareOptions)options range:(NSRange)searchRange;
@end

