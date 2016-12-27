//
//  DragView.h
//  DemoProject
//
//  Created by ZhangWei-SpaceHome on 16/11/16.
//  Copyright © 2016年 zhangwei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DragView : UIView
@property (nonatomic, strong) UIScrollView *containerScrollView;
@property (nonatomic, strong) UIImageView *demoImage;
@property (nonatomic, strong) UIView *topLine;
@property (nonatomic, strong) UIView *bottomLine;
@property (nonatomic, strong) UIView *leftLine;
@property (nonatomic, strong) UIView *rightLine;
@property (nonatomic, strong) UIView *leftTopView;
@property (nonatomic, strong) UIView *rightTopView;
@property (nonatomic, strong) UIView *leftBottomView;
@property (nonatomic, strong) UIView *rightBottomView;
@property (nonatomic, strong) UIView *bgView;
@property (nonatomic, strong) UIView *topCoverView;
@property (nonatomic, strong) UIView *leftCoverView;
@property (nonatomic, strong) UIView *rightCoverView;
@property (nonatomic, strong) UIView *bottomCoverView;
-(UIImage *)getImage;
-(void)resetLayout;
@end
