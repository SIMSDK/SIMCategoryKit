//
//  UIView+SIMKit.m
//  SAMIM
//
//  Created by 121 on 2019/2/13.
//  Copyright © 2019年 有慧科技. All rights reserved.
//

#import "UIView+SIMKit.h"

@implementation UIView (SIMKit)

- (CGFloat)x
{
    return self.frame.origin.x;
}

- (CGFloat)y
{
    return self.frame.origin.y;
}

- (CGFloat)width
{
    return self.frame.size.width;
}

- (CGFloat)height
{
    return self.frame.size.height;
}

- (CGFloat)centerX
{
    return self.center.x;
}

- (CGFloat)centerY
{
    return self.center.y;
}

- (CGSize)size
{
    return self.frame.size;
}

- (CGPoint)origin
{
    return self.frame.origin;
}

- (CGFloat)left {
    return self.frame.origin.x;
}

- (CGFloat)top {
    return self.frame.origin.y;
}

- (CGFloat)right {
    return self.frame.origin.x + self.frame.size.width;
}

- (CGFloat)bottom {
    return self.frame.origin.y + self.frame.size.height;
}

- (void)setX:(CGFloat)x
{
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (void)setY:(CGFloat)y
{
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (void)setWidth:(CGFloat)width
{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (void)setHeight:(CGFloat)height
{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (void)setCenterX:(CGFloat)centerX
{
    CGPoint center = self.center;
    center.x = centerX;
    self.center = center;
}

- (void)setCenterY:(CGFloat)centerY
{
    CGPoint center = self.center;
    center.y = centerY;
    self.center = center;
}

- (void)setSize:(CGSize)size
{
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

- (void)setOrigin:(CGPoint)origin {
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}

- (void)setLeft:(CGFloat)x {
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (void)setTop:(CGFloat)y {
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (void)setRight:(CGFloat)right {
    CGRect frame = self.frame;
    frame.origin.x = right - frame.size.width;
    self.frame = frame;
}

- (void)setBottom:(CGFloat)bottom {
    CGRect frame = self.frame;
    frame.origin.y = bottom - frame.size.height;
    self.frame = frame;
}

/**
 * 设置UIView四角的圆角化
 * 返回一个UIView
 */
- (id)roundCornersOnTopLeft:(BOOL)tl topRight:(BOOL)tr bottomLeft:(BOOL)bl bottomRight:(BOOL)br radius:(float)radius {
    self.clipsToBounds = YES;
    if (tl || tr || bl || br) {
        UIRectCorner corner = 0; //holds the corner
        //Determine which corner(s) should be changed
        if (tl) {
            corner = UIRectCornerTopLeft;
        }
        if (tr) {
            UIRectCorner add = corner | UIRectCornerTopRight;
            corner = add;
        }
        if (bl) {
            UIRectCorner add = corner | UIRectCornerBottomLeft;
            corner = add;
        }
        if (br) {
            UIRectCorner add = corner | UIRectCornerBottomRight;
            corner = add;
        }
        
        UIView *roundedView = self;
        UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:roundedView.bounds byRoundingCorners:corner cornerRadii:CGSizeMake(radius, radius)];
        CAShapeLayer *maskLayer = [CAShapeLayer layer];
        maskLayer.frame = roundedView.bounds;
        maskLayer.path = maskPath.CGPath;
        roundedView.layer.mask = maskLayer;
        return roundedView;
    } else {
        return self;
    }
}

/**
 *  控件修圆
 *
 *  @param angle 修圆的弧度数
 */
- (void)radiusWithAngle:(CGFloat)angle
{
    if (@available(iOS 11.0, *)) {
        self.layer.cornerRadius = angle;
        self.layer.maskedCorners = kCALayerMinXMinYCorner | kCALayerMaxXMinYCorner | kCALayerMinXMaxYCorner | kCALayerMaxXMaxYCorner ; // 左上圆角
        self.layer.masksToBounds = YES;
    }
    else {
        self.layer.cornerRadius = angle;
        self.layer.masksToBounds = YES;
    }
}
@end
