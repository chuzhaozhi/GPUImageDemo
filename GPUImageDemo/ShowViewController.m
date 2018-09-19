//
//  ShowViewController.m
//  GPUImageDemo
//
//  Created by chuzhaozhi on 2018/9/18.
//  Copyright © 2018年 JackerooChu. All rights reserved.
//

#import "ShowViewController.h"
#import <GPUImageView.h>
#import <GPUImage/GPUImage.h>
@interface ShowViewController ()

@end

@implementation ShowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = self.ti;
    self.view.backgroundColor = [UIColor colorWithRed:250/255.0 green:250/255.0 blue:250/255.0 alpha:1];
    UILabel *tip = [[UILabel alloc] initWithFrame:CGRectMake(50, 0, 200, 30)];
    tip.text = @"渲染之后的图";
    tip.textColor = [UIColor redColor];
    [self.view addSubview:tip];
    UIImage *inputImage =[UIImage imageNamed:@"lzl"];
    //设置要渲染的区域
    [self.filter forceProcessingAtSize:inputImage.size];
    [self.filter useNextFrameForImageCapture];
    //获取数据源
    GPUImagePicture *stillImageSource = [[GPUImagePicture alloc]initWithImage:inputImage];
    //添加上滤镜
    [stillImageSource addTarget:self.filter];
    //开始渲染
    [stillImageSource processImage];
    //获取渲染后的图片
    UIImage *newImage = [self.filter imageFromCurrentFramebuffer];
    //加载出来
    UIImageView *imageView = [[UIImageView alloc] initWithImage:newImage];
    imageView.frame = CGRectMake(50,0,250 ,250);
    [self.view addSubview:imageView];
    UILabel *tips = [[UILabel alloc] initWithFrame:CGRectMake(50, 250, 200, 30)];
    tips.text = @"原图";
    tips.textColor = [UIColor redColor];
    [self.view addSubview:tips];
    UIImageView *oldImageView = [[UIImageView alloc] initWithImage:inputImage];
    oldImageView.frame = CGRectMake(50,300,250 ,250);
    [self.view addSubview:oldImageView];

    // Do any additional setup after loading the view.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
