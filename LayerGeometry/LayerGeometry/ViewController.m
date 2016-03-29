//
//  ViewController.m
//  LayerGeometry
//
//  Created by Sunhy on 16/3/28.
//  Copyright © 2016年 Hongyi. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) UIView *myView;
@property (nonatomic, strong) CALayer *mylayer;
@property (nonatomic, strong) CALayer *redlayer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    int viewWidth = 200;
    int viewHeight = 200;

    _myView = [[UIView alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width / 2 - viewWidth / 2, [UIScreen mainScreen].bounds.size.height / 2 - viewHeight / 2, viewWidth, viewHeight)];
    _myView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_myView];
    
    
    int layerWidth = 100;
    int layerHeight = 100;
    _mylayer = [CALayer layer];
    _mylayer.backgroundColor = [UIColor blueColor].CGColor;
    _mylayer.frame = CGRectMake(viewWidth / 2 - layerWidth / 2, viewHeight / 2- layerHeight / 2, layerWidth, layerHeight);
    // 改变图层的显示顺序
//    _mylayer.zPosition = 1;
    [_myView.layer addSublayer:_mylayer];
    
    int layerWidth2 = 50;
    int layerHeight2 = 50;
    _redlayer = [CALayer layer];
    _redlayer.backgroundColor = [UIColor redColor].CGColor;
    _redlayer.frame = CGRectMake(viewWidth / 2 - layerWidth2 / 2, viewHeight / 2- layerHeight2 / 2, layerWidth2, layerHeight2);
    
    [_myView.layer addSublayer:_redlayer];
    
    
}

//- (void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    [super touchesBegan:touches withEvent:event];
//    // get touch position from myView
//    CGPoint point = [[touches anyObject] locationInView:self.view];
//    // converted to the coordinate system of layer
//    point = [self.mylayer convertPoint:point fromLayer:self.view.layer];
//    if ([self.mylayer containsPoint:point]) {
//        point = [self.redlayer convertPoint:point fromLayer:self.mylayer];
//        if ([self.redlayer containsPoint:point]) {
//            UIAlertController *cnotroller = [UIAlertController alertControllerWithTitle:@"in"
//                                                                                message:@"shi"
//                                                                         preferredStyle:UIAlertControllerStyleAlert];
//            UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
//                                                                  handler:^(UIAlertAction * action) {}];
//            [cnotroller addAction:defaultAction];
//            [self presentViewController:cnotroller animated:YES completion:nil];
//        } else {
//            UIAlertController *cnotroller = [UIAlertController alertControllerWithTitle:@"out"
//                                                                                message:@"no"
//                                                                         preferredStyle:UIAlertControllerStyleAlert];
//            UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleDefault
//                                                                  handler:^(UIAlertAction * action) {}];
//            [cnotroller addAction:defaultAction];
//            [self presentViewController:cnotroller animated:YES completion:nil];
//        }
//        
//    }
//    NSLog(@"touch");
//}

/** 使用hitTest判断被点击的图层*/
- (void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [super touchesBegan:touches withEvent:event];
    // get touch position from myView
    CGPoint point = [[touches anyObject] locationInView:self.myView];
    // get layer using hitTest
    CALayer *tempLayer = [self.mylayer hitTest:point];
    if (self.mylayer == tempLayer) {
        UIAlertController *cnotroller = [UIAlertController alertControllerWithTitle:@"in"
                                                                            message:@"shi"
                                                                     preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                              handler:^(UIAlertAction * action) {}];
        [cnotroller addAction:defaultAction];
        [self presentViewController:cnotroller animated:YES completion:nil];
        
        
    } else {
        UIAlertController *cnotroller = [UIAlertController alertControllerWithTitle:@"out"
                                                                            message:@"no"
                                                                     preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleDefault
                                                              handler:^(UIAlertAction * action) {}];
        [cnotroller addAction:defaultAction];
        [self presentViewController:cnotroller animated:YES completion:nil];
    }
    NSLog(@"touch");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
