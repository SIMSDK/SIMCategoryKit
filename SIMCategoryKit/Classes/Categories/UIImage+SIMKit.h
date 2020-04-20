//
//  UIImage+SIMKit.h
//  SAMIM
//
//  Created by ZIKong on 2018/11/16.
//  Copyright © 2018 有慧科技. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (SIMKit)
/**
 *  处理图片尺寸
 */
- (UIImage *)sim_imageForChatUpload;
- (UIImage *)sim_imageForChatThumbnailUpload;//缩略图

/**
 *  处理图片旋转
 */
- (UIImage *)sim_fixOrientation;

/**
 *  根据图片名 返回一张可伸缩的图片
 *  @param imageName 图片名
 *  @return 可伸缩的图片
 */
+ (UIImage *)returnResizableImageWithImageName:(NSString *)imageName;

@end

NS_ASSUME_NONNULL_END
