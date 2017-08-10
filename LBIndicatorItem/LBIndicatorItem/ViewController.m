//
//  ViewController.m
//  LBIndicatorItem
//
//  Created by 李祖建 on 2017/8/10.
//  Copyright © 2017年 LittleBitch. All rights reserved.
//

#import "ViewController.h"

#import "UIButton+LBIndicatorAction.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIButton *textBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [textBtn setTitle:@"文字按钮" forState:UIControlStateNormal];
    textBtn.frame = CGRectMake(0, 0, 201, 41);
    textBtn.layer.borderColor = [UIColor blackColor].CGColor;
    textBtn.layer.borderWidth = 1;
    textBtn.layer.cornerRadius = textBtn.frame.size.height/2;
    [textBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [textBtn setCenter:self.view.center];
    [textBtn addTarget:self action:@selector(textBtnPressed:) forControlEvents:UIControlEventTouchUpInside];
    
    
    UIButton *iconBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//    [iconBtn setTitle:@"文字按钮" forState:UIControlStateNormal];
    [iconBtn setImage:[UIImage imageNamed:@"icon_parise_s"] forState:UIControlStateNormal];
    iconBtn.frame = CGRectMake(0, 0, 48, 41);
//    iconBtn.layer.borderColor = [UIColor blackColor].CGColor;
//    iconBtn.layer.borderWidth = 1;
//    iconBtn.layer.cornerRadius = iconBtn.frame.size.height/2;
    [iconBtn addTarget:self action:@selector(iconBtnPressed:) forControlEvents:UIControlEventTouchUpInside];
    iconBtn.center = CGPointMake(self.view.center.x, CGRectGetMaxY(textBtn.frame)+40);
    
    [self.view addSubview:textBtn];
    [self.view addSubview:iconBtn];
    
}

- (void)textBtnPressed:(UIButton *)sender
{
    [sender startAnimationWithIndicatorStyle:UIActivityIndicatorViewStyleGray];
    [self performSelector:@selector(stopIndicatorAction:) withObject:sender afterDelay:3];
}

- (void)iconBtnPressed:(UIButton *)sender
{
    [sender startAnimationWithIndicatorStyle:UIActivityIndicatorViewStyleGray clearImage:YES];
    [self performSelector:@selector(stopIndicatorAction:) withObject:sender afterDelay:3];
}

- (void)stopIndicatorAction:(UIButton *)sender
{
    [sender stopAnimationWithTitle:nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
