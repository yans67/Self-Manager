//
//  ViewController.m
//  masonry简单使用
//
//  Created by YAN on 15/12/23.
//  Copyright (c) 2015年 YAN. All rights reserved.
//

#import "ViewController.h"
#import "startBtn.h"
#import "Masonry.h"
#import "secondCtl.h"
/**
 *  验证UIScrollView里面的contentSize和AutoLayout的关系
 */
@interface ViewController ()<tappedDelegate>
@property (strong, nonatomic) IBOutlet UIButton *topBtn;

@end

@implementation ViewController
{
    UIScrollView * _scroll ;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    //    redView *red = [redView new] ;
    //    self.view = red ;
    //    self.view.backgroundColor = [UIColor whiteColor ] ;
    
    self.view.backgroundColor = [UIColor whiteColor] ;
    //    [self addPercent] ;
    [self addSelf_Manager] ;
    
}
#pragma mark 添加self-manager模式
- (void)addSelf_Manager
{
    /**
     self-manager 按钮
     */
    startBtn *btn = [[startBtn alloc]init] ;
    [self.view addSubview:btn] ;
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(self.view) ;
        make.width.height.equalTo(@100);
    }] ;
    [btn configureWithAvstarUrl:@"btn2.png" Vinfo:@"yans67" tapped:^{
        NSLog(@"Block:from btn to controller...") ;
    } CtlClass:secondCtl.class  DelegateOwner:self] ;
    
    startBtn *btn2 = [[startBtn alloc]init] ;
    [self.view addSubview:btn2] ;
    //添加btn2的约束
    [btn2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@100) ;
        make.centerX.equalTo(self.view) ;
        make.width.height.equalTo(@100);
    }] ;
    //添加btn2的配置
    [btn2 configureWithAvstarUrl:@"btn2.png" Vinfo:@"yans65" tapped:^{
    } CtlClass:secondCtl.class  DelegateOwner:self] ;
    
}
#pragma mark 添加百分比测试适配
- (void)addPercent
{
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(10, 20, 30, 30)];
    view.backgroundColor = [UIColor yellowColor] ;
    [self.view addSubview:view] ;
}
#pragma mark 添加scrollView
- (void)addMyScrollView
{
    UIScrollView *scrollView = [UIScrollView new];
    scrollView.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:scrollView];
    [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view).with.insets(UIEdgeInsetsMake(5,5,5,5));
    }];
    int count = 10;
    
    UIView *lastView = nil;
    
    for ( int i = 1 ; i <= count ; ++i )
    {
        UIView *subv = [UIView new];
        [scrollView addSubview:subv];
        subv.backgroundColor = [UIColor colorWithHue:( arc4random() % 256 / 256.0 )
                                          saturation:( arc4random() % 128 / 256.0 ) + 0.5
                                          brightness:( arc4random() % 128 / 256.0 ) + 0.5
                                               alpha:1];
        
        [subv mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(@30);
            make.right.equalTo(@10) ;
            make.width.equalTo(@200) ;
            make.height.equalTo(@(20*i));
            
            if ( lastView )
            {
                make.top.equalTo(lastView.mas_bottom);
            }
            else
            {
                make.top.equalTo(@10);
            }
        }];
        
        lastView = subv;
    }
    [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(lastView.mas_bottom);
    }];
}
#pragma mark 添加masonrydemo适配视图
- (void)addAlterScrollView
{
    UIScrollView *scrollView = [UIScrollView new];
    scrollView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:scrollView];
    [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view).with.insets(UIEdgeInsetsMake(5,5,5,5));
    }];
    
    //工具视图
    UIView *container = [UIView new];
    [scrollView addSubview:container];
    [container mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(scrollView);
        make.width.equalTo(scrollView);
    }];
    
    int count = 10;
    
    UIView *lastView = nil;
    
    for ( int i = 1 ; i <= count ; ++i )
    {
        UIView *subv = [UIView new];
        [container addSubview:subv];
        subv.backgroundColor = [UIColor colorWithHue:( arc4random() % 256 / 256.0 )
                                          saturation:( arc4random() % 128 / 256.0 ) + 0.5
                                          brightness:( arc4random() % 128 / 256.0 ) + 0.5
                                               alpha:1];
        
        [subv mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.and.right.equalTo(container);
            make.height.mas_equalTo(@(20*i));
            
            if ( lastView )
            {
                make.top.mas_equalTo(lastView.mas_bottom);
            }
            else
            {
                make.top.mas_equalTo(container.mas_top);
            }
        }];
        
        lastView = subv;
    }
    
    
    [container mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(lastView.mas_bottom);
    }];
}
#pragma mark 内存警告
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
#pragma mark 实现btn的协议
-(void)tappedWithAction:(id)info
{
    NSLog(@"点击了按钮...%@",info) ;
}
@end
