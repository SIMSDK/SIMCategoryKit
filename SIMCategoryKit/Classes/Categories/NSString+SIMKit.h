//
//  NSString+SIMKit.h
//  SAMIM
//
//  Created by ZIKong on 2018/11/16.
//  Copyright © 2018 有慧科技. All rights reserved.
//



NS_ASSUME_NONNULL_BEGIN

@interface NSString (SIMKit)
/**
 *  判断字符串是否为空
 *  @param str 字符串
 *  @return bool值
 */
+ (BOOL)isBlankWithStr:(NSString *)str;

/**
 *  生成UUID
 *  @return NSString值
 */
+ (NSString *)createUUID;

/**
 *  获取用户id
 *  @return NSString值
 */
+ (NSString *)acquireUserId;

/**
 *  根据 图片名  返回 想要的url
 *  @return NSURL
 */
+ (NSURL *)returnImageUrlWithImageName:(NSString *)imageName;

/**
 *  判空字符串如果为空返回@""
 *  @return NSString
 */
+(NSString *)nullString:(NSString *)string;

/**
 *  验证手机号是否合法
 *  @param phoneNumber_str 手机号
 *  @return BOOL 合法YES 非法NO
 */

+ (BOOL)verificationIsValidWithPhoneNumberStr:(NSString *)phoneNumber_str;

/**
 *  计算文字size
 *  @param font 字体大小 maxWidth宽度最大值 maxNumberLines文字行数
 *  @return CGSize
 */
- (CGSize)stringSizeWithFont:(UIFont *)font;
- (CGSize)returnStrSizeWithFont:(UIFont *)font maxSize:(CGSize)maxSize;
- (CGSize)sizeWithFont:(UIFont *)font maxWidth:(CGFloat)width maxNumberLines:(int)num;


/**
 *  md5 加密
 *  @return md5加密串
 */
- (NSString *)md5;

/**
 *  根据 毫秒数 返回 时间字符串
 *  @param time 时间（毫秒数）
 *  @return 时间字符串
 */
+ (NSString *)returnDateStrWithTime:(NSTimeInterval)time;

/**
 *  根据 时间戳显示刚刚 一小时前  一天前
 *  @param timeStamp 时间（毫秒数）
 *  @return 时间字符串
 */
+ (NSString *)stringWithTimeStamp:(NSNumber *)timeStamp;

/**
 * 通过图片Data数据第一个字节 来获取图片扩展名
 * @param data 图片Data
 * @return 图片扩展名
 */
+ (NSString *)contentTypeForImageData:(NSData *)data;
@end

NS_ASSUME_NONNULL_END
