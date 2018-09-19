//
//  ShowViewController.h
//  GPUImageDemo
//
//  Created by chuzhaozhi on 2018/9/18.
//  Copyright © 2018年 JackerooChu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <GPUImageView.h>
#import <GPUImage/GPUImage.h>
NS_ASSUME_NONNULL_BEGIN

@interface ShowViewController : UIViewController
@property (nonatomic,assign) NSInteger typeId;
@property (nonatomic,copy) NSString *ti;
@property (nonatomic,strong) GPUImageFilter *filter;
@end

NS_ASSUME_NONNULL_END
