//
//  NSDate+CJDate.m
//  CJUtilWork
//
//  Created by 陈敬 on 2018/1/19.
//  Copyright © 2018年 陈敬. All rights reserved.
//

#import "NSDate+CJDate.h"

#define DATE_COMPONENTS (NSYearCalendarUnit| NSMonthCalendarUnit | NSDayCalendarUnit | NSWeekCalendarUnit |  NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit | NSWeekdayCalendarUnit | NSWeekdayOrdinalCalendarUnit)

#define CURRENT_CALENDAR [NSCalendar currentCalendar]

@implementation NSDate (CJDate)

-(NSInteger)week{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components:( NSYearCalendarUnit
                                                         | NSMonthCalendarUnit
                                                         | NSDayCalendarUnit
                                                         | NSHourCalendarUnit
                                                         | NSMinuteCalendarUnit
                                                         | NSSecondCalendarUnit)
                                               fromDate:self];
    if ([components day]/4 >4) {
        return 4;
    }else{
        return [components day]/4;
    }
}

-(NSInteger)quarter{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components:( NSYearCalendarUnit
                                                         | NSMonthCalendarUnit
                                                         | NSDayCalendarUnit
                                                         | NSHourCalendarUnit
                                                         | NSMinuteCalendarUnit
                                                         | NSSecondCalendarUnit)
                                               fromDate:self];
    
    return [components month]/3 + ([components month]%3!=0?1:0);
    
    
}


-(NSString*)yearWithQuarter:(NSInteger)quarter{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components:( NSYearCalendarUnit
                                                         | NSMonthCalendarUnit
                                                         | NSDayCalendarUnit
                                                         | NSHourCalendarUnit
                                                         | NSMinuteCalendarUnit
                                                         | NSSecondCalendarUnit)
                                               fromDate:self];
    
    return [NSString stringWithFormat:@"%ld,%ld",[components year],quarter];
}

// 获取小时
- (NSInteger)hour
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components:( NSYearCalendarUnit
                                                         | NSMonthCalendarUnit
                                                         | NSDayCalendarUnit
                                                         | NSHourCalendarUnit
                                                         | NSMinuteCalendarUnit
                                                         | NSSecondCalendarUnit)
                                               fromDate:self];
    return [components hour];
}

// 获取分钟
- (NSInteger)minute
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components:( NSYearCalendarUnit
                                                         | NSMonthCalendarUnit
                                                         | NSDayCalendarUnit
                                                         | NSHourCalendarUnit
                                                         | NSMinuteCalendarUnit
                                                         | NSSecondCalendarUnit)
                                               fromDate:self];
    return [components minute];
}

// 获取秒钟
- (NSInteger)second
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components:( NSYearCalendarUnit
                                                         | NSMonthCalendarUnit
                                                         | NSDayCalendarUnit
                                                         | NSHourCalendarUnit
                                                         | NSMinuteCalendarUnit
                                                         | NSSecondCalendarUnit)
                                               fromDate:self];
    return [components second];
}

// 获取天
- (NSInteger)day
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components:( NSYearCalendarUnit
                                                         | NSMonthCalendarUnit
                                                         | NSDayCalendarUnit
                                                         | NSHourCalendarUnit
                                                         | NSMinuteCalendarUnit
                                                         | NSSecondCalendarUnit)
                                               fromDate:self];
    return [components day];
}

// 获取月
- (NSInteger)month
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components:( NSYearCalendarUnit
                                                         | NSMonthCalendarUnit
                                                         | NSDayCalendarUnit
                                                         | NSHourCalendarUnit
                                                         | NSMinuteCalendarUnit
                                                         | NSSecondCalendarUnit)
                                               fromDate:self];
    return [components month];
}

// 获取年
- (NSInteger)year
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components:( NSYearCalendarUnit
                                                         | NSMonthCalendarUnit
                                                         | NSDayCalendarUnit
                                                         | NSHourCalendarUnit
                                                         | NSMinuteCalendarUnit
                                                         | NSSecondCalendarUnit)
                                               fromDate:self];
    return [components year];
}

+ (NSInteger)daysBetweenToToday:(NSDate *)date
{
    NSDate *today   = [NSDate dateWithMonth:[[NSDate date] month]
                                        day:[[NSDate date] day]];
    
    NSDate *fromday = [NSDate dateWithMonth:[date month]
                                        day:[date day]];
    
    NSUInteger unitFlags = NSDayCalendarUnit;
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *components = [gregorian components:unitFlags
                                                fromDate:today
                                                  toDate:fromday
                                                 options:0];
    NSInteger day = [components day];
    return day;
}

- (NSString *)dateString
{
    return [self dateStringWithDateFormat:@"yyyy-MM-dd HH:mm:ss"];
}

- (NSString *)dateStringWithDateFormat:(NSString *)dateFormat
{
    NSDateFormatter *format = [[NSDateFormatter alloc] init];
    [format setDateFormat:dateFormat];
    NSString *result = [format stringFromDate:self];
    return result;
}

+ (NSString *)todayDateString
{
    return [NSDate todayDateStringWithDateFormat:@"yyyy-MM-dd HH:mm:ss"];
}

+ (NSString *)tomorrowDateString
{
    return [NSDate tomorrowDateStringWithDateFormat:@"yyyy-MM-dd HH:mm:ss"];
}

+ (NSString *)todayDateStringWithDateFormat:(NSString *)dateFormat
{
    NSDate *today = [NSDate date];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:dateFormat];
    NSDateComponents *todayComponents = [calendar components:(  NSYearCalendarUnit
                                                              | NSMonthCalendarUnit
                                                              | NSDayCalendarUnit
                                                              | NSHourCalendarUnit
                                                              | NSMinuteCalendarUnit
                                                              | NSSecondCalendarUnit)
                                                    fromDate:today];
    [todayComponents setHour:0];
    [todayComponents setMinute:0];
    [todayComponents setSecond:0];
    NSDate   *morningStart = [calendar dateFromComponents:todayComponents];
    NSString *strTodayDate = [formatter stringFromDate:morningStart];
    return strTodayDate;
}

+ (NSString *)tomorrowDateStringWithDateFormat:(NSString *)dateFormat
{
    NSDate *tomorrow = [NSDate dateWithTimeInterval:(24*60*60) sinceDate:[NSDate date]];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:dateFormat];
    NSDateComponents *tomorrowComponents = [calendar components:(  NSYearCalendarUnit
                                                                 | NSMonthCalendarUnit
                                                                 | NSDayCalendarUnit
                                                                 | NSHourCalendarUnit
                                                                 | NSMinuteCalendarUnit
                                                                 | NSSecondCalendarUnit)
                                                       fromDate:tomorrow];
    [tomorrowComponents setHour:0];
    [tomorrowComponents setMinute:0];
    [tomorrowComponents setSecond:0];
    NSDate *morningStart = [calendar dateFromComponents:tomorrowComponents];
    NSString *strNextDate = [formatter stringFromDate:morningStart];
    return strNextDate;
}

+ (NSDate *)dateWithYear:(NSInteger)year
                   month:(NSInteger)month
                     day:(NSInteger)day
{
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    [comps setDay:day];
    [comps setMonth:month];
    [comps setYear:year];
    
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDate *date = [gregorian dateFromComponents:comps];
    return date;
}

+ (NSDate *)dateWithMonth:(NSInteger)month
                      day:(NSInteger)day
{
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    [comps setDay:day];
    [comps setMonth:month];
    
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDate *date = [gregorian dateFromComponents:comps];
    return date;
}

- (NSDate *)dateWithFormatYYYYMMDD
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDateComponents *components = [calendar components:(  NSYearCalendarUnit
                                                         | NSMonthCalendarUnit
                                                         | NSDayCalendarUnit
                                                         | NSHourCalendarUnit
                                                         | NSMinuteCalendarUnit
                                                         | NSSecondCalendarUnit)
                                               fromDate:self];
    [components setHour:0];
    [components setMinute:0];
    [components setSecond:0];
    NSDate *morningStart = [calendar dateFromComponents:components];
    return morningStart;
}

+ (NSDate *)dateWithString:(NSString *)dateString
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:0]];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSDate *dateFromString = [dateFormatter dateFromString:dateString];
    return dateFromString;
}

+ (NSDate *)dateWithFullString:(NSString *)dateString
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:0]];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *dateFromString = [dateFormatter dateFromString:dateString];
    return dateFromString;
}

+ (NSDate *)localTimeZomeDateWithDate:(NSDate *)otherDate
{
    NSString *dateString = [otherDate dateString];
    return [NSDate dateWithString:dateString];
}

- (NSComparisonResult)compareWithoutTime:(NSDate *)other
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSInteger comps = (NSDayCalendarUnit | NSMonthCalendarUnit | NSYearCalendarUnit);
    
    NSDateComponents *date1Components = [calendar components:comps
                                                    fromDate:self];
    NSDateComponents *date2Components = [calendar components:comps
                                                    fromDate:other];
    NSDate *date1 = [calendar dateFromComponents:date1Components];
    NSDate *date2 = [calendar dateFromComponents:date2Components];
    
    NSComparisonResult result = [date1 compare:date2];
    return result;
}

- (NSComparisonResult)compareWithMonthAndDay:(NSDate *)other
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSInteger components = (NSDayCalendarUnit | NSMonthCalendarUnit);
    
    NSDateComponents *firstComponents  = [calendar components:components fromDate:self];
    NSDateComponents *secondComponents = [calendar components:components fromDate:other];
    
    NSDate *date1 = [calendar dateFromComponents:firstComponents];
    NSDate *date2 = [calendar dateFromComponents:secondComponents];
    
    NSComparisonResult result = [date1 compare:date2];
    return result;
}

- (NSComparisonResult)compareWithYearAndMonthAndDay:(NSDate *)other
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSInteger components = (NSDayCalendarUnit | NSMonthCalendarUnit | NSYearCalendarUnit);
    
    NSDateComponents *firstComponents  = [calendar components:components fromDate:self];
    NSDateComponents *secondComponents = [calendar components:components fromDate:other];
    
    NSDate *date1 = [calendar dateFromComponents:firstComponents];
    NSDate *date2 = [calendar dateFromComponents:secondComponents];
    
    NSComparisonResult result = [date1 compare:date2];
    return result;
}

- (NSComparisonResult)compareWithFull:(NSDate *)other{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSInteger components = (NSDayCalendarUnit | NSMonthCalendarUnit | NSYearCalendarUnit |NSHourCalendarUnit | NSMinuteCalendarUnit|NSSecondCalendarUnit);
    
    NSDateComponents *firstComponents  = [calendar components:components fromDate:self];
    NSDateComponents *secondComponents = [calendar components:components fromDate:other];
    
    NSDate *date1 = [calendar dateFromComponents:firstComponents];
    NSDate *date2 = [calendar dateFromComponents:secondComponents];
    
    NSComparisonResult result = [date1 compare:date2];
    return result;
}

+ (NSString *)timeSecondDiffBeginTime:(NSDate *)aBeginTime endTime:(NSDate *)aEndTime RemainReductionsecond:(NSInteger)second{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    
    // 取两个日期对象的时间间隔：
    // 这里的NSTimeInterval 并不是对象，是基本型，其实是double类型，是由c定义的:typedef double NSTimeInterval;
    NSTimeInterval time= [aEndTime timeIntervalSinceDate:aBeginTime];
    time = time - second;
    if (time <= 0) {
        return @"-1";
    }
    NSInteger days   = ((NSInteger)time)/(3600*24);
    NSInteger hours  = ((NSInteger)time)%(3600*24)/3600;
    NSInteger minute = (((NSInteger)time)%3600)/60;
    NSInteger second1 = (((NSInteger)time)%60);
    if (days < 0) {
        days *= -1;
    }
    
    if (hours < 0) {
        hours *= -1;
    }
    
    if (minute < 0) {
        minute *= -1;
    }
    
    if (second1 < 0) {
        second1 *= -1;
    }
    NSString *dateContent = [NSString stringWithFormat:@"%ld天 %02ld:%02ld:%02ld",days,hours,minute,second1];
    return dateContent;
}

+ (NSString *)timeDiffBeginTime:(NSDate *)aBeginTime endTime:(NSDate *)aEndTime
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm"];
    
    // 取两个日期对象的时间间隔：
    // 这里的NSTimeInterval 并不是对象，是基本型，其实是double类型，是由c定义的:typedef double NSTimeInterval;
    NSTimeInterval time= [aEndTime timeIntervalSinceDate:aBeginTime];
    NSInteger days=((NSInteger)time)/(3600*24);
    NSInteger hours=((NSInteger)time)%(3600*24)/3600;
    
    if (days < 0) {
        days *= -1;
    }
    
    if (hours < 0) {
        hours *= -1;
    }
    
    NSString *dateContent = [NSString stringWithFormat:@"%i天%i小时",days,hours];
    return dateContent;
}


#pragma mark - 关于周数据的计算
- (BOOL)isWeekend
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSRange weekdayRange = [calendar maximumRangeOfUnit:NSWeekdayCalendarUnit];
    NSDateComponents *components = [calendar components:NSWeekdayCalendarUnit fromDate:self];
    NSUInteger weekdayOfDate = [components weekday];
    
    if (weekdayOfDate == weekdayRange.location || weekdayOfDate == weekdayRange.length) {
        // the date falls somewhere on the first or last days of the week
        return YES;
    } else {
        return NO;
    }
}

+ (BOOL)isWeekendNow
{
    NSDate *aDate = [NSDate date];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSRange weekdayRange = [calendar maximumRangeOfUnit:NSWeekdayCalendarUnit];
    NSDateComponents *components = [calendar components:NSWeekdayCalendarUnit fromDate:aDate];
    NSUInteger weekdayOfDate = [components weekday];
    
    if (weekdayOfDate == weekdayRange.location || weekdayOfDate == weekdayRange.length) {
        // the date falls somewhere on the first or last days of the week
        return YES;
    } else {
        return NO;
    }
}

+ (NSDate *)firstDayOfWeekFromDate:(NSDate *)date
{
    CFCalendarRef currentCalendar = CFCalendarCopyCurrent();
    NSDateComponents *components = [CURRENT_CALENDAR components:DATE_COMPONENTS
                                                       fromDate:date];
    [components setDay:([components day] -
                        ([components weekday] - CFCalendarGetFirstWeekday(currentCalendar))+1)];
    [components setHour:0];
    [components setMinute:0];
    [components setSecond:0];
    CFRelease(currentCalendar);
    return [CURRENT_CALENDAR dateFromComponents:components];
}

- (NSDate *)nextWeekFromDate:(NSDate *)date
{
    CFCalendarRef currentCalendar = CFCalendarCopyCurrent();
    NSDateComponents *components = [CURRENT_CALENDAR components:DATE_COMPONENTS
                                                       fromDate:date];
    [components setDay:([components day] -
                        ([components weekday] - CFCalendarGetFirstWeekday(currentCalendar) - 7))];
    [components setHour:0];
    [components setMinute:0];
    [components setSecond:0];
    CFRelease(currentCalendar);
    return [CURRENT_CALENDAR dateFromComponents:components];
}

- (NSDate *)previousWeekFromDate:(NSDate *)date
{
    CFCalendarRef currentCalendar = CFCalendarCopyCurrent();
    NSDateComponents *components = [CURRENT_CALENDAR components:DATE_COMPONENTS
                                                       fromDate:date];
    [components setDay:([components day]
                        - ([components weekday] - CFCalendarGetFirstWeekday(currentCalendar) + 7))];
    [components setHour:0];
    [components setMinute:0];
    [components setSecond:0];
    CFRelease(currentCalendar);
    return [CURRENT_CALENDAR dateFromComponents:components];
}

@end
