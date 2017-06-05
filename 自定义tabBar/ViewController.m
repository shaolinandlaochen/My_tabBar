//
//  ViewController.m
//  自定义tabBar
//
//  Created by 123 on 2017/6/5.
//  Copyright © 2017年 123. All rights reserved.
//

#import "ViewController.h"
#import "ONE.h"
#import "TWO.h"
#import "THREE.h"
#import "FOUR.h"
#import "HSLUITabBar.h"
@interface ViewController ()

@end

@implementation ViewController
- (void)viewWillAppear:(BOOL)animated
{
    //tabbar背景色
    [[UITabBar appearance] setBarTintColor:[UIColor whiteColor]];
    //    [UITabBar appearance].translucent = YES;//半透明效果
    //字体设置
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                                       [UIColor lightGrayColor], NSForegroundColorAttributeName,
                                                       nil] forState:UIControlStateNormal];
    
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                                       [UIColor blueColor], NSForegroundColorAttributeName,
                                                       nil] forState:UIControlStateSelected];
}

- (void)viewDidLoad {
    [super viewDidLoad];
   // self.view.backgroundColor=[[UIColor redColor]colorWithAlphaComponent:0.5];
    [self addChildViewController:[[ONE alloc] init] title:@"消息" image:@"1" selectedImage:@"1"];
    [self addChildViewController:[[TWO alloc] init] title:@"联系人" image:@"1" selectedImage:@"1"];
    [self addChildViewController:[[THREE alloc] init] title:@"动态" image:@"1" selectedImage:@"1"];
    [self addChildViewController:[[FOUR alloc] init] title:@"动态" image:@"1" selectedImage:@"1"];
    [self setTbabar];
    
    // Do any additional setup after loading the view.
}
-(void)setTbabar{
    HSLUITabBar *tabBar=[[HSLUITabBar alloc]init];
    tabBar.block=^{
        NSLog(@"ssssssssss");
    };
    [self setValue:tabBar forKeyPath:@"tabBar"];
}
- (void)addChildViewController:(UIViewController *)childController title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage
{
    UINavigationController *navC = [[UINavigationController alloc] initWithRootViewController:childController];
    navC.tabBarItem.title = title;
    UIImage *timage = [[UIImage imageNamed:image] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    navC.tabBarItem.image = timage;
    navC.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [self addChildViewController:navC];
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
