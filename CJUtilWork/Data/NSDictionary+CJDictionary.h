//
//  NSDictionary+CJDictionary.h
//  CJUtilWork
//
//  Created by 陈敬 on 2018/1/8.
//  Copyright © 2018年 陈敬. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (CJDictionary)

//用于数据解析，返回对象为字符串或值类型，数组和字典不要用此方法
- (id)safeObjectForKey:(NSString *)key;

//设置键值对 针对对象为空处理
- (void)safeSetObject:(id)object forKey:(id)key;
- (id)objectForKeyCustom:(id)aKey;

- (id)safeKeyForValue:(id)value;

/**
 *  字段转成json的字符串
 *
 *  @return json 字符串
 */
- (NSString *)toJSONStringForDictionary;

@end



@interface NSMutableDictionary (CJMutableDictionary)

//建议每次对Array操作时都用以下方法，提高健壮性
- (void)safeSetObject:(id)aObj forKey:(id<NSCopying>)aKey;

- (id)safeObjectForKey:(id<NSCopying>)aKey;

@end
