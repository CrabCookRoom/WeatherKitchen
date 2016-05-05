//
//  RainModuleViewController.m
//  SnowAndRain
//
//  Created by Harly on 16/3/21.
//  Copyright © 2016年 Devin. All rights reserved.
//

#import "RainModuleViewController.h"
#import "CAEmitterLayerView.h"
@interface RainModuleViewController ()
@property (weak, nonatomic) IBOutlet CAEmitterLayerView *rainEmitterView;
@property (weak, nonatomic) IBOutlet UIImageView *rainBgView;

@end

@implementation RainModuleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.rainEmitterView show];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    CABasicAnimation *animation  = [CABasicAnimation animationWithKeyPath:@"position"];
    CGPoint toPoint = self.rainBgView.layer.position;
    toPoint.x += 200;
    animation.toValue = [NSValue valueWithCGPoint:toPoint];
    animation.duration = 30;
    animation.autoreverses = YES;
    animation.repeatCount = MAXFLOAT;
    [self.rainBgView.layer addAnimation:animation forKey:nil];
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
