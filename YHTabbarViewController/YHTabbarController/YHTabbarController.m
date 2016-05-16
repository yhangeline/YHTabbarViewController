//
//  YHTabbarController.m
//  YHTabbarViewController
//
//  Created by yh on 16/5/16.
//  Copyright © 2016年 yh. All rights reserved.
//

#import "YHTabbarController.h"
#import "YHTabar.h"
#import "YHTabbarItem.h"

@interface YHTabbarController ()<YHTabbarDelegate>

@property (nonatomic, strong) YHTabar *yhTabbar;

@end

@implementation YHTabbarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.tabBar addSubview:({
        YHTabar *tabBar = [[YHTabar alloc] init];
        tabBar.frame     = self.tabBar.bounds;
        tabBar.delegate = self;
        self.yhTabbar = tabBar;
    })];
}

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    
    [self removeOriginControls];
}

- (void)removeOriginControls {
    
    [self.tabBar.subviews enumerateObjectsWithOptions:NSEnumerationConcurrent usingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        
        if ([obj isKindOfClass:[UIControl class]]) {
            
            [obj removeFromSuperview];
        }
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setViewControllers:(NSArray<__kindof UIViewController *> *)viewControllers
{
//    [super setViewControllers:viewControllers];
    
    
    self.yhTabbar.badgeTitleFont         = self.badgeTitleFont;
    self.yhTabbar.itemTitleFont          = self.itemTitleFont;
    self.yhTabbar.itemTitleColor         = self.itemTitleColor;
    self.yhTabbar.selectedItemTitleColor = self.selectedItemTitleColor;
    self.yhTabbar.tabBarItemCount = viewControllers.count;
    
    [viewControllers enumerateObjectsUsingBlock:^(__kindof UIViewController * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        UIImage *selectImage = obj.tabBarItem.selectedImage;
        obj.tabBarItem.selectedImage = [selectImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        
        [self addChildViewController:obj];
        
        [self.yhTabbar addTabBarItem:obj.tabBarItem];
    }];
    
}

- (void)TabbarItemClick:(NSInteger)index
{
    self.selectedIndex = index;
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
