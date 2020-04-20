//
//  UIButton+SIMKit.m
//  SAMIM
//
//  Created by 121 on 2019/2/13.
//  Copyright © 2019年 有慧科技. All rights reserved.
//

#import "UIButton+SIMKit.h"

@implementation UIButton (SIMKit)
/**
 *  设置按钮
 *
 *  @param normalImageNameStr 正常状态下按钮图片名
 *  @param selectImageNameStr 选中状态下按钮图片名
 *  @param normalTitleColor   正常状态下按钮文字颜色
 *  @param selectTitleColor   选中状态下按钮文字颜色
 *  @param selected           按钮是否处于选中状态
 */
- (void)setButtonWithNormalImageNameStr:(NSString *)normalImageNameStr
                     selectImageNameStr:(NSString *)selectImageNameStr
                       normalTitleColor:(UIColor *)normalTitleColor
                       selectTitleColor:(UIColor *)selectTitleColor
                               selected:(BOOL)selected
{
    [self setImage:[[UIImage imageNamed:normalImageNameStr] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
    [self setImage:[[UIImage imageNamed:selectImageNameStr] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateSelected];
    [self setTitleColor:normalTitleColor forState:UIControlStateNormal];
    [self setTitleColor:selectTitleColor forState:UIControlStateSelected];
    self.imageEdgeInsets = UIEdgeInsetsMake(0, -4, 0, 4);
    self.titleEdgeInsets = UIEdgeInsetsMake(0, 4, 0, -4);
    self.selected = selected;
}

/**
 *  创建按钮 作为 textField 的 rightView
 *
 *  @param height             按钮的高度
 *  @param normalImageNameStr 正常状态下按钮图片名
 *
 *  @return UIButton
 */
+ (UIButton *)createTextFieldRightViewWithHeight:(CGFloat)height
                              normalImageNameStr:(NSString *)normalImageNameStr
{
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, height * 0.9, height);
    [button setImage:[[UIImage imageNamed:normalImageNameStr] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
    return button;
}

/**
 *  创建一个按钮
 *
 *  @param normalImageName      默认图片名
 *  @param highlightedImageName 高亮时 图片名
 *  @param selectedImageName    选中图片名
 *
 *  @return UIButton
 */
+ (UIButton *)createButtonWithNormalImageName:(NSString *)normalImageName
                         highlightedImageName:(NSString *)highlightedImageName
                            selectedImageName:(NSString *)selectedImageName
{
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:[[UIImage imageNamed:normalImageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
    [button setImage:[[UIImage imageNamed:highlightedImageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateHighlighted];
    [button setImage:[[UIImage imageNamed:selectedImageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateSelected];
    return button;
}

@end
