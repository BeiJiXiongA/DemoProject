//
//  ViewController.m
//  DemoProject
//
//  Created by ZhangWei-SpaceHome on 16/6/24.
//  Copyright © 2016年 zhangwei. All rights reserved.
//

#import "ViewController.h"
#import "AttributeLabel.h"

@interface ViewController ()

@property (strong, nonatomic) AttributeLabel *demoAttributeLabel;

@property (nonatomic, strong) UILabel *label1;
@property (nonatomic, strong) UILabel *label2;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    self.view.backgroundColor = [UIColor whiteColor];
    
//    _demoAttributeLabel = [[AttributeLabel alloc] init];
//    _demoAttributeLabel.frame = CGRectMake(10, 100, WIDTH - 20, 100);
//    _demoAttributeLabel.backgroundColor = [UIColor blueColor];
//    _demoAttributeLabel.textColor = [UIColor whiteColor];
//    [self.view addSubview:_demoAttributeLabel];
//    
//    NSString *text = @"1234567890987654321";
//    NSMutableString *mutableText = [[NSMutableString alloc] initWithString:text];
//    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:mutableText];
//    [attributedString replaceCharactersInRange:NSMakeRange(3, 3) withString:@""];
//    [attributedString deleteCharactersInRange:NSMakeRange(5, 3)];
//    NSDictionary *dic = @{NSFontAttributeName: [UIFont systemFontOfSize:14],NSForegroundColorAttributeName: [UIColor redColor],NSBackgroundColorAttributeName:[UIColor orangeColor]};
//    [attributedString addAttributes:dic range:NSMakeRange(5, 3)];
//    _demoAttributeLabel.numberOfLines = 0;
//    _demoAttributeLabel.attributedText = attributedString;
//
//    
//    UIView *containerView = [[UIView alloc] init];
//    containerView.frame = CGRectMake(20, _demoAttributeLabel.bottom, WIDTH - 240, 200);
//    containerView.backgroundColor = [UIColor orangeColor];
//    [self.view addSubview:containerView];
//    
//    UIView *view1 = [[UIView alloc] init];
//    view1.frame = CGRectMake(20, 20, 50, 50);
//    view1.backgroundColor = [UIColor whiteColor];
////    view1.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleRightMargin|UIViewAutoresizingFlexibleBottomMargin|
////    UIViewAutoresizingFlexibleTopMargin;
//    [containerView addSubview:view1];
//    
//    UIView *view2 = [[UIView alloc] init];
//    view2.frame = CGRectMake(containerView.width - 70, containerView.height - 70, 50, 50);
//    view2.backgroundColor = [UIColor blueColor];
////    view2.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin|                                                      UIViewAutoresizingFlexibleRightMargin|UIViewAutoresizingFlexibleBottomMargin|
////        UIViewAutoresizingFlexibleTopMargin;
//    [containerView addSubview:view2];
//    
//    containerView.width = 300;
//    containerView.height = 200;
    
    [self label1];
    [self label2];
    [self layout];
    _label1.width = 180;
}

-(void)layout
{
    NSDictionary *views = NSDictionaryOfVariableBindings(_label1, _label2);
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|-30.0-[_label1]-30.0-|" options:0 metrics:nil views:views]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-(>=200)-[_label1(50)]" options:0 metrics:nil views:views]];
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[_label2(==_label1)]" options:0 metrics:nil views:views]];

    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[_label2(==_label1)]" options:0 metrics:nil views:views]];

     [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_label2 attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:_label1 attribute:NSLayoutAttributeBottom multiplier:1 constant:10]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_label2 attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:_label1 attribute:NSLayoutAttributeLeading multiplier:1 constant:0]];
}

-(UILabel *)label1
{
    if (!_label1) {
        _label1 = [[UILabel alloc] init];
        _label1.text = @"1";
        _label1.textAlignment = NSTextAlignmentCenter;
        _label1.font = [UIFont systemFontOfSize:30];
        _label1.backgroundColor = [[UIColor yellowColor] colorWithAlphaComponent:1];
        _label1.translatesAutoresizingMaskIntoConstraints = NO;
        [self.view addSubview:_label1];
    }
    return _label1;
}

-(UILabel *)label2
{
    if (!_label2) {
        _label2 = [[UILabel alloc] init];
        _label2.text = @"2";
        _label2.textAlignment = NSTextAlignmentCenter;
        _label2.font = [UIFont systemFontOfSize:30];
        _label2.backgroundColor = [[UIColor greenColor] colorWithAlphaComponent:1];
        _label2.translatesAutoresizingMaskIntoConstraints = NO;
        [self.view addSubview:_label2];
    }
    return _label1;
}

-(void)viewDidLayoutSubviews
{
//    NSLog(@"%s",__func__);
//    _demoAttributeLabel.height = 200;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
