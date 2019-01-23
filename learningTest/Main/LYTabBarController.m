//
//  LYTabBarController.m
//  LLRiseTabBarDemo
//
//  Created by LianLeven on 15/10/21.
//  Copyright © 2015年 lichangwen. All rights reserved.
//

#import "LYTabBarController.h"
#import "BasicVC.h"
#import "WIFIBlueToothVC.h"
#import "OtherVC.h"

#import "UIImage+LYColor.h"
#import "UIButton+LYButton.h"

#define tabSelectedColor [UIColor colorWithRed:0.988f green:0.851f blue:0.325f alpha:1.00f]
#define tabNormalColor [UIColor lightGrayColor]
@implementation LYTabBarController
- (void)viewDidLoad{
    [super viewDidLoad];
    [self setupViewControllers];
    [self configureStyle];
}
- (void)configureStyle{
    
    //去掉上部的黑色线条，
    //如果加上黑色线条的话可以这样。view自定义高度为1，宽度为tabBar的宽度 [tabbarController.tabBar addSubview:view];
    [[UITabBar appearance] setBackgroundImage:[UIImage imageWithLYColor:[UIColor clearColor]]];
    
    [[UITabBar appearance] setShadowImage:[UIImage new]];
    UIView *topLineView = [[UIView alloc] init];
    topLineView.frame = CGRectMake(0, 0, CGRectGetWidth(self.tabBar.bounds), 1);
    topLineView.backgroundColor = [UIColor colorWithWhite:0.966 alpha:1.000];
    [self.tabBar addSubview:topLineView];
    self.tabBar.translucent = NO;//不透明
}
- (void)setupViewControllers{
    
    UINavigationController *homeVC = [self navigationControllerWithController:[BasicVC class]
                                                                  tabBarTitle:@"Basic"
                                                                  normalImage:[UIImage imageNamed:@"home_normal"]
                                                                selectedImage:[UIImage imageNamed:@"home_highlight"]];
    UINavigationController *message = [self navigationControllerWithController:[OtherVC class]
                                                                    tabBarTitle:@"Others"
                                                                   normalImage:[UIImage imageNamed:@"message_normal"]
                                                                 selectedImage:[UIImage imageNamed:@"message_highlight"]];
    
//    UINavigationController *sameCity = [self navigationControllerWithController:[AudioAndVideoVC class]
//                                                                    tabBarTitle:@"Media"
//                                                                    normalImage:[UIImage imageNamed:@"mycity_normal"]
//                                                                  selectedImage:[UIImage imageNamed:@"mycity_highlight"]];
//
    UINavigationController *mine = [self navigationControllerWithController:[WIFIBlueToothVC class]
                                                                   tabBarTitle:@"SmartHome"
                                                                normalImage:[UIImage imageNamed:@"account_normal"]
                                                              selectedImage:[UIImage imageNamed:@"account_highlight"]];
    
    /**
     *  设置tabbar的字体颜色
     */
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:tabNormalColor, NSForegroundColorAttributeName, nil] forState:UIControlStateNormal];
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:tabSelectedColor, NSForegroundColorAttributeName, nil] forState:UIControlStateSelected];
    
    self.viewControllers = @[homeVC,message,mine];
    
    
}
- (UINavigationController *)navigationControllerWithController:(Class)controller tabBarTitle:(NSString *)tabBarTitle normalImage:(UIImage *)normalImage selectedImage:(UIImage *)selectedImage{
    UIViewController *vc = [[controller alloc] init];;
    
    UITabBarItem *item = [[UITabBarItem alloc]
                          initWithTitle:tabBarTitle
                          image:normalImage
                          selectedImage:selectedImage];
    vc.tabBarItem = item;
    vc.title = tabBarTitle;
    item.image = [item.image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    item.selectedImage = [item.selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
    return nav;
}



@end
