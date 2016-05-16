//
//  YHTabbarItem.h
//  YHTabbarViewController
//
//  Created by yh on 16/5/16.
//  Copyright © 2016年 yh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YHTabbarItem : UIButton


@property (nonatomic, strong) UITabBarItem *tabBarItem;



@property (nonatomic, assign) NSInteger tabBarItemCount;

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


@end
