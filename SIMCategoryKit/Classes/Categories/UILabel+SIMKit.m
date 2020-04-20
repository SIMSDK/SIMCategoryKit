//
//  UILabel+SIMKit.m
//  SAMIM
//
//  Created by 121 on 2019/2/13.
//  Copyright © 2019年 有慧科技. All rights reserved.
//

#import "UILabel+SIMKit.h"

@implementation UILabel (SIMKit)
+ (UILabel*)multLinesText:(NSString*)text font:(UIFont*)font wid:(CGFloat)wid {
    return [UILabel multLinesText:text font:font wid:wid color:[UIColor blackColor]];
}
+ (UILabel*)multLinesText:(NSString*)text font:(UIFont*)font wid:(CGFloat)wid color:(UIColor*)color {
    return [UILabel linesText:text font:font wid:wid lines:0 color:color];
}

+ (UILabel*)linesText:(NSString*)text font:(UIFont*)font wid:(CGFloat)wid lines:(int)lines {
    return [UILabel linesText:text font:font wid:wid lines:lines color:[UIColor blackColor]];
}
+ (UILabel*)linesText:(NSString*)text font:(UIFont*)font wid:(CGFloat)wid lines:(int)lines color:(UIColor*)color {
    CGFloat maxH = 0;
    if (lines > 0) {
        maxH = (font.pointSize + 2) * lines + 3;
    } else {
        maxH = 6000;
    }
    CGSize size = CGSizeMake(wid, maxH);
    size = [text sizeWithFont:font constrainedToSize:size lineBreakMode:NSLineBreakByCharWrapping];
    UILabel * lab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, size.width, size.height)];
    lab.numberOfLines = lines;
    lab.textAlignment = NSTextAlignmentCenter;
    lab.backgroundColor = [UIColor clearColor];
    lab.lineBreakMode = NSLineBreakByTruncatingTail;
    lab.textColor = color;
    lab.font = font;
    lab.text = text;
    lab.highlightedTextColor = [UIColor whiteColor];
    return lab;
}

@end
