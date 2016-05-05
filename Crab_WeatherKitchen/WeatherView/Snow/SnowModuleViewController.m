//
//  SnowModuleViewController.m
//  SnowAndRain
//
//  Created by Harly on 16/3/22.
//  Copyright © 2016年 Devin. All rights reserved.
//

#import "SnowModuleViewController.h"

@interface SnowModuleViewController ()
@property (weak, nonatomic) IBOutlet UIView *snowBgView;

@property(nonatomic, strong) CAEmitterLayer *emitterLayer;

@end

@implementation SnowModuleViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view from its nib.
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [self snowGround];
    [self snowyDay];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark
#pragma mark weather
- (void)snowGround
{
    CAEmitterLayer *snowEmitter = [CAEmitterLayer layer];
    snowEmitter.emitterPosition = CGPointMake(self.view.bounds.size.width / 2, self.view.layer.frame.size.height);
    snowEmitter.emitterSize = CGSizeMake(self.view.bounds.size.width, 0);
    snowEmitter.emitterMode = kCAEmitterLayerOutline;
    snowEmitter.emitterShape = kCAEmitterLayerLine;
    
    //雪花飘落
    CAEmitterCell *snowFlake = [CAEmitterCell emitterCell];
    snowFlake.birthRate = 80;            //每一秒产生的粒子个数
    snowFlake.lifetime = 80;              //粒子存在时间
    snowFlake.velocity = 5;               //速度
    snowFlake.velocityRange = 5;          //速度
    snowFlake.yAcceleration = 1;          //y方向上的加速度
    snowFlake.emissionRange = 0.5 * M_PI; //发射范围
    snowFlake.spinRange = 0.25 * M_PI;    //自旋范围
    snowFlake.scale = 0.2;
    snowFlake.scaleRange = 0.3;
    snowFlake.alphaSpeed = 0.3;
    snowFlake.alphaRange = 1.4;
    snowFlake.contents = (id)[[UIImage imageNamed:@"smow"] CGImage];
    //snowFlake.color = [[UIColor colorWithRed:0.600 green:0.658 blue:0.743 alpha:1.000] CGColor];
    
    snowEmitter.shadowOpacity = 1.0;
    snowEmitter.shadowRadius = 0.0;
    snowEmitter.shadowOffset = CGSizeMake(0.0, 1.0);
    snowEmitter.shadowColor = [UIColor whiteColor].CGColor;
    
    snowEmitter.emitterCells = [NSArray arrayWithObject:snowFlake];
    [self.snowBgView.layer insertSublayer:snowEmitter atIndex:100];
}

- (void)snowyDay
{
    CAEmitterLayer *snowEmitter = [CAEmitterLayer layer];
    snowEmitter.emitterPosition = CGPointMake(self.view.bounds.size.width / 2, -30);
    snowEmitter.emitterSize = CGSizeMake(self.view.bounds.size.width * 2, 0);
    snowEmitter.emitterMode = kCAEmitterLayerOutline;
    snowEmitter.emitterShape = kCAEmitterLayerLine;
    
    //雪花飘落
    CAEmitterCell *snowFlake = [CAEmitterCell emitterCell];
    snowFlake.birthRate = 20;             //每一秒产生的粒子个数
    snowFlake.lifetime = 120.0;           //粒子存在时间
    snowFlake.velocity = 5;               //速度
    snowFlake.velocityRange = 5;          //速度
    snowFlake.yAcceleration = 2;          //y方向上的加速度
    snowFlake.emissionRange = 0.5 * M_PI; //发射范围
    snowFlake.spinRange = 0.25 * M_PI;    //自旋范围
    snowFlake.scale = 0.2;
    snowFlake.scaleRange = 0.3;
    snowFlake.alphaSpeed = 0.3;
    snowFlake.alphaRange = 0.5;
    snowFlake.contents = (id)[[UIImage imageNamed:@"snowSnow"] CGImage];
    //snowFlake.color = [[UIColor colorWithRed:0.600 green:0.658 blue:0.743 alpha:1.000] CGColor];
    
    //    snowFlake.scaleSpeed = -0.1;
    
    snowEmitter.shadowOpacity = 1.0;
    snowEmitter.shadowRadius = 0.0;
    snowEmitter.shadowOffset = CGSizeMake(0.0, 1.0);
    snowEmitter.shadowColor = [UIColor whiteColor].CGColor;
    
    snowEmitter.emitterCells = [NSArray arrayWithObject:snowFlake];
    [self.snowBgView.layer insertSublayer:snowEmitter atIndex:99];
    
    [self setupEmitterLayer];
    
    [self snowGround];
}

- (void)setupEmitterLayer
{
    CAEmitterLayer *emitter = [CAEmitterLayer layer];
    emitter.emitterCells = [NSArray arrayWithObjects:[self sparkCell], [self smokeCell], nil];
    emitter.emitterShape = kCAEmitterLayerPoint;
    emitter.birthRate = 0;
    
    [self.view.layer addSublayer:emitter];
    self.emitterLayer = emitter;
}

- (CAEmitterCell *)sparkCell
{
    CAEmitterCell *spark = [CAEmitterCell emitterCell];
    spark.contents = (__bridge id)[UIImage imageNamed:@"spark.png"].CGImage;
    spark.birthRate = 200;
    spark.lifetime = 3;
    spark.scale = 0.1;
    spark.scaleRange = 0.2;
    spark.emissionRange = 2 * M_PI;
    spark.velocity = 60;
    spark.velocityRange = 8;
    spark.yAcceleration = -200;
    spark.alphaRange = 0.5;
    spark.alphaSpeed = -1;
    spark.spin = 1;
    spark.spinRange = 6;
    spark.alphaRange = 0.8;
    spark.redRange = 0;
    spark.greenRange = 0;
    spark.blueRange = 0;
    [spark setName:@"sparkKey"];
    return spark;
}

- (CAEmitterCell *)smokeCell
{
    CAEmitterCell *smoke = [CAEmitterCell emitterCell];
    smoke.contents = (__bridge id)[UIImage imageNamed:@"smoke.png"].CGImage;
    smoke.birthRate = 5;
    smoke.lifetime = 20;
    smoke.scale = 0.1;
    smoke.scaleSpeed = 1;
    smoke.alphaRange = 0.5;
    smoke.alphaSpeed = -0.7;
    smoke.spin = 1;
    smoke.spinRange = 0.8;
    smoke.blueRange = 0.3;
    smoke.velocity = 10;
    smoke.yAcceleration = 100;
    [smoke setName:@"smokeKey"];
    return smoke;
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
