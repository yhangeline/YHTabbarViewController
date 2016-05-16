//
//  YHTabar.m
//  YHTabbarViewController
//
//  Created by yh on 16/5/16.
//  Copyright © 2016年 yh. All rights reserved.
//

#import "YHTabar.h"
#import "YHTabbarItem.h"


@implementation YHTabar

- (NSMutableArray *)tabBarItems {
    
    if (_tabBarItems == nil) {
        
        _tabBarItems = [[NSMutableArray alloc] init];
    }
    return _tabBarItems;
}

- (void)addTabBarItem:(UITabBarItem *)item {
    
    YHTabbarItem *tabBarItem = [[YHTabbarItem alloc] init];
    tabBarItem.adjustsImageWhenHighlighted = NO;
    tabBarItem.badgeTitleFont         = self.badgeTitleFont;
    tabBarItem.itemTitleFont          = self.itemTitleFont;
    tabBarItem.itemTitleColor         = self.itemTitleColor;
    tabBarItem.selectedItemTitleColor = self.selectedItemTitleColor;
    
    tabBarItem.tabBarItemCount = self.tabBarItemCount;
    
    tabBarItem.tabBarItem = item;
    
    [tabBarItem addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchDown];
    
    
    
    [self.tabBarItems addObject:tabBarItem];
    
    if (self.tabBarItems.count == 1) {
        
        [self buttonClick:tabBarItem];
    }
    
    
    [self addSubview:tabBarItem];
}

- (void)buttonClick:(YHTabbarItem *)item
{
    for (YHTabbarItem *tabbarItem in self.tabBarItems) {
        if (item == tabbarItem) {
            tabbarItem.selected = YES;
        }
        else
        {
            tabbarItem.selected = NO;
        }
    }
    if ([self.delegate respondsToSelector:@selector(TabbarItemClick:)]) {
        [self.delegate TabbarItemClick:item.tag];
    }
}


- (void)layoutSubviews {
    
    [super layoutSubviews];
    
    CGFloat w = self.frame.size.width;
    CGFloat h = self.frame.size.height;

    
    for (int index = 0; index < self.tabBarItemCount; index++) {
        
        YHTabbarItem *tabBarItem = self.tabBarItems[index];
        tabBarItem.tag = index;
        CGFloat itemX = index * w/self.tabBarItemCount;
        tabBarItem.frame = CGRectMake(itemX, 0, w/self.tabBarItemCount, h);
    }
}


@end
