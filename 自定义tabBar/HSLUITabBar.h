//
//  HSLUITabBar.h
//  自定义tabBar
//
//  Created by 123 on 2017/6/5.
//  Copyright © 2017年 123. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^YZTabBarBlock)();
@interface HSLUITabBar : UITabBar
@property (nonatomic, copy) YZTabBarBlock block;
@end
