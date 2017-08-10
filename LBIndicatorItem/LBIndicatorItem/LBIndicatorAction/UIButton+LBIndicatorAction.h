//
//  UIButton+LBIndicatorAction.h
//  LBIndicatorItem
//
//  Created by 李祖建 on 2017/8/10.
//  Copyright © 2017年 LittleBitch. All rights reserved.
//

#import <UIKit/UIKit.h>

#define INDICATORVIEW_TAG 2000

@interface UIButton (LBIndicatorAction)

/**
 可选择是否清空当前设置的image，并进入loading
 */
- (void)startAnimationWithIndicatorStyle:(UIActivityIndicatorViewStyle)indicatorStyle clearImage:(BOOL)clearImage;


/**
 普通状态
 */
- (void)startAnimationWithIndicatorStyle:(UIActivityIndicatorViewStyle)indicatorStyle;


/**
 加载同时禁止当前视图交互
 */
- (void)startAnimationWithIndicatorStyle:(UIActivityIndicatorViewStyle)indicatorStyle viewEnabled:(BOOL)viewEnabled;

/**
 停止加载状态
 
 @param title 停止后的标题，如果未nil则会默认显示原标题
 */
- (void)stopAnimationWithTitle:(NSString *)title;


/**
 判断是否处于加载状态
 */
- (BOOL)isStartIndicator;


/**
 停止当前视图 所有加载状态
 */
+ (void)stopAllButtonAnimation;

@end
