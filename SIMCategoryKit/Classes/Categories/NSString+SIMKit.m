//
//  NSString+SIMKit.m
//  SAMIM
//
//  Created by ZIKong on 2018/11/16.
//  Copyright © 2018 有慧科技. All rights reserved.
//

#import "NSString+SIMKit.h"
#import <Photos/Photos.h>
#import <CommonCrypto/CommonDigest.h>

//16位加密
#define BitNum 16

@implementation NSString (SIMKit)

/**
 *  判断字符串是否为空
 *  @param str 字符串
 *  @return bool值
 */
+ (BOOL)isBlankWithStr:(NSString *)str
{
    if (str == nil || str == NULL)
    {
        return YES;
    }
    if ([str isKindOfClass:[NSNull class]])
    {
        return YES;
    }
    if ([[str stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length] == 0)
    {
        return YES;
    }
    return NO;
}


/**
 *  生成UUID
 *  @return NSString值
 */
+ (NSString *)createUUID
{
    CFUUIDRef uuid_ref = CFUUIDCreate(NULL);
    CFStringRef uuid_string_ref = CFUUIDCreateString(NULL, uuid_ref);
    CFRelease(uuid_ref);
    NSString * uuid = (__bridge NSString *)uuid_string_ref;
    CFRelease(uuid_string_ref);
    return uuid;
}

/**
 *  获取用户id
 *  @return NSString值
 */
+ (NSString *)acquireUserId
{
    //获取当前用户id
    NSDictionary * userInfoDict = [[NSUserDefaults standardUserDefaults] objectForKey:@"userInfo"];
    NSString * userId = userInfoDict[@"id"];
    return userId;
}

/**
 *  根据 图片名  返回 想要的url
 *  @return NSURL
 */
+ (NSURL *)returnImageUrlWithImageName:(NSString *)imageName
{
    if ([NSString isBlankWithStr:imageName]) {
        return [NSURL new];
    }
    NSString * imageNameStr = @"";
    BOOL isExist;
    if ([imageName hasPrefix:@"http:"] || [imageName hasPrefix:@"https:"]) {
        isExist = YES;
    }
    else
    {
        isExist = NO;
    }
    //    BOOL isExist = [imageName hasPrefix:@"http:"];
    if (isExist)
    {
        imageNameStr = imageName;
    }
    else
    {
//        @try
//        {
//            imageNameStr = [SIMHostUrlStr stringByAppendingString:imageName];
//        }
//        @catch(NSException *exception) {
//            
//        }
    }
    return [NSURL URLWithString:imageNameStr];
}

/**
 *  判空字符串如果为空返回@""
 *  @return NSString
 */
+(NSString *)nullString:(NSString *)string
{
    if (string.length == 0 || [string isEqualToString:@"(null)"] || string == nil ) {
        return @"0";
    }
    else
    {
        return string;
    }
}


/**
 *  验证手机号是否合法
 *  @param phoneNumber_str 手机号
 *  @return BOOL 合法YES 非法NO
 */

+ (BOOL)verificationIsValidWithPhoneNumberStr:(NSString *)phoneNumber_str
{
    NSString * regularExpression = @"^(((13[0-9]{1})|(15[0-9]{1})|(17[0-9]{1})|(18[0-9]{1})|(19[0-9]{1})|(14[0-9]{1}))+\\d{8})$";
    NSPredicate * predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@" , regularExpression];
    return [predicate evaluateWithObject:phoneNumber_str];
}

/**
 *  计算文字size
 *  @param font 字体大小 maxWidth宽度最大值 maxNumberLines文字行数
 *  @return CGSize
 */
- (CGSize)stringSizeWithFont:(UIFont *)font
{
    return [self sizeWithAttributes:@{NSFontAttributeName:font}];
}

- (CGSize)returnStrSizeWithFont:(UIFont *)font maxSize:(CGSize)maxSize
{
    return [self boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : font} context:nil].size;
}

- (CGSize)sizeWithFont:(UIFont *)font maxWidth:(CGFloat)width maxNumberLines:(int)num
{
    CGSize size = CGSizeZero;
    if (num > 0) {
        CGFloat tmpHeight = ceilf(font.lineHeight * num);
        size = [self sizeWithFont:font constrainedToSize:CGSizeMake(width, tmpHeight) lineBreakMode:NSLineBreakByTruncatingTail];
    } else if (num == 0) {
        size = [self sizeWithFont:font maxWidth:width maxNumberLines:-10];
    } else if (num < 0) {
        num = num*-1;
        int i = 1;
        CGFloat h1, h2;
        do {
            size = [self sizeWithFont:font maxWidth:width maxNumberLines:num*i];
            h1 = size.height;
            h2 = ceilf(font.lineHeight*num*i++);
        } while (h1 >= h2);
    }
    size.width = ceilf(size.width);
    size.height = ceilf(size.height);
    return size;
}

/**
 *  md5 加密
 *  @return md5加密串
 */
- (NSString *)md5
{
    const char * cStr = [self UTF8String];
    unsigned char result[BitNum];
    CC_MD5(cStr, (CC_LONG)strlen(cStr), result);
    NSMutableString * mStr = [NSMutableString stringWithCapacity:BitNum];
    for (NSInteger i = 0; i < BitNum; i++)
    {
        [mStr appendFormat:@"%02X" , result[i]];
    }
    return mStr.lowercaseString;
}

/**
 *  根据 毫秒数 返回 时间字符串
 *
 *  @param time 时间（毫秒数）
 *
 *  @return 时间字符串
 */
+ (NSString *)returnDateStrWithTime:(NSTimeInterval)time
{
    NSDate * date = [NSDate dateWithTimeIntervalSince1970:time / 1000];
    NSCalendarUnit unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitWeekOfYear | NSCalendarUnitWeekdayOrdinal | NSCalendarUnitWeekday | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute;
    NSCalendar * calendar = [NSCalendar currentCalendar];
    NSDateComponents * messageDateComponents = [calendar components:unitFlags fromDate:date];
    NSDateComponents * todayDateComponents = [calendar components:unitFlags fromDate:[NSDate date]];
    
    NSUInteger dayOfYearForMessage = [calendar ordinalityOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitYear forDate:date];
    NSUInteger dayOfYearForToday = [calendar ordinalityOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitYear forDate:[NSDate date]];
    
    NSString * dateStr = @"";
    if (messageDateComponents.year == todayDateComponents.year && messageDateComponents.month == todayDateComponents.month && messageDateComponents.day == todayDateComponents.day)
    {
        dateStr = [NSString stringWithFormat:@"%02zi:%02zi" , messageDateComponents.hour , messageDateComponents.minute];
    }
    else if (messageDateComponents.year == todayDateComponents.year && dayOfYearForMessage == (dayOfYearForToday - 1))
    {
        dateStr = [NSString stringWithFormat:@"%@ %02zi:%02zi" ,@"昨天", messageDateComponents.hour , messageDateComponents.minute];
    }
    else
    {
        NSDateFormatter * dateFormatter = [[NSDateFormatter alloc] init];
        dateFormatter.timeZone = [NSTimeZone localTimeZone];
        dateFormatter.dateFormat = @"YYYY-MM-dd";
        dateStr = [dateFormatter stringFromDate:date];
    }
    return dateStr;
}

/**
 *  根据 时间戳显示刚刚 一小时前  一天前
 *  @param timeStamp 时间（毫秒数）
 *  @return 时间字符串
 */
+ (NSString *)stringWithTimeStamp:(NSNumber *)timeStamp {
    //获取当前时间
    NSDate *currentDate = [NSDate date];
    //将当前时间转化为时间戳
    NSTimeInterval currentDateStamp = [currentDate timeIntervalSince1970] + 8 * 3600;
    //将传入的参数转化为时间戳
    double dateStamp = [timeStamp doubleValue]/1000 + 8 * 3600;
    //计算时间间隔，即当前时间减去传入的时间
    double interval = currentDateStamp - dateStamp;
    //获取当前时间的小时单位（24小时制）
    NSDateFormatter *formatter = [NSDateFormatter new];
    [formatter setDateFormat:@"H"];
    int nowHour = [[formatter stringFromDate:currentDate] intValue];
    //获取当前时间的分钟单位
    NSDateFormatter *minFormatter = [NSDateFormatter new];
    [minFormatter setDateFormat:@"m"];
    int nowMinute = [[minFormatter stringFromDate:currentDate] intValue];
    //今天0点的时间戳
    double todayZeroClock = currentDateStamp - 3600 * nowHour - 60 * nowMinute;
    //时间格式化，为输出做准备
    NSDateFormatter *outputFormat = [NSDateFormatter new];
    [outputFormat setDateFormat:@"M月d日"];
    //进行条件判断，满足不同的条件返回不同的结果
    if (interval < 1 * 60) {
        //在30分钟之内
        return @"刚刚";
    }
    else if (todayZeroClock - dateStamp > 24 * 3600) {
        //已经超过两天以上
        return [outputFormat stringFromDate:[NSDate dateWithTimeIntervalSince1970:dateStamp - 8*3600]];
    } else if (todayZeroClock - dateStamp > 0) {
        //已经超过一天（昨天）
        return @"昨天";
    } else if (interval < 3600) {
        //一个小时之内
        return [NSString stringWithFormat:@"%.0f%@", (currentDateStamp - dateStamp) / 60,@"分钟前"];
    } else {
        //今天之内
        return [NSString stringWithFormat:@"%.0f%@", (currentDateStamp - dateStamp) / 3600,@"小时前"];
    }
}

/**
 * 通过图片Data数据第一个字节 来获取图片扩展名
 * @param data 图片Data
 * @return 图片扩展名
 */
+ (NSString *)contentTypeForImageData:(NSData *)data {
    uint8_t c;
    [data getBytes:&c length:1];
    switch (c) {
        case 0xFF:
            return @"jpeg";
        case 0x89:
            return @"png";
        case 0x47:
            return @"gif";
        case 0x49:
        case 0x4D:
            return @"tiff";
        case 0x52:
            if ([data length] < 12) {
                return nil;
            }
            NSString *testString = [[NSString alloc] initWithData:[data subdataWithRange:NSMakeRange(0, 12)] encoding:NSASCIIStringEncoding];
            if ([testString hasPrefix:@"RIFF"] && [testString hasSuffix:@"WEBP"]) {
                return @"webp";
            }
            return nil;
    }
    return nil;
}
@end
