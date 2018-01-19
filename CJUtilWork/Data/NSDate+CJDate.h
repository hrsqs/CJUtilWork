//
//  NSDate+CJDate.h
//  CJUtilWork
//
//  Created by 陈敬 on 2018/1/19.
//  Copyright © 2018年 陈敬. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (CJDate)
-(NSInteger)quarter;
-(NSString*)yearWithQuarter:(NSInteger)quarter;

-(NSInteger)week;
// 获取小时
- (NSInteger)hour;

// 获取分钟
- (NSInteger)minute;

// 获取秒钟
- (NSInteger)second;

// 获取天
- (NSInteger)day;

// 获取月
- (NSInteger)month;

// 获取年
- (NSInteger)year;

// 获取日期的字符串格式，默认日期格式为 yyyy-MM-dd HH:mm:ss
- (NSString *)dateString;



// 获取指定日期格式的日期字符
- (NSString *)dateStringWithDateFormat:(NSString *)dateFormat;

+ (NSString *)todayDateString;
+ (NSString *)tomorrowDateString;
+ (NSString *)todayDateStringWithDateFormat:(NSString *)dateFormat;
+ (NSString *)tomorrowDateStringWithDateFormat:(NSString *)dateFormat;

// 创建日期
+ (NSDate *)dateWithString:(NSString *)dateString;
+ (NSDate *)dateWithFullString:(NSString *)dateString;
+ (NSDate *)localTimeZomeDateWithDate:(NSDate *)otherDate;
+ (NSDate *)dateWithYear:(NSInteger)year month:(NSInteger)month day:(NSInteger)day;
+ (NSDate *)dateWithMonth:(NSInteger)month day:(NSInteger)day;
- (NSDate *)dateWithFormatYYYYMMDD;

// 比较
- (NSComparisonResult)compareWithoutTime:(NSDate *)other;
- (NSComparisonResult)compareWithMonthAndDay:(NSDate *)other;
- (NSComparisonResult)compareWithYearAndMonthAndDay:(NSDate *)other;
- (NSComparisonResult)compareWithFull:(NSDate *)other;


// 计算剩余时间
+ (NSString *)timeDiffBeginTime:(NSDate *)aBeginTime endTime:(NSDate *)aEndTime;
+ (NSString *)timeSecondDiffBeginTime:(NSDate *)aBeginTime endTime:(NSDate *)aEndTime RemainReductionsecond:(NSInteger)second;
// 计算差距时间
+ (NSInteger)daysBetweenToToday:(NSDate *)date;

#pragma mark - 关于周数据的计算
/**
 *  是否是周末
 *
 *  @return YES:是周末 NO:非周末
 */
- (BOOL)isWeekend;

/**
 *  是否是周末
 *
 *  @return YES:是周末 NO:非周末
 */
+ (BOOL)isWeekendNow;

/**
 * 取得给定日期所在周的星期一的日期
 *
 * @author lhx
 *
 * @return
 */
+ (NSDate *)firstDayOfWeekFromDate:(NSDate *)date;

/**
 *  计算给定日期的下一周
 *
 *  @param date 给定日期
 *
 *  @return
 */
- (NSDate *)nextWeekFromDate:(NSDate *)date;

/**
 *  计算给定日期的上一周
 *
 *  @param date 给定日期
 *
 *  @return
 */
- (NSDate *)previousWeekFromDate:(NSDate *)date;
@end
