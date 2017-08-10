//
//  CustomIndicatorView.h
//  BookClub
//
//  Created by 李祖建 on 15/12/30.
//  Copyright © 2015年 LittleBitch. All rights reserved.
//

//用来记录标题，也不可删

#import <UIKit/UIKit.h>

@interface CustomIndicatorView : UIActivityIndicatorView

@property (strong, nonatomic) NSString *tempTitle;
@property (strong, nonatomic) UIImage *tempImage;

@end
