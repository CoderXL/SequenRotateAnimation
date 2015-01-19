//
//  ViewController.m
//  TestRotate
//
//  Created by 臧其龙 on 15/1/19.
//  Copyright (c) 2015年 臧其龙. All rights reserved.
//

#import "ViewController.h"

#define DEGREES_TO_RADIANS(angle) ((angle) / 180.0 * M_PI)

@interface ViewController ()
{
    UIView *redView;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    redView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
    redView.backgroundColor = [UIColor redColor];
    redView.center = self.view.center;
    redView.layer.cornerRadius = 5;
    redView.layer.masksToBounds = YES;
    [self.view addSubview:redView];
    // Do any additional setup after loading the view, typically from a nib.
}

- (CAKeyframeAnimation *)createRotateAnimation
{
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"transform.rotation.z"];
    
    animation.values = @[@(0),@(DEGREES_TO_RADIANS(60)),@(DEGREES_TO_RADIANS(90)),@(DEGREES_TO_RADIANS(110)),@(DEGREES_TO_RADIANS(90)),@(DEGREES_TO_RADIANS(70)),@(DEGREES_TO_RADIANS(90)),@(DEGREES_TO_RADIANS(100)),@(DEGREES_TO_RADIANS(90)),@(DEGREES_TO_RADIANS(80)),@(DEGREES_TO_RADIANS(90)),@(DEGREES_TO_RADIANS(95)),@(DEGREES_TO_RADIANS(90))];
    
    animation.keyTimes = @[@(0),@(0.5),@(0.6),@(0.64),@(0.68),@(0.72),@(0.76),@(0.8),@(0.84),@(0.88),@(0.92),@(0.98),@(1)];
    
    animation.fillMode = kCAFillModeForwards;
    
    animation.removedOnCompletion = NO;
    
    animation.duration = 1;
    
    return animation;
}

- (IBAction)startAnimation:(id)sender
{
    [redView.layer addAnimation:[self createRotateAnimation] forKey:@"rotate"];
    [UIView animateWithDuration:0.5 animations:^{
        redView.center = CGPointMake(redView.center.x, redView.center.y-10);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.1 animations:^{
            redView.center = CGPointMake(redView.center.x, redView.center.y+10);
        }];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
