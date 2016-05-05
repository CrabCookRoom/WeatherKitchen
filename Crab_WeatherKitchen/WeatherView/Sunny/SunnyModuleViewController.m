//
//  SunnyModuleViewController.m
//  SnowAndRain
//
//  Created by Harly on 16/3/21.
//  Copyright © 2016年 Devin. All rights reserved.
//

#import "SunnyModuleViewController.h"

@interface SunnyModuleViewController ()

@property(weak, nonatomic) IBOutlet UIImageView *sunnyBgVIew;
@property(weak, nonatomic) IBOutlet UIImageView *sunnyCloudView;
@property(weak, nonatomic) IBOutlet UIImageView *sunnyLightView;


@end

@implementation SunnyModuleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"position"];
    CGPoint toPoint = self.sunnyBgVIew.layer.position;
    toPoint.x += -200;
    animation.toValue = [NSValue valueWithCGPoint:toPoint];
    animation.duration = 60;
    animation.autoreverses = YES;
    animation.repeatCount = MAXFLOAT;
    [self.sunnyCloudView.layer addAnimation:animation forKey:nil];
    
    CABasicAnimation *rotationAnimation =
    [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"]; //"z"还可以是“x”“y”，表示沿z轴旋转
    rotationAnimation.toValue = [NSNumber numberWithFloat:( -M_PI/2)];
    // 3 is the number of 360 degree rotations
    // Make the rotation animation duration slightly less than the other animations to give it the feel
    // that it pauses at its largest scale value
    rotationAnimation.autoreverses = YES;
    rotationAnimation.duration = 10;
    rotationAnimation.repeatCount = MAXFLOAT;
    rotationAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]; //缓入缓出
    
    CABasicAnimation *scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    scaleAnimation.fromValue = [NSNumber numberWithFloat:1.0];
    scaleAnimation.toValue = [NSNumber numberWithFloat:1.5];
    scaleAnimation.duration = 5;
    scaleAnimation.repeatCount = MAXFLOAT;
    scaleAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]; //缓入缓出
    scaleAnimation.autoreverses = YES;
    
    CABasicAnimation *opacityAnimation = [CABasicAnimation animationWithKeyPath:@"opacity"];
    opacityAnimation.fromValue = [NSNumber numberWithFloat:1.0];
    opacityAnimation.toValue = [NSNumber numberWithFloat:0.5];
    opacityAnimation.duration = 5;
    opacityAnimation.repeatCount = MAXFLOAT;
    opacityAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]; //缓入缓出
    opacityAnimation.autoreverses = YES;
    
    [self.sunnyLightView.layer addAnimation:opacityAnimation forKey:nil];
    //    [self.sunnyLightView.layer addAnimation:scaleAnimation forKey:nil];
    [self.sunnyLightView.layer addAnimation:rotationAnimation forKey:nil];
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
