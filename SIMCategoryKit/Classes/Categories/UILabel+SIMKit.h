//
//  UILabel+SIMKit.h
//  SAMIM
//
//  Created by 121 on 2019/2/13.
//  Copyright © 2019年 有慧科技. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UILabel (SIMKit)
+ (UILabel*)multLinesText:(NSString*)text font:(UIFont*)font wid:(CGFloat)wid;

+ (UILabel*)multLinesText:(NSString*)text font:(UIFont*)font wid:(CGFloat)wid color:(UIColor*)color;

+ (UILabel*)linesText:(NSString*)text font:(UIFont*)font wid:(CGFloat)wid lines:(int)lines;

+ (UILabel*)linesText:(NSString*)text font:(UIFont*)font wid:(CGFloat)wid lines:(int)lines color:(UIColor*)color;
@end

NS_ASSUME_NONNULL_END
