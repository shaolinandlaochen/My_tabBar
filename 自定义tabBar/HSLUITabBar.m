//
//  HSLUITabBar.m
//  自定义tabBar
//
//  Created by 123 on 2017/6/5.
//  Copyright © 2017年 123. All rights reserved.
//

#import "HSLUITabBar.h"
@interface HSLUITabBar ()

@property (nonatomic ,weak) UIButton *plusButton;

@end
@implementation HSLUITabBar

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
//懒加载
- (UIButton *)plusButton
{
if (!_plusButton) {
UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
[button setImage:[UIImage imageNamed:@"1"] forState:UIControlStateNormal];
[button sizeToFit];
[button addTarget:self action:@selector(plusButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:button];
    _plusButton = button;
}
    return _plusButton;
}

//重新布局
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    NSInteger count = self.items.count;
    CGFloat bunW = self.frame.size.width/(count+1);
    CGFloat bunX = 0;
    NSInteger i = 0;
    for (UIView *tabBarButton in self.subviews) {
        if ([tabBarButton isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            
            if (i == 2) {
                i++;
            }
            bunX = i*bunW;
            tabBarButton.frame = CGRectMake(bunX, 0, bunW, self.frame.size.height);
            
            i++;
            
        }
    }
    self.plusButton.center = CGPointMake(self.frame.size.width*0.5, self.frame.size.height*.4);
}

- (void)plusButtonAction
{
    if (self.block) {
        self.block();
    }
    
}

@end
