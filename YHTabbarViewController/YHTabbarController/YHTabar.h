//
//  YHTabar.h
//  YHTabbarViewController
//
//  Created by yh on 16/5/16.
//  Copyright © 2016年 yh. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol YHTabbarDelegate <NSObject>

- (void)TabbarItemClick:(NSInteger)index;

@end

@interface YHTabar : UIView

@property (nonatomic, assign) id<YHTabbarDelegate> delegate;

/**
 *  Tabbar item title color
 */
@property (nonatomic, strong) UIColor *itemTitleColor;

/**
 *  Tabbar selected item title color
 */
@property (nonatomic, strong) UIColor *selectedItemTitleColor;

/**
 *  Tabbar item title font
 */
@property (nonatomic, strong) UIFont *itemTitleFont;

/**
 *  Tabbar item's badge title font
 */
@property (nonatomic, strong) UIFont *badgeTitleFont;

@property (nonatomic, assign) NSInteger tabBarItemCount;

@property (nonatomic, strong) NSMutableArray *tabBarItems;

- (void)addTabBarItem:(UITabBarItem *)item;

@end
