
//
//  DemoViewController.m
//  DemoProject
//
//  Created by ZhangWei-SpaceHome on 16/11/16.
//  Copyright © 2016年 zhangwei. All rights reserved.
//

#import "DemoViewController.h"
#import "DragView.h"
#import "ResultViewController.h"

@interface DemoViewController ()<UIScrollViewDelegate>
{
    UIScrollView *containerScrollView;
    UIImageView *demoImageView;
    DragView *drag;
}
@end

@implementation DemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
 
    UIBarButtonItem *resetItem = [[UIBarButtonItem alloc] init];
    [resetItem setTitle:@"还原"];
    self.navigationItem.leftBarButtonItem = resetItem;
    resetItem.target = self;
    resetItem.action = @selector(resetClick);
    
    UIBarButtonItem *doneItem = [[UIBarButtonItem alloc] init];
    [doneItem setTitle:@"确定"];
    self.navigationItem.rightBarButtonItem = doneItem;
    doneItem.target = self;
    doneItem.action = @selector(doneClick);
    
    drag = [[DragView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:drag];
    
}

-(void)resetClick
{
    [drag resetLayout];
}

-(void)doneClick
{
    ResultViewController *result = [[ResultViewController alloc] init];
    result.resultImage = [drag getImage];
    [self.navigationController pushViewController:result animated:YES];
}

-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return demoImageView;
}

-(void)scrollViewDidZoom:(UIScrollView *)scrollView
{
    NSLog(@"did end zoom scale %f",scrollView.zoomScale);
}

- (void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(UIView *)view atScale:(CGFloat)scale

{
//    [containerScrollView setZoomScale:scale animated:YES];
    NSLog(@"did end zoom scale %f",scale);
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
