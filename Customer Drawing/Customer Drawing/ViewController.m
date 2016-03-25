//
//  ViewController.m
//  Customer Drawing
//
//  Created by Sunhy on 16/3/25.
//  Copyright © 2016年 Hongyi. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 30, 30)];
    button.backgroundColor = [UIColor purpleColor];
    [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    self.view.backgroundColor = [UIColor grayColor];
    
    int viewWidth = 200;
    int viewHeight = 200;
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width / 2 - viewWidth / 2, [UIScreen mainScreen].bounds.size.height / 2 - viewHeight / 2, viewWidth, viewHeight)];
    view.backgroundColor = [UIColor whiteColor];
//    UIImage *image = [UIImage imageNamed:@"jj.jpg"];
//    UIImage *image = [UIImage imageNamed:@"Checked"];
    [self.view addSubview:view];
    [self.view addSubview:button];
    
    int layerWidth = 100;
    int layerHeight = 100;
    CALayer *layer = [CALayer layer];
    layer.backgroundColor = [UIColor blueColor].CGColor;
    layer.frame = CGRectMake(viewWidth / 2 - layerWidth / 2, viewHeight / 2- layerHeight / 2, layerWidth, layerHeight);
    
    
    layer.delegate = self;
//    layer.contents = (__bridge id)image.CGImage;
//    view.contentMode = UIViewContentModeScaleAspectFit;
//    layer.contentsGravity = kCAGravityResizeAspect;
//    layer.contentsGravity = kCAGravityCenter;
//    layer.contentsScale = image.scale;
    
//    layer.contentsScale = [[UIScreen mainScreen] scale];
    // 限制在边界内
//    layer.masksToBounds = YES;
    // 可以用于拼合图像
//    layer.contentsRect = CGRectMake(0, 0, 0.5, 0.5);
    // stretching
//    layer.contentsCenter = CGRectMake(0.5, 0.5, 0.5, 0.5);
    
    
    
    [view.layer addSublayer:layer];
    //Do not call this method directly. Just for test
    [layer display];
}

-(void)buttonAction:(UIButton *)sender{
    NSLog(@"asfdf");
    [self.view setNeedsDisplay];
}

//-(void)displayLayer:(CALayer *)layer{
//    UIImage *image = [UIImage imageNamed:@"jj.jpg"];
//    layer.contents = (__bridge id)image.CGImage;
//}

// 如果上面方法没有实现，则调用此方法
-(void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx{
    CGContextStrokeEllipseInRect(ctx, layer.bounds);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
