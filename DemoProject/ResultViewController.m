//
//  ResultViewController.m
//  DemoProject
//
//  Created by ZhangWei-SpaceHome on 16/11/17.
//  Copyright © 2016年 zhangwei. All rights reserved.
//

#import "ResultViewController.h"

@interface ResultViewController ()

@end

@implementation ResultViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIImageView *demoImageView = [[UIImageView alloc] init];
    demoImageView.frame = CGRectMake(10, 100, _resultImage.size.width, _resultImage.size.height);
    demoImageView.image = _resultImage;
    demoImageView.backgroundColor = [UIColor orangeColor];
    demoImageView.contentMode = UIViewContentModeScaleAspectFit;
    [self.view addSubview:demoImageView];
    
    NSLog(@"result size %@",NSStringFromCGSize(_resultImage.size));
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
