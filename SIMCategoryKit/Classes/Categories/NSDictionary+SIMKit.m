//
//  NSDictionary+SIMKit.m
//  SAMIM
//
//  Created by 121 on 2019/2/13.
//  Copyright © 2019年 有慧科技. All rights reserved.
//

#import "NSDictionary+SIMKit.h"

NSString * const kEmptyString = @"";

@implementation NSDictionary (SIMKit)
// magus: return nil if the object is NSNull or not a NSNumber
- (NSNumber *)numberForKey:(id)key
{
    NSNumber *result = [self objectForKey:key];
    if([result isKindOfClass:[NSNumber class]])
    {
        return result;
    }
    else
    {
        return nil;
    }
}

// magus: return an empty string if the value is null or not a string.
- (NSString *)stringForKey:(id)key
{
    NSString *result = [self objectForKey:key];
    if([result isKindOfClass:[NSString class]])
    {
        return result;
    }
    if ([result isKindOfClass:[NSNumber class]]) {
        return [NSString stringWithFormat:@"%@",result];
    }
    else {
        return kEmptyString;
    }
}

// magus: return nil if the object is null or not a NSDictionary.
- (NSDictionary *)dictionaryForKey:(id)key
{
    NSDictionary *result = [self objectForKey:key];
    if([result isKindOfClass:[NSDictionary class]])
    {
        return result;
    }
    else {
        return nil;
    }
}

// magus: return nil if the object is null or not a NSArray.
- (NSMutableArray *)arrayForKey:(id)key
{
    NSMutableArray *result = [self objectForKey:key];
    if([result isKindOfClass:[NSArray class]])
    {
        return result;
    }
    else {
        
        return nil;
    }
}

- (NSData *)dataForKey:(id)key
{
    NSData *result = [self objectForKey:key];
    if([result isKindOfClass:[NSData class]])
    {
        return result;
    }
    else {
        
        return nil;
    }
}
@end
