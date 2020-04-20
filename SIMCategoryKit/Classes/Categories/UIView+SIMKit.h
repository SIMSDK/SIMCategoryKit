//
//  UIView+SIMKit.h
//  SAMIM
//
//  Created by 121 on 2019/2/13.
//  Copyright © 2019年 有慧科技. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (SIMKit)

@property (nonatomic , assign) CGFloat x;
@property (nonatomic , assign) CGFloat y;
@property (nonatomic , assign) CGFloat width;
@property (nonatomic , assign) CGFloat height;
@property (nonatomic , assign) CGFloat centerX;
@property (nonatomic , assign) CGFloat centerY;
@property (nonatomic , assign) CGSize size;
@property (nonatomic , assign) CGPoint origin;
@property (nonatomic , assign) CGFloat left;
@property (nonatomic , assign) CGFloat right;
@property (nonatomic , assign) CGFloat top;
@property (nonatomic , assign) CGFloat bottom;

/**
 * 设置UIView四角的圆角化
 * 返回一个UIView
 */
- (id)roundCornersOnTopLeft:(BOOL)tl topRight:(BOOL)tr bottomLeft:(BOOL)bl bottomRight:(BOOL)br radius:(float)radius;

/**
 *  控件修圆
 *
 *  @param angle 修圆的弧度数
 */
- (void)radiusWithAngle:(CGFloat)angle;
@end

NS_ASSUME_NONNULL_END
