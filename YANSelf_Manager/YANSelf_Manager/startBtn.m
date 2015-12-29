//
//  startBtn.m
//  masonry简单使用
//
//  Created by YAN on 15/12/28.
//  Copyright © 2015年 YAN. All rights reserved.
//  传入的数据：url头像，跳到哪个controller，是否显示额外信息

#import "startBtn.h"
#import "UIView+ViewWithXib.h"
#import "Masonry.h"
@implementation startBtn
{
    UIView *superView ;
    Class _otherCtl ;
    UIViewController * _superViewCtl;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self = (id)[UIView loadViewWithXib:@"startBtn" withOwner:self] ;
         superView = self ;
         [self setAdaptive] ;
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapped)] ;
        [self addGestureRecognizer:tap] ;
    }
    return self;
}
#pragma mark 点击按钮
- (void)tapped
{
    /**
     *  改变_img的图片
     */
    _img.image = [UIImage imageNamed:@"btn.png"] ;
    /**
     *  将该btn的一些属性传递出去
     */
    if([self.delegate respondsToSelector:@selector(tappedWithAction:)])
    {
        [self.delegate tappedWithAction:_lab.text] ;
    }
    /**
     *  跳转界面
     */
    UIViewController *superCtl = _superViewCtl ;
    UIViewController *otherCtl = _otherCtl.new ;
    [superCtl.navigationController pushViewController:otherCtl animated:YES] ;
}
#pragma mark 设置按钮的一些属性
/**
 *  @param url   图片路径
 *  @param info  label参数
 *  @param block 该类要传到另一个类的数据
 *  @param ctl   要指向的其它控制器
 *  @param owner 协议的拥有者/父view的控制器
 */
- (void)configureWithAvstarUrl:(NSString *)url Vinfo:(id)info tapped:(void (^)(void))block CtlClass:(Class)ctl DelegateOwner:(id)owner
{
    _img.image = [UIImage imageNamed:url] ;
    _lab.text = info ;
    block() ;
    _otherCtl = ctl ;
    _superViewCtl = owner ;
    self.delegate = owner ;
}
#pragma mark 添加适配
- (void)setAdaptive
{
    [_img mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(superView.mas_left) ;
        make.top.mas_equalTo(superView.mas_top).offset(10);
        make.width.equalTo(_lab) ;
        make.height.equalTo(@50) ;
    }] ;
    
    [_lab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_img.mas_top) ;
        make.left.mas_equalTo(_img.mas_right) ;
        make.right.mas_equalTo(superView.mas_right) ;
        make.width.equalTo(_img) ;
        make.height.equalTo(_img) ;
    }] ;
}
@end
