//
//  RainView.m
//  CAEmitterLayerView
//
//  Created by YouXianMing on 15/5/14.
//  Copyright (c) 2015年 Devin. All rights reserved.
//

#import "RainView.h"

@implementation RainView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        // 初始化设置
        [self setup];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)setup {
    self.emitterLayer.masksToBounds   = YES;
    self.emitterLayer.emitterShape    = kCAEmitterLayerLine;
    self.emitterLayer.emitterMode     = kCAEmitterLayerSurface;
    self.emitterLayer.emitterSize     = self.frame.size;
    self.emitterLayer.emitterPosition = CGPointMake(self.bounds.size.width / 2.f, 0);
}

- (void)show {
    // 配置
    CAEmitterCell *rainflake  = [CAEmitterCell emitterCell];
    rainflake.birthRate       = 80;
    rainflake.speed           = 1;
    rainflake.velocity        = 10.f;
    rainflake.velocityRange   = 10.f;
    rainflake.yAcceleration   = 500.f;
    rainflake.alphaRange = 0.4;
    rainflake.contents        = (__bridge id)([UIImage imageNamed:@"cleanWhiteRain"].CGImage);
    rainflake.color           = [UIColor whiteColor].CGColor;
    rainflake.lifetime        = 50;
    rainflake.scale           = 0.2f;
    rainflake.scaleRange      = 0.f;
    
    // 添加动画
    self.emitterLayer.emitterCells = @[rainflake];
}

@end
