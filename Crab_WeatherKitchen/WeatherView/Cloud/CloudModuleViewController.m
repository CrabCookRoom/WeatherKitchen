//
//  CloudModuleViewController.m
//  SnowAndRain
//
//  Created by Harly on 16/3/21.
//  Copyright © 2016年 Devin. All rights reserved.
//

#import "CloudModuleViewController.h"

@interface CloudModuleViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *cloudyBg;
@property (weak, nonatomic) IBOutlet UIImageView *cloudElementView;

@end

@implementation CloudModuleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    CABasicAnimation *animation  = [CABasicAnimation animationWithKeyPath:@"position"];
    CGPoint toPoint = self.cloudyBg.layer.position;
    toPoint.x += -500;
    toPoint.y += 50;
    animation.toValue = [NSValue valueWithCGPoint:toPoint];
    animation.duration = 60;
    animation.autoreverses = YES;
    animation.repeatCount = MAXFLOAT;
    [self.cloudyBg.layer addAnimation:animation forKey:nil];
    
    CABasicAnimation *cloudAnimation  = [CABasicAnimation animationWithKeyPath:@"position"];
    CGPoint toCloudPoint = self.cloudyBg.layer.position;
    toCloudPoint.x += -2000;
    toCloudPoint.y += 0;
    cloudAnimation.toValue = [NSValue valueWithCGPoint:toPoint];
    cloudAnimation.duration = 60;
    cloudAnimation.autoreverses = YES;
    cloudAnimation.repeatCount = MAXFLOAT;
    [self.cloudElementView.layer addAnimation:cloudAnimation forKey:nil];
    
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
