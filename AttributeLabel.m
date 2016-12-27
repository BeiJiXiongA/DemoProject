
//
//  AttributeLabel.m
//  DemoProject
//
//  Created by ZhangWei-SpaceHome on 16/6/24.
//  Copyright © 2016年 zhangwei. All rights reserved.
//

#import "AttributeLabel.h"

@interface AttributeLabel ()
{
    CGFloat fontSize;
}
@end

@implementation AttributeLabel

-(id)init
{
    self = [super init];
    if (self) {
        [self setupLabel];
    }
    return self;
}

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupLabel];
    }
    return self;
}

-(id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self setupLabel];
    }
    return self;
}


-(void)setupLabel
{
    NSLog(@"hhhhhh");
    NSString *text = @"1234567890987654321";
    NSMutableString *mutableText = [[NSMutableString alloc] initWithString:text];
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:mutableText];
    [attributedString replaceCharactersInRange:NSMakeRange(3, 3) withString:@""];
    [attributedString deleteCharactersInRange:NSMakeRange(5, 3)];
    NSDictionary *dic = @{NSFontAttributeName: [UIFont systemFontOfSize:fontSize],NSForegroundColorAttributeName: [UIColor redColor]};
    [attributedString addAttributes:dic range:NSMakeRange(5, 3)];
    self.numberOfLines = 0;
    self.attributedText = attributedString;
    CGSize textSize = [self calculateTitleSizeWithString:text];
    self.height = textSize.height+100;
}

- (CGSize)calculateTitleSizeWithString:(NSString *)string
{
    //CGFloat fontSize = 14.0;
    NSDictionary *dic = @{NSFontAttributeName: [UIFont systemFontOfSize:fontSize]};
    CGSize size = [string boundingRectWithSize:CGSizeMake(280, 0) options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:dic context:nil].size;
    return CGSizeMake(ceilf(size.width)+2, size.height);
}

@end
