
//
//  UIButton+LBIndicatorAction.m
//  LBIndicatorItem
//
//  Created by 李祖建 on 2017/8/10.
//  Copyright © 2017年 LittleBitch. All rights reserved.
//

#import "UIButton+LBIndicatorAction.h"

#import "CustomIndicatorView.h"

#import "UIView+LBCategory.h"

#import "AppDelegate.h"

#define WINDOW ((AppDelegate *)[UIApplication sharedApplication].delegate).window//window

@implementation UIButton (LBIndicatorAction)

/**
 可选择是否清空当前设置的image，并进入loading
 */
- (void)startAnimationWithIndicatorStyle:(UIActivityIndicatorViewStyle)indicatorStyle clearImage:(BOOL)clearImage
{
    for (UIView *subView in self.subviews) {
        if ([subView isKindOfClass:[CustomIndicatorView class]]) {
            [subView removeFromSuperview];
            break;
        }
    }
    CustomIndicatorView *indicatorView = [[CustomIndicatorView alloc]initWithActivityIndicatorStyle:indicatorStyle];
    indicatorView.tag = INDICATORVIEW_TAG;
    indicatorView.hidesWhenStopped = YES;
    self.userInteractionEnabled = NO;
    indicatorView.center = CGPointMake(CGRectGetMidX(self.bounds),CGRectGetMidY(self.bounds));
    [self addSubview:indicatorView];
    [indicatorView startAnimating];
    indicatorView.tempTitle = self.titleLabel.text;
    if (clearImage) {
        indicatorView.tempImage = self.imageView.image;
        [self setImage:[[UIImage alloc]init] forState:UIControlStateNormal];
    }else{
        indicatorView.tempImage = nil;
    }
    [self setTitle:@"" forState:UIControlStateNormal];
}


- (void)startAnimationWithIndicatorStyle:(UIActivityIndicatorViewStyle)indicatorStyle
{
    [self startAnimationWithIndicatorStyle:indicatorStyle clearImage:NO];
}

- (void)startAnimationWithIndicatorStyle:(UIActivityIndicatorViewStyle)indicatorStyle viewEnabled:(BOOL)viewEnabled
{
    self.viewController.view.userInteractionEnabled = viewEnabled;
    [self startAnimationWithIndicatorStyle:indicatorStyle];
}

/**
 停止加载状态

 @param title 停止后的标题，如果未nil则会默认显示原标题
 */
- (void)stopAnimationWithTitle:(NSString *)title
{
    CustomIndicatorView *indicatorView = (CustomIndicatorView *)[self viewWithTag:INDICATORVIEW_TAG];
    if (indicatorView) {
        [indicatorView stopAnimating];
        if (title) {
            [self setTitle:title forState:UIControlStateNormal];
        }else{
            [self setTitle:indicatorView.tempTitle forState:UIControlStateNormal];
            if (self.selected) {
                [self setTitle:indicatorView.tempTitle forState:UIControlStateSelected];
            }
        }
        if (indicatorView.tempImage) {
            [self setImage:indicatorView.tempImage forState:UIControlStateNormal];
        }
        [indicatorView removeFromSuperview];
        self.userInteractionEnabled = YES;
        self.viewController.view.userInteractionEnabled = YES;
    }else{
        if (title) {
            [self setTitle:title forState:UIControlStateNormal];
            self.userInteractionEnabled = YES;
            self.viewController.view.userInteractionEnabled = YES;
        }
    }
}

- (BOOL)isStartIndicator
{
    for (UIView *subView in self.subviews) {
        if ([subView isKindOfClass:[CustomIndicatorView class]]) {
            return YES;
            break;
        }
    }
    return NO;
}



//停止所有的带菊花button
+ (void)stopAllButtonAnimation
{
    //停止菊花
    dispatch_async(dispatch_get_main_queue(), ^{
        for (NSInteger i = 0; ; i++) {
            CustomIndicatorView *indicatorView = (CustomIndicatorView *)[WINDOW viewWithTag:INDICATORVIEW_TAG];
            if (indicatorView) {
                UIButton *button = (UIButton *)indicatorView.superview;
                if (!button) {
                    [indicatorView stopAnimating];
                }
                if (button.titleLabel.text.length) {
                    [button stopAnimationWithTitle:nil];
                }else{
                    [button stopAnimationWithTitle:button.titleLabel.text];
                }
                
                button.viewController.view.userInteractionEnabled = YES;
                [self stopAllButtonAnimation];
            }else{
                return ;
            }
        }
        
    });
}


@end
