//
//  ViewController.m
//  GPUImageDemo
//
//  Created by chuzhaozhi on 2018/9/18.
//  Copyright © 2018年 JackerooChu. All rights reserved.
//

#import "ViewController.h"
#import <GPUImageView.h>
#import <GPUImage/GPUImage.h>
#import "ShowViewController.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSArray *dataSource;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.translucent = NO;
    self.title = @"GPUImage使用";
    self.dataSource = @[@"素描",@"阀值素描，形成有噪点的素描",@"卡通效果（黑色粗线描边）",@"伸展失真，哈哈镜",@"桑原(Kuwahara)滤波,水粉画的模糊效果；处理时间比较长，慎用",@"浮雕效果，带有点3d的感觉",@"像素化",@"同心圆像素化",@"交叉线阴影，形成黑白网状画面",@"色彩丢失，模糊（类似监控摄像效果）",@"晕影，形成黑色圆形边缘，突出中间图像的效果",@"漩涡，中间形成卷曲的画面",@"水晶球效果",@"球形折射，图形倒立"];
    [self initTableView];
  
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)initTableView{
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    _tableView.dataSource = self;
    _tableView.delegate =self;
    if (@available(iOS 11.0, *)) {
        
        _tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        
    } else {
        
        self.automaticallyAdjustsScrollViewInsets = NO;
        
    }
    
    _tableView.showsVerticalScrollIndicator = NO;
    /// 自动关闭估算高度，不想估算那个，就设置那个即可
    _tableView.estimatedRowHeight = 0;
    _tableView.estimatedSectionHeaderHeight = 0;
    _tableView.estimatedSectionFooterHeight = 0;
    _tableView.tableFooterView =[[UIView alloc] init];
    [self.view addSubview:_tableView];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSource.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *Identifier =@"UITableViewCellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:Identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:Identifier];
    }
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;

    cell.textLabel.text = self.dataSource[indexPath.row];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    ShowViewController *showViewController = [[ShowViewController alloc] init];
    showViewController.typeId = indexPath.row;
    showViewController.ti = self.dataSource[indexPath.row];
    switch (indexPath.row) {
        case 0:{
            showViewController.filter = [[GPUImageSketchFilter alloc] init];  //素描
        }
            break;
        case 1:{
            showViewController.filter = [[GPUImageThresholdSketchFilter alloc] init];  //阀值素描，形成有噪点的素描
        }
            break;
        case 2:{
            showViewController.filter = [[GPUImageToonFilter alloc] init];     //卡通效果（黑色粗线描边）
        }
            break;
        case 3:{
            showViewController.filter = [[GPUImageStretchDistortionFilter alloc] init];   //伸展失真，哈哈镜
        }
            break;
        case 4:{
            showViewController.filter = [[GPUImageKuwaharaFilter alloc] init]; //桑原(Kuwahara)滤波,水粉画的模糊效果；处理时间比较长，慎用
        }
            break;
        case 5:{
            showViewController.filter = [[GPUImageEmbossFilter alloc] init];  //浮雕效果，带有点3d的感觉
        }
            break;
        case 6:{
            showViewController.filter = [[GPUImagePixellateFilter alloc] init]; //像素化
        }
            break;
        case 7:{
                showViewController.filter = [[GPUImagePolarPixellateFilter alloc] init];  //同心圆像素化
            }
            break;
            
        case 8:{
            showViewController.filter = [[GPUImageCrosshatchFilter alloc] init];  //交叉线阴影，形成黑白网状画面
        }
            break;
        case 9:{
            showViewController.filter = [[GPUImageColorPackingFilter alloc] init];   //色彩丢失，模糊（类似监控摄像效果）
        }
            break;
        case 10:{
            showViewController.filter = [[GPUImageVignetteFilter alloc] init];    //晕影，形成黑色圆形边缘，突出中间图像的效果
        }
            break;
        case 11:{
            showViewController.filter = [[GPUImageSwirlFilter alloc] init];   //漩涡，中间形成卷曲的画面
        }
            break;
        case 12:{
            showViewController.filter = [[GPUImageGlassSphereFilter alloc] init];    //水晶球效果
        }
            break;
        case 13:{
            showViewController.filter = [[GPUImageSphereRefractionFilter alloc] init];   //球形折射，图形倒立
        }
            break;
        default:
            break;
            
    }
    [self.navigationController pushViewController:showViewController animated:YES];
}
@end
