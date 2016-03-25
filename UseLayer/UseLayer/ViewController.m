//
//  ViewController.m
//  UseLayer
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
    self.view.backgroundColor = [UIColor grayColor];
    
    int viewWidth = 200;
    int viewHeight = 200;
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width / 2 - viewWidth / 2, [UIScreen mainScreen].bounds.size.height / 2 - viewHeight / 2, viewWidth, viewHeight)];
    view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:view];
    
    
    int layerWidth = 100;
    int layerHeight = 100;
    CALayer *layer = [CALayer layer];
    layer.backgroundColor = [UIColor blueColor].CGColor;
    layer.frame = CGRectMake(viewWidth / 2 - layerWidth / 2, viewHeight / 2- layerHeight / 2, layerWidth, layerHeight);
    
    [view.layer addSublayer:layer];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
