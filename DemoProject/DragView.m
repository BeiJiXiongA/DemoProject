//
//  DragView.m
//  DemoProject
//
//  Created by ZhangWei-SpaceHome on 16/11/16.
//  Copyright © 2016年 zhangwei. All rights reserved.
//

#import "DragView.h"

#define COVER_ALPHA  (0.6f)
#define VIEW_DIAMETER  (30)

@interface DragView ()<UIScrollViewDelegate>
{
    UIView *currentTouchView;
}
@end

@implementation DragView

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self containerScrollView];
        [self topLine];
        [self bottomLine];
        [self leftLine];
        [self rightLine];
        [self leftTopView];
        [self rightTopView];
        [self leftBottomView];
        [self rightBottomView];
//        [self bgView];
        [self topCoverView];
        [self leftCoverView];
        [self rightCoverView];
        [self bottomCoverView];
    }
    return self;
}

-(UIImage *)getImage
{
    UIImage *image1 = [self demoImage].image;
    CGImageRef cgRef = image1.CGImage;
    CGSize size = CGSizeMake((_rightLine.right - _leftLine.left)*_containerScrollView.zoomScale, (_bottomLine.bottom - _topLine.top)*_containerScrollView.zoomScale);
    CGPoint origin = CGPointMake(fabs(_containerScrollView.contentOffset.x)+_leftLine.left, fabs(_containerScrollView.contentOffset.y)+_topLine.top+64);
    CGRect newRect = CGRectMake(origin.x, origin.y, size.width, size.height);
    CGImageRef imageRef = CGImageCreateWithImageInRect(cgRef, newRect);
    UIImage *thumbScale = [UIImage imageWithCGImage:imageRef];
    CGImageRelease(imageRef);
    return thumbScale;
    
//    UIImage *image = [self demoImage].image;
//    // 开启图片上下文
//    UIGraphicsBeginImageContextWithOptions(image.size, NO, 0);
//    // 获取图形上下文
//    CGContextRef crf = UIGraphicsGetCurrentContext();
//    
//    CGSize size = CGSizeMake(_rightLine.right - _leftLine.left, _bottomLine.bottom - _topLine.top);
//    CGPoint origin = CGPointMake(fabs(_containerScrollView.contentOffset.x)+_leftLine.left, fabs(_containerScrollView.contentOffset.y)+_topLine.top+64);
//    CGRect newRect = CGRectMake(origin.x, origin.y, size.width, size.height);
////    CGRect newRect = CGRectMake(0, 0, _rightLine.right - _leftLine.left, _bottomLine.bottom - _topLine.top);
//    CGContextAddRect(crf, newRect);
//    
//    //    裁剪图形上下文
//    CGContextClip(crf);
//    
//    // 将图片画到图片上下文中
//    
//    [image drawAtPoint:CGPointZero];
//    // 获取图片
//    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
//    
//    // 关闭图形上下文
//    UIGraphicsEndImageContext();
//    
//    return newImage;
    
//    CGSize size = CGSizeMake(_rightLine.right - _leftLine.left, _bottomLine.bottom - _topLine.top);
//    CGPoint origin = CGPointMake(fabs(_containerScrollView.contentOffset.x)+_leftLine.left, fabs(_containerScrollView.contentOffset.y)+_topLine.top+64);
//    CGRect rect = CGRectMake(origin.x, origin.y, size.width, size.height);
//    UIGraphicsBeginImageContext(self.containerScrollView.contentSize);
//    CGContextRef context = UIGraphicsGetCurrentContext();
//    CGContextSaveGState(context);
//    UIRectClip(rect);
//    [self.containerScrollView.layer renderInContext:context];
//    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
//    UIGraphicsEndImageContext();
//    
//    UIImage* newimage = [UIImage imageWithCGImage:CGImageCreateWithImageInRect([theImage CGImage], rect)];
//    return newimage;
}

-(void)resetLayout
{
    [_containerScrollView setZoomScale:1];
}

-(void)layoutViewsWithTouchPoint:(CGPoint)point
{
    if (CGRectContainsPoint(_topLine.frame, point)) {
        if (point.y < _bottomLine.top - VIEW_DIAMETER) {
            _topLine.centerY = point.y;
            _leftTopView.centerY = point.y;
            _rightTopView.centerY = point.y;
            _leftLine.top = _topLine.bottom;
            _rightLine.top = _topLine.bottom;
            _leftLine.height = _bottomLine.top - _topLine.bottom;
            _rightLine.height = _leftLine.height;
            
            _bgView.height = _bottomLine.top - _topLine.bottom;
            _bgView.top = _topLine.bottom;
            
            _topCoverView.height = _topLine.top;
            
            _leftCoverView.width = _leftLine.left;
            _leftCoverView.height = _bottomLine.bottom - _topLine.top;
            _leftCoverView.top = _topLine.top;
            
            _rightCoverView.width = WIDTH - _rightLine.right;
            _rightCoverView.height = _leftCoverView.height;
            _rightCoverView.left = _rightLine.right;
            _rightCoverView.top = _leftCoverView.top;
        }
    }else if(CGRectContainsPoint(_bottomLine.frame, point)){
        if (point.y > _topLine.bottom + VIEW_DIAMETER) {
            _bottomLine.centerY = point.y;
            _rightBottomView.centerY = point.y;
            _leftBottomView.centerY = point.y;
            _leftLine.height = _bottomLine.top - _topLine.bottom;
            _rightLine.height = _leftLine.height;
            _leftLine.bottom = _bottomLine.top;
            _rightLine.bottom = _bottomLine.top;
            
            _bgView.height = _bottomLine.top - _topLine.bottom;
            _bgView.bottom = _bottomLine.top;
            
            _bottomCoverView.height = HEIGHT - _bottomLine.bottom;
            _bottomCoverView.top = _bottomLine.bottom;
            
            _leftCoverView.width = _leftLine.left;
            _leftCoverView.height = _bottomLine.bottom - _topLine.top;
            _leftCoverView.top = _topLine.top;
            
            _rightCoverView.width = WIDTH - _rightLine.right;
            _rightCoverView.height = _leftCoverView.height;
            _rightCoverView.left = _rightLine.right;
            _rightCoverView.top = _leftCoverView.top;
        }
    }else if(CGRectContainsPoint(_leftLine.frame, point)){
        if (point.x < _rightLine.left - VIEW_DIAMETER) {
            _leftLine.centerX = point.x;
            _leftTopView.centerX = point.x;
            _leftBottomView.centerX = point.x;
            _topLine.left = _leftLine.right;
            _bottomLine.left = _topLine.left;
            _topLine.width = _rightLine.left - _leftLine.right;
            _bottomLine.width = _topLine.width;
            
            _bgView.width = _rightLine.left - _leftLine.right;
            _bgView.left = _leftLine.right;
            
            _leftCoverView.width = _leftLine.left;
            _leftCoverView.height = _bottomLine.bottom - _topLine.top;
            _leftCoverView.top = _topLine.top;
        }
    }else if(CGRectContainsPoint(_rightLine.frame, point)){
        if (point.x > _leftLine.right + VIEW_DIAMETER) {
            _rightLine.centerX = point.x;
            _rightTopView.centerX = point.x;
            _rightBottomView.centerX = point.x;
            _topLine.left = _leftLine.right;
            _bottomLine.left = _topLine.left;
            _topLine.width = _rightLine.left - _leftLine.right;
            _bottomLine.width = _topLine.width;
            
            _bgView.width = _rightLine.left - _leftLine.right;
            _bgView.right = _rightLine.left;
            
            _rightCoverView.width = WIDTH - _rightLine.right;
            _rightCoverView.height = _leftCoverView.height;
            _rightCoverView.left = _rightLine.right;
            _rightCoverView.top = _leftCoverView.top;
        }
    }else if(CGRectContainsPoint(_leftTopView.frame, point)){
        if (point.y < _bottomLine.top - VIEW_DIAMETER &&
            point.x < _rightLine.left - VIEW_DIAMETER) {
            _leftTopView.center = point;
            
            _leftLine.left = _leftTopView.left;
            _leftLine.top = _leftTopView.bottom;
            _leftLine.height = _leftBottomView.top - _leftTopView.bottom;
            
            _topLine.top = _leftTopView.top;
            _topLine.left = _leftTopView.right;
            _topLine.width = _rightTopView.left - _leftTopView.right;
            
            _leftBottomView.centerX = point.x;
            
            _rightTopView.centerY = point.y;
            
            _bottomLine.left = _topLine.left;
            _bottomLine.width = _topLine.width;
            
            _rightLine.top = _leftLine.top;
            _rightLine.height = _leftLine.height;
            
            _topCoverView.height = _topLine.top;
            
            _leftCoverView.width = _leftLine.left;
            _leftCoverView.height = _bottomLine.bottom - _topLine.top;
            _leftCoverView.top = _topLine.top;
            
            _rightCoverView.width = WIDTH - _rightLine.right;
            _rightCoverView.height = _leftCoverView.height;
            _rightCoverView.left = _rightLine.right;
            _rightCoverView.top = _leftCoverView.top;
            
            _bgView.width = _rightTopView.left - _leftTopView.right;
            _bgView.height = _leftBottomView.top - _leftTopView.bottom;
            _bgView.top = _leftTopView.bottom;
            _bgView.left = _leftTopView.right;
        }
    }else if(CGRectContainsPoint(_rightTopView.frame, point)){
        if (point.x > _leftLine.right + VIEW_DIAMETER &&
            point.y < _bottomLine.top - VIEW_DIAMETER) {
            _rightTopView.center = point;
            
            _rightLine.left = _rightTopView.left;
            _rightLine.top = _rightTopView.bottom;
            _rightLine.height = _rightBottomView.top - _rightTopView.bottom;
            
            _topLine.width = _rightTopView.left - _leftTopView.right;
            _topLine.right = _rightTopView.left;
            _topLine.top = _rightTopView.top;
            
            _leftTopView.centerY = point.y;
            
            _rightBottomView.centerX = point.x;
            
            _leftLine.height = _rightLine.height;
            _leftLine.top = _rightLine.top;
            
            _bottomLine.width = _topLine.width;
            _bottomLine.right = _topLine.right;
            
            _topCoverView.height = _topLine.top;
            
            _leftCoverView.width = _leftLine.left;
            _leftCoverView.height = _bottomLine.bottom - _topLine.top;
            _leftCoverView.top = _topLine.top;
            
            _rightCoverView.width = WIDTH - _rightLine.right;
            _rightCoverView.height = _leftCoverView.height;
            _rightCoverView.left = _rightLine.right;
            _rightCoverView.top = _leftCoverView.top;
            
            _bgView.width = _rightTopView.left - _leftTopView.right;
            _bgView.height = _leftBottomView.top - _leftTopView.bottom;
            _bgView.top = _rightTopView.bottom;
            _bgView.right = _rightTopView.left;
        }
    }else if(CGRectContainsPoint(_leftBottomView.frame, point)){
        if (point.y > _topLine.bottom + VIEW_DIAMETER &&
            point.x < _rightLine.left - VIEW_DIAMETER) {
            _leftBottomView.center = point;
            
            _leftLine.height = _leftBottomView.top - _leftTopView.bottom;
            _leftLine.left = _leftBottomView.left;
            _leftLine.bottom = _leftBottomView.top;
            
            _bottomLine.width = _rightBottomView.left - _leftBottomView.right;
            _bottomLine.left = _leftBottomView.right;
            _bottomLine.top = _leftBottomView.top;
            
            _leftTopView.centerX = point.x;
            
            _rightBottomView.centerY = point.y;
            
            _topLine.width = _bottomLine.width;
            _topLine.left = _bottomLine.left;
            
            _rightLine.height = _leftLine.height;
            _rightLine.bottom = _leftLine.bottom;
            
            _bottomCoverView.height = HEIGHT - _bottomLine.bottom;
            _bottomCoverView.top = _bottomLine.bottom;
            
            _leftCoverView.width = _leftLine.left;
            _leftCoverView.height = _bottomLine.bottom - _topLine.top;
            _leftCoverView.top = _topLine.top;
            
            _rightCoverView.width = WIDTH - _rightLine.right;
            _rightCoverView.height = _leftCoverView.height;
            _rightCoverView.left = _rightLine.right;
            _rightCoverView.top = _leftCoverView.top;
            
            _bgView.width = _rightTopView.left - _leftTopView.right;
            _bgView.height = _leftBottomView.top - _leftTopView.bottom;
            _bgView.left = _leftBottomView.right;
            _bgView.bottom = _leftBottomView.top;
        }
    }else if(CGRectContainsPoint(_rightBottomView.frame, point)){
        if (point.y > _topLine.bottom + VIEW_DIAMETER &&
            point.x > _leftLine.right - VIEW_DIAMETER) {
            _rightBottomView.center = point;
            
            _rightLine.height = _rightBottomView.top - _rightTopView.bottom;
            _rightLine.left = _rightBottomView.left;
            _rightLine.bottom = _rightBottomView.top;
            
            _bottomLine.width = _rightBottomView.left - _leftBottomView.right;
            _bottomLine.right = _rightBottomView.left;
            _bottomLine.top = _rightBottomView.top;
            
            _rightTopView.centerX = point.x;
            
            _leftBottomView.centerY = point.y;
            
            _topLine.width = _bottomLine.width;
            _topLine.right = _bottomLine.right;
            
            _leftLine.height = _rightLine.height;
            _leftLine.bottom = _rightLine.bottom;
            
            _bgView.width = _rightTopView.left - _leftTopView.right;
            _bgView.height = _leftBottomView.top - _leftTopView.bottom;
            _bgView.right = _rightBottomView.left;
            _bgView.bottom = _rightBottomView.top;
            
            _bottomCoverView.height = HEIGHT - _bottomLine.bottom;
            _bottomCoverView.top = _bottomLine.bottom;
            
            _leftCoverView.width = _leftLine.left;
            _leftCoverView.height = _bottomLine.bottom - _topLine.top;
            _leftCoverView.top = _topLine.top;
            
            _rightCoverView.width = WIDTH - _rightLine.right;
            _rightCoverView.height = _leftCoverView.height;
            _rightCoverView.left = _rightLine.right;
            _rightCoverView.top = _leftCoverView.top;
        }
    }else if (CGRectContainsPoint(_bgView.frame, point)){
        _bgView.center = point;
        
        _topLine.top = _bgView.top - _topLine.height;
        _topLine.left = _bgView.left;
        
        _bottomLine.top = _bgView.bottom;
        _bottomLine.left = _bgView.left;
        
        _leftLine.top = _bgView.top;
        _leftLine.left = _bgView.left - _leftLine.width;
        
        _rightLine.top = _bgView.top;
        _rightLine.left = _bgView.right;
        
        _leftTopView.left = _bgView.left - _leftTopView.width;
        _leftTopView.top = _bgView.top - _leftTopView.height;
        
        _rightTopView.left = _bgView.right;
        _rightTopView.top = _bgView.top - _leftTopView.height;
        
        _leftBottomView.top = _bgView.bottom;
        _leftBottomView.left = _bgView.left - _leftBottomView.width;
        
        _rightBottomView.top = _bgView.bottom;
        _rightBottomView.left = _bgView.right;
        
        _topCoverView.height = _topLine.top;
        
        _bottomCoverView.height = HEIGHT - _bottomLine.bottom;
        _bottomCoverView.top = _bottomLine.bottom;
        
        _leftCoverView.width = _leftLine.left;
        _leftCoverView.height = _bottomLine.bottom - _topLine.top;
        _leftCoverView.top = _topLine.top;
        
        _rightCoverView.width = WIDTH - _rightLine.right;
        _rightCoverView.height = _leftCoverView.height;
        _rightCoverView.left = _rightLine.right;
        _rightCoverView.top = _leftCoverView.top;
    }
}

-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    if ([[event allTouches] count] == 1) {
        CGPoint point = [[touches anyObject] locationInView:self];
        [self layoutViewsWithTouchPoint:point];
    }
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    if ([[event allTouches] count] == 1) {
        CGPoint point = [[touches anyObject] locationInView:self];
        [self layoutViewsWithTouchPoint:point];
    }
}

-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    if ([[event allTouches] count] == 1) {
        CGPoint point = [[touches anyObject] locationInView:self];
        [self layoutViewsWithTouchPoint:point];
    }
    NSLog(@"t-%.2f,b-%.2f,l-%.2f,r-%.2f",_topLine.top,_bottomLine.bottom,_leftLine.left,_rightLine.right);
}

-(void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    currentTouchView = nil;
}

-(UIView *)topLine
{
    if (!_topLine) {
        _topLine = [[UIView alloc] init];
        _topLine.frame = CGRectMake(105, 200, WIDTH - 210, VIEW_DIAMETER);
        _topLine.backgroundColor = [UIColor grayColor];
        [self addSubview:_topLine];
    }
    return _topLine;
}

-(UIView *)bottomLine
{
    if (!_bottomLine) {
        _bottomLine = [[UIView alloc] init];
        _bottomLine.frame = CGRectMake(_topLine.left, _topLine.bottom + 200, _topLine.width,_topLine.height);
        _bottomLine.backgroundColor = [UIColor orangeColor];
        [self addSubview:_bottomLine];
    }
    return _bottomLine;
}

-(UIView *)leftLine
{
    if (!_leftLine) {
        _leftLine = [[UIView alloc] init];
        _leftLine.backgroundColor = [UIColor redColor];
        _leftLine.frame = CGRectMake(_topLine.left - VIEW_DIAMETER, _topLine.bottom, VIEW_DIAMETER, 200);
        [self addSubview:_leftLine];
    }
    return _leftLine;
}

-(UIView *)rightLine
{
    if (!_rightLine) {
        _rightLine = [[UIView alloc] init];
        _rightLine.frame = CGRectMake(_topLine.right, _topLine.bottom, VIEW_DIAMETER, _leftLine.height);
        _rightLine.backgroundColor = [UIColor greenColor];
        [self addSubview:_rightLine];
    }
    return _rightLine;
}

-(UIView *)leftTopView
{
    if (!_leftTopView) {
        _leftTopView = [[UIView alloc] init];
        _leftTopView.frame = CGRectMake(_topLine.left - VIEW_DIAMETER, _topLine.top, VIEW_DIAMETER, VIEW_DIAMETER);
        _leftTopView.backgroundColor = [UIColor blackColor];
        [self addSubview:_leftTopView];
    }
    return _leftTopView;
}
-(UIView *)rightTopView
{
    if (!_rightTopView) {
        _rightTopView = [[UIView alloc] init];
        _rightTopView.frame = CGRectMake(_topLine.right, _topLine.top, VIEW_DIAMETER, VIEW_DIAMETER);
        _rightTopView.backgroundColor = [UIColor blackColor];
        [self addSubview:_rightTopView];
    }
    return _rightTopView;
}

-(UIView *)leftBottomView
{
    if (!_leftBottomView) {
        _leftBottomView = [[UIView alloc] init];
        _leftBottomView.frame = CGRectMake(_leftLine.left, _leftLine.bottom , VIEW_DIAMETER, VIEW_DIAMETER);
        _leftBottomView.backgroundColor = [UIColor blackColor];
        [self addSubview:_leftBottomView];
    }
    return _leftBottomView;
}


-(UIView *)rightBottomView
{
    if (!_rightBottomView) {
        _rightBottomView = [[UIView alloc] init];
        _rightBottomView.frame = CGRectMake(_topLine.right , _rightLine.bottom , VIEW_DIAMETER, VIEW_DIAMETER);
        _rightBottomView.backgroundColor = [UIColor blackColor];
        [self addSubview:_rightBottomView];
    }
    return _rightBottomView;
}

-(UIScrollView *)containerScrollView
{
    if (!_containerScrollView) {
        _containerScrollView = [[UIScrollView alloc] initWithFrame:self.bounds];
        _containerScrollView.delegate = self;
        [self addSubview:_containerScrollView];
        _containerScrollView.minimumZoomScale = 1;
        _containerScrollView.maximumZoomScale = 5;
        [_containerScrollView addSubview:[self demoImage]];
    }
    return _containerScrollView;
}

-(UIImageView *)demoImage
{
    if (!_demoImage) {
        _demoImage = [[UIImageView alloc] initWithFrame:self.bounds];
        _demoImage.image = [UIImage imageNamed:@"IMG_0700.jpeg"];
    }
    return _demoImage;
}

-(UIView *)bgView
{
    if (!_bgView) {
        _bgView = [[UIView alloc] init];
        _bgView.frame = CGRectMake(_leftTopView.right, _leftTopView.bottom, _rightTopView.left - _leftTopView.right, _leftBottomView.top - _leftTopView.bottom);
        _bgView.backgroundColor = [UIColor clearColor];
        [self insertSubview:_bgView aboveSubview:self.containerScrollView];
        
    }
    return _bgView;
}

-(UIView *)topCoverView
{
    if (!_topCoverView) {
        _topCoverView = [[UIView alloc] init];
        _topCoverView.frame = CGRectMake(0, 0, WIDTH, _topLine.top);
        _topCoverView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:COVER_ALPHA];
        _topCoverView.userInteractionEnabled = NO;
        [self addSubview:_topCoverView];
    }
    return _topCoverView;
}

-(UIView *)bottomCoverView
{
    if (!_bottomCoverView) {
        _bottomCoverView = [[UIView alloc] init];
        _bottomCoverView.frame = CGRectMake(0, _bottomLine.bottom, WIDTH, HEIGHT - _bottomLine.bottom);
        _bottomCoverView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:COVER_ALPHA];
        _bottomCoverView.userInteractionEnabled = NO;
        [self addSubview:_bottomCoverView];
    }
    return _bottomCoverView;
}

-(UIView *)leftCoverView
{
    if (!_leftCoverView) {
        _leftCoverView = [[UIView alloc] init];
        _leftCoverView.frame = CGRectMake(0, _topLine.top, _leftLine.left, _bottomLine.bottom-_topLine.top);
        _leftCoverView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:COVER_ALPHA];
        _leftCoverView.userInteractionEnabled = NO;
        [self addSubview:_leftCoverView];
    }
    return _leftCoverView;
}

-(UIView *)rightCoverView
{
    if (!_rightCoverView) {
        _rightCoverView = [[UIView alloc] init];
        _rightCoverView.frame = CGRectMake(_rightLine.right, _topLine.top, WIDTH - _rightLine.right, _bottomLine.bottom - _topLine.top);
        _rightCoverView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:COVER_ALPHA];
        _rightCoverView.userInteractionEnabled = NO;
        [self addSubview:_rightCoverView];
    }
    return _rightCoverView;
}

#pragma mark - Scrollview 代理
-(void)scrollViewWillBeginZooming:(UIScrollView *)scrollView withView:(UIView *)view
{
    
}

-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return [self demoImage];
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSLog(@"===%@",NSStringFromCGPoint(scrollView.contentOffset));
}
@end
