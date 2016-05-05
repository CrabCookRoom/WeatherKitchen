//
//  CAEmitterLayerView.h
//  CAEmitterLayerView
//
//  Created by YouXianMing on 15/5/14.
//  Copyright (c) 2015年 Devin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CAEmitterLayerView : UIView


/**
 *  模仿setter.getter方法
 */
- (void)setEmitterLayer:(CAEmitterLayer *)layer;
- (CAEmitterLayer *)emitterLayer;


/**
 *  显示出当前view
 */
- (void)show;


/**
 *  隐藏当前view
 */
- (void)hide;


@end
