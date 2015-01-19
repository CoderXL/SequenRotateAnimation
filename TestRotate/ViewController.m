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
    
    UIView *greenView;
    
    UIView *blueView;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    redView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
    redView.backgroundColor = [UIColor redColor];
    redView.center = CGPointMake(self.view.center.x-40, self.view.center.y);
    redView.layer.cornerRadius = 5;
    redView.layer.masksToBounds = YES;
    [self.view addSubview:redView];
    
    greenView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
    greenView.backgroundColor = [UIColor greenColor];
    greenView.center = CGPointMake(self.view.center.x+40, self.view.center.y);
    greenView.layer.cornerRadius = 5;
    greenView.layer.masksToBounds = YES;
    [self.view addSubview:greenView];
    
    blueView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
    blueView.backgroundColor = [UIColor blueColor];
    blueView.center = CGPointMake(self.view.center.x+120, self.view.center.y);
    blueView.layer.cornerRadius = 5;
    blueView.layer.masksToBounds = YES;
    [self.view addSubview:blueView];
    // Do any additional setup after loading the view, typically from a nib.
}

- (CAKeyframeAnimation *)createRotateAnimationWithBeginTime:(NSTimeInterval)time
{
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"transform.rotation.z"];
    
    animation.values = @[@(0),@(DEGREES_TO_RADIANS(60)),@(DEGREES_TO_RADIANS(90)),@(DEGREES_TO_RADIANS(110)),@(DEGREES_TO_RADIANS(90)),@(DEGREES_TO_RADIANS(70)),@(DEGREES_TO_RADIANS(90)),@(DEGREES_TO_RADIANS(100)),@(DEGREES_TO_RADIANS(90)),@(DEGREES_TO_RADIANS(80)),@(DEGREES_TO_RADIANS(90)),@(DEGREES_TO_RADIANS(95)),@(DEGREES_TO_RADIANS(90))];
    
    animation.keyTimes = @[@(0),@(0.5),@(0.6),@(0.64),@(0.68),@(0.72),@(0.76),@(0.8),@(0.84),@(0.88),@(0.92),@(0.98),@(1)];
    
    animation.fillMode = kCAFillModeForwards;
    
    animation.removedOnCompletion = NO;
    
    animation.beginTime = CACurrentMediaTime()+time;
    
    animation.duration = 1;
    
    return animation;
}

- (IBAction)startAnimation:(id)sender
{
    [redView.layer addAnimation:[self createRotateAnimationWithBeginTime:0] forKey:@"rotate"];
    [greenView.layer addAnimation:[self createRotateAnimationWithBeginTime:0.2] forKey:@"rotate2"];
    [blueView.layer addAnimation:[self createRotateAnimationWithBeginTime:0.4] forKey:@"rotate3"];
    
    [UIView animateWithDuration:0.5 animations:^{
        redView.center = CGPointMake(redView.center.x, redView.center.y-10);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.1 animations:^{
            redView.center = CGPointMake(redView.center.x, redView.center.y+10);
        }];
    }];
    
    [UIView animateWithDuration:0.5 delay:0.2 options:UIViewAnimationOptionBeginFromCurrentState animations:^{
        greenView.center = CGPointMake(greenView.center.x, greenView.center.y-10);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.1 animations:^{
            greenView.center = CGPointMake(greenView.center.x, greenView.center.y+10);
        }];
    }];
    
    [UIView animateWithDuration:0.5 delay:0.4 options:UIViewAnimationOptionBeginFromCurrentState animations:^{
        blueView.center = CGPointMake(blueView.center.x, blueView.center.y-10);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.1 animations:^{
            blueView.center = CGPointMake(blueView.center.x, blueView.center.y+10);
        }];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
