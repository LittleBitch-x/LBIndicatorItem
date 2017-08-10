//
//  UIView+LBCategory.m
//  LBIndicatorItem
//
//  Created by 李祖建 on 2017/8/10.
//  Copyright © 2017年 LittleBitch. All rights reserved.
//

#import "UIView+LBCategory.h"

@implementation UIView (LBCategory)


- (UIViewController*)viewController
{
    for (UIView* next = [self superview]; next; next = next.superview) {
        UIResponder* nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController*)nextResponder;
        }
    }
    return nil;
}

@end
