//
//  NSDictionary+SIMKit.h
//  SAMIM
//
//  Created by 121 on 2019/2/13.
//  Copyright © 2019年 有慧科技. All rights reserved.
//

#import <Foundation/Foundation.h>
NS_ASSUME_NONNULL_BEGIN

extern NSString * const kEmptyString;


@interface NSDictionary (SIMKit)

// magus: return nil if the object is NSNull or not a NSNumber
- (NSNumber *)numberForKey:(id)key;

- (NSString *)stringForKey:(id)key;

// magus: return nil if the object is NSNull or not a NSDictionary
- (NSDictionary *)dictionaryForKey:(id)key;

// magus: return nil if the object is null or not a NSArray.
- (NSMutableArray *)arrayForKey:(id)key;

- (NSData *)dataForKey:(id)key;

@end

NS_ASSUME_NONNULL_END
