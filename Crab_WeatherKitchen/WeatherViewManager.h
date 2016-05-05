//
//  WeatherViewManager.h
//  SnowAndRain
//
//  Created by Harly on 16/3/21.
//  Copyright © 2016年 Devin. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
  Sunny = 0,
  Cloudy = 1,
  Rainy = 2,
  Huze = 3,
  Snow = 4,

} WeatherType;

@interface WeatherViewManager : UIViewController

- (BOOL)showWeatherOfType:(WeatherType)type;

@end
