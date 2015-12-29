//
//  startBtn.h
//  masonry简单使用
//
//  Created by YAN on 15/12/28.
//  Copyright © 2015年 YAN. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@protocol tappedDelegate <NSObject>

-(void) tappedWithAction:(id)info ;

@end
@interface startBtn : UIView

@property (strong, nonatomic) IBOutlet UIImageView *img;
@property (strong, nonatomic) IBOutlet UILabel *lab;
@property(strong,nonatomic)id<tappedDelegate> delegate ;
- (void)configureWithAvstarUrl:(NSString *)url Vinfo:(id)info tapped:(void (^)(void))block CtlClass:(Class)ctl DelegateOwner:(id)owner;
@end
