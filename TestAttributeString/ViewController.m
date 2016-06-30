//
//  ViewController.m
//  TestAttributeString
//
//  Created by chengxianghe on 16/6/30.
//  Copyright © 2016年 cn. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *label;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSString *tmpStr = @"测试后面有没有图片测试后面有没有图片测试后面有没有图片[京东]";
    
    UIFont *font = [UIFont systemFontOfSize:16];
    CGFloat imageHeight = font.lineHeight;

    // 设置图片附件
    NSTextAttachment *textAttachment = [[NSTextAttachment alloc] init];
    UIImage *image = [UIImage imageNamed:@"test.jpg"];
    textAttachment.image = image;
    // 调整一下图片的位置,如果你的图片偏上或者偏下，调整一下bounds的y值即可
    textAttachment.bounds = CGRectMake(0, -2, imageHeight, imageHeight);

    NSAttributedString *imageStr = [NSAttributedString attributedStringWithAttachment:textAttachment];
    
    NSMutableAttributedString *mStr = [[NSMutableAttributedString alloc] initWithString:tmpStr];
    
    NSRange range = [tmpStr rangeOfString:@"[京东]"];
    [mStr replaceCharactersInRange:range withAttributedString:imageStr];
    
    self.label.attributedText = mStr;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
