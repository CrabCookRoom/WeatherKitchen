//
//  HazeModuleViewController.m
//  SnowAndRain
//
//  Created by Harly on 16/3/21.
//  Copyright © 2016年 Devin. All rights reserved.
//

#import "HazeModuleViewController.h"
#import "HazeView.h"

@interface HazeModuleViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *hazeBg;
@property (weak, nonatomic) IBOutlet CAEmitterLayerView *hazeView;


@end

@implementation HazeModuleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.hazeView show];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
