//
//  NSDictionary+CJDictionary.m
//  CJUtilWork
//
//  Created by 陈敬 on 2018/1/8.
//  Copyright © 2018年 陈敬. All rights reserved.
//

#import "NSDictionary+CJDictionary.h"

@implementation NSDictionary (CJDictionary)

- (id)safeObjectForKey:(NSString *)key {
    if (key == nil || [self isKindOfClass:[NSNull class]]) {
        return nil;
    }
    id object = [self objectForKey:key];
    if (object==nil || object == [NSNull null]) {
        return @"";
    }
    return object;
}


- (void)safeSetObject:(id)object forKey:(id)key {
    if ([key isKindOfClass:[NSNull class]]) {
        return;
    }
    if ([object isKindOfClass:[NSNull class]]) {
        [self setValue:@"" forKey:key];
    }else{
        [self setValue:object forKey:key];
    }
}

- (id)objectForKeyCustom:(id)aKey {
    id object   = nil;
    
    // 检查是否字典对象
    if (![self isKindOfClass:[NSDictionary class]]) {
        return object;
    }
    
    // 保证key必须为字符串
    if (aKey && [aKey isKindOfClass:[NSString class]]) {
        object  = [self objectForKeyCustom:aKey];
    }
    
    return object;
}

- (id)safeKeyForValue:(id)value {
    for (id key in self.allKeys) {
        if ([value isEqual:[self objectForKey:key]]) {
            return key;
        }
    }
    return nil;
}

- (NSString *)toJSONStringForDictionary
{
    NSData *paramsJSONData = [NSJSONSerialization dataWithJSONObject:self options:0 error:nil];
    return [[NSString alloc] initWithData:paramsJSONData encoding:NSUTF8StringEncoding];
}

@end


@implementation NSMutableDictionary (CJMutableDictionary)

- (void)safeSetObject:(id)obj forKeyedSubscript:(id<NSCopying>)key
{
    if (!key) {
        return ;
    }
    
    if (!obj) {
        [self removeObjectForKey:key];
    }
    else {
        [self setObject:obj forKey:key];
    }
}

- (void)safeSetObject:(id)aObj forKey:(id<NSCopying>)aKey
{
    if (aObj && ![aObj isKindOfClass:[NSNull class]] && aKey) {
        [self setObject:aObj forKey:aKey];
    } else {
        return;
    }
}

- (id)safeObjectForKey:(id<NSCopying>)aKey
{
    if (aKey != nil) {
        return [self objectForKey:aKey];
    } else {
        return nil;
    }
}

@end
