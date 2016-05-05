//
//  WeatherViewManager.m
//  SnowAndRain
//
//  Created by Harly on 16/3/21.
//  Copyright © 2016年 Devin. All rights reserved.
//

#define WS(weakSelf) __weak __typeof(&*self) weakSelf = self;

#import "CloudModuleViewController.h"
#import "HazeModuleViewController.h"
#import "RainModuleViewController.h"
#import "SnowModuleViewController.h"
#import "SunnyModuleViewController.h"
#import "WeatherViewManager.h"

@interface WeatherViewManager ()
@property(nonatomic, strong) UIViewController *currentViewController;

@property(nonatomic, strong) UIViewController *rainViewController;
@property(nonatomic, strong) UIViewController *cloudViewController;
@property(nonatomic, strong) UIViewController *hazeViewController;
@property(nonatomic, strong) UIViewController *sunnyViewController;
@property(nonatomic, strong) UIViewController *snowViewController;
@end

@implementation WeatherViewManager

- (void)viewDidLoad {
  [super viewDidLoad];

  self.rainViewController = [[RainModuleViewController alloc]
      initWithNibName:@"RainModuleViewController"
               bundle:nil];
  [self addChildViewController:self.rainViewController];

  [self.view addSubview:self.rainViewController.view];

  //    [self.rainViewController.view mas_makeConstraints:^(MASConstraintMaker
  //    *make) {
  //      make.top.equalTo(weakSelf.view);
  //      make.left.equalTo(weakSelf.view).with.offset(-100);
  //      make.bottom.equalTo(weakSelf.view).with.offset(0);
  //      make.right.equalTo(weakSelf.view).with.offset(-100);
  //    }];

  [self.rainViewController didMoveToParentViewController:self];

  self.currentViewController = self.rainViewController;

  self.cloudViewController = [[CloudModuleViewController alloc]
      initWithNibName:@"CloudModuleViewController"
               bundle:nil];
  [self addChildViewController:self.cloudViewController];

  self.hazeViewController = [[HazeModuleViewController alloc]
      initWithNibName:@"HazeModuleViewController"
               bundle:nil];
  [self addChildViewController:self.hazeViewController];

  self.sunnyViewController = [[SunnyModuleViewController alloc]
      initWithNibName:@"SunnyModuleViewController"
               bundle:nil];
  [self addChildViewController:self.sunnyViewController];

  self.snowViewController = [[SnowModuleViewController alloc]
      initWithNibName:@"SnowModuleViewController"
               bundle:nil];
  [self addChildViewController:self.snowViewController];

  //    [self.cloudViewController.view mas_makeConstraints:^(MASConstraintMaker
  //    *make) {
  //      make.top.left.bottom.right.equalTo(weakSelf.view);
  //    }];

  // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated {
  [super viewDidAppear:animated];
  self.rainViewController.view.frame =
      CGRectMake(0, 0, CGRectGetWidth(self.view.bounds),
                 CGRectGetHeight(self.view.bounds)-150);
}

- (IBAction)sunnyTapped:(UIBarButtonItem *)sender {
  [self transferWeather:self.sunnyViewController];
}

- (IBAction)rainTapped:(UIBarButtonItem *)sender {
  [self transferWeather:self.rainViewController];
}

- (IBAction)cloudTapped:(UIBarButtonItem *)sender {
  [self transferWeather:self.cloudViewController];
}

- (IBAction)hazeTapped:(UIBarButtonItem *)sender {
  [self transferWeather:self.hazeViewController];
}

- (BOOL)showWeatherOfType:(WeatherType)type {
  switch (type) {
  case Sunny:
    [self transferWeather:self.sunnyViewController];
    break;
  case Cloudy:
    [self transferWeather:self.cloudViewController];
    break;
  case Rainy:
    [self transferWeather:self.rainViewController];
    break;
  case Huze:
    [self transferWeather:self.hazeViewController];
    break;
  case Snow:
    [self transferWeather:self.snowViewController];
    break;
  default:
    break;
  }

  return true;
}

- (void)transferWeather:(UIViewController *)vc {
  if (self.currentViewController == vc)
    return;

  [self setFrameForVc:vc];
  [self transitionFromViewController:self.currentViewController
      toViewController:vc
      duration:0.2
      options:UIViewAnimationOptionTransitionCrossDissolve
      animations:^{
      }
      completion:^(BOOL finished){

      }];
  self.currentViewController = vc;
}

- (void)setFrameForVc:(UIViewController *)vc {
  if (vc == self.rainViewController)
    return;
  [vc.view setFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.bounds),
                               CGRectGetHeight(self.view.bounds)-44)];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little
preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
