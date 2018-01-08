//
//  NSArray+CJArray.h
//  CJUtilWork
//
//  Created by 陈敬 on 2018/1/8.
//  Copyright © 2018年 陈敬. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (CJArray)

//建议每次对Array操作时都用以下方法，提高健壮性
+ (instancetype)safeArrayWithObject:(id)object;

- (id)safeObjectAtIndex:(NSUInteger)index;

- (NSArray *)safeSubarrayWithRange:(NSRange)range;

- (NSUInteger)safeIndexOfObject:(id)anObject;


// 数组转成json 字符串
- (NSString *)toJSONStringForArray;

@end



@interface NSMutableArray (CJMutableArray)

//建议每次对Array操作时都用以下方法，提高健壮性
- (void)safeAddObject:(id)object;

- (void)safeInsertObject:(id)object atIndex:(NSUInteger)index;

- (void)safeInsertObjects:(NSArray *)objects atIndexes:(NSIndexSet *)indexs;

- (void)safeRemoveObjectAtIndex:(NSUInteger)index;

- (void)safeRemoveObjectsInRange:(NSRange)range;

@end
