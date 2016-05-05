//
//  HazeView.m
//  SnowAndRain
//
//  Created by Harly on 16/3/18.
//  Copyright © 2016年 Devin. All rights reserved.
//

#import "HazeView.h"

@implementation HazeView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        // 初始化设置
        [self setup];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)setup {
    self.emitterLayer.masksToBounds = YES;
    self.emitterLayer.emitterShape = kCAEmitterLayerCircle;
    self.emitterLayer.emitterMode = kCAEmitterLayerSurface;
    self.emitterLayer.emitterSize = self.frame.size;
    self.emitterLayer.emitterPosition = CGPointMake(0, self.center.y / 2);
}

- (void)show {
    // 配置
    CAEmitterCell *rainflake = [CAEmitterCell emitterCell];
    rainflake.birthRate = 120;
    rainflake.speed = 0.1;
    rainflake.velocity = 10.f;
    rainflake.velocityRange = 10.f;
    rainflake.xAcceleration = 10;
    rainflake.yAcceleration = 1;
    rainflake.alphaRange = 0.1;
    rainflake.contents = (__bridge id)([UIImage imageNamed:@"hazePoint"].CGImage);
    rainflake.color = [UIColor whiteColor].CGColor;
    rainflake.lifetime = 50;
    rainflake.scale = 0.8;
    rainflake.scaleRange = 0.5f;

    // 添加动画
    self.emitterLayer.emitterCells = @[ rainflake ];
}

@end
