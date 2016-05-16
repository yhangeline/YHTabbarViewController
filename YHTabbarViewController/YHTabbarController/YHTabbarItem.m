//
//  YHTabbarItem.m
//  YHTabbarViewController
//
//  Created by yh on 16/5/16.
//  Copyright © 2016年 yh. All rights reserved.
//

#import "YHTabbarItem.h"

@implementation YHTabbarItem
{
    UILabel *_BadgeView;

}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.imageView.contentMode = UIViewContentModeCenter;
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        _BadgeView = [[UILabel alloc] init];
        _BadgeView.backgroundColor = [UIColor redColor];
        _BadgeView.textAlignment = NSTextAlignmentCenter;
        _BadgeView.textColor = [UIColor whiteColor];
        _BadgeView.font = [UIFont systemFontOfSize:12];
        [self addSubview:_BadgeView];
    }
    return self;
}

- (void)setItemTitleFont:(UIFont *)itemTitleFont {
    
    _itemTitleFont = itemTitleFont;
    
    if (itemTitleFont) {
        self.titleLabel.font = itemTitleFont;
    }
    else
    {
        self.titleLabel.font = [UIFont systemFontOfSize:12];
    }
    
    
}

- (void)setItemTitleColor:(UIColor *)itemTitleColor {
    
    _itemTitleColor = itemTitleColor;
    
    if (itemTitleColor) {
        [self setTitleColor:itemTitleColor forState:UIControlStateNormal];
    }
    else
    {
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }
    
}

- (void)setSelectedItemTitleColor:(UIColor *)selectedItemTitleColor {
    
    _selectedItemTitleColor = selectedItemTitleColor;
    
    if (selectedItemTitleColor) {
        [self setTitleColor:selectedItemTitleColor forState:UIControlStateSelected];
    }
    else
    {
        [self setTitleColor:[UIColor blueColor] forState:UIControlStateSelected];
    }
}


- (void)setTabBarItem:(UITabBarItem *)tabBarItem {
    
    _tabBarItem = tabBarItem;

    [tabBarItem addObserver:self forKeyPath:@"badgeValue" options:0 context:nil];
    [tabBarItem addObserver:self forKeyPath:@"title" options:0 context:nil];
    [tabBarItem addObserver:self forKeyPath:@"image" options:0 context:nil];
    [tabBarItem addObserver:self forKeyPath:@"selectedImage" options:0 context:nil];
    
    [self observeValueForKeyPath:nil ofObject:nil change:nil context:nil];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    
    [self setTitle:self.tabBarItem.title forState:UIControlStateNormal];
    [self setImage:self.tabBarItem.image forState:UIControlStateNormal];
    [self setImage:self.tabBarItem.selectedImage forState:UIControlStateSelected];
    
    _BadgeView.hidden = !(BOOL)self.tabBarItem.badgeValue;
    
    if (self.tabBarItem.badgeValue) {
        
        _BadgeView.text = self.tabBarItem.badgeValue;
        
        CGRect frame = _BadgeView.frame;
        
        if (self.tabBarItem.badgeValue.length > 0) {
            
            CGFloat badgeW = 20;
            CGFloat badgeH = 20;
            
            CGSize titleSize = [self.tabBarItem.badgeValue sizeWithAttributes:[NSDictionary dictionaryWithObjectsAndKeys:self.badgeTitleFont, NSFontAttributeName, nil]];
            frame.size.width = MAX(badgeW, titleSize.width + 10);
            frame.size.height = badgeH;
            
        } else {
            
            frame.size.width = 12.0f;
            frame.size.height = frame.size.width;
        }
        
        frame.origin.x = 58.0f * ([UIScreen mainScreen].bounds.size.width / self.tabBarItemCount) / 375.0f * 4.0f;
        frame.origin.y = 2.0f;
        _BadgeView.layer.masksToBounds = YES;
        _BadgeView.layer.cornerRadius = frame.size.width/2.0;
        _BadgeView.frame = frame;
    }

    
}

#pragma mark - Reset TabBarItem

- (CGRect)imageRectForContentRect:(CGRect)contentRect {
    
    CGFloat imageX = 0.f;
    CGFloat imageY = 0.f;
    CGFloat imageW = contentRect.size.width;
    CGFloat imageH = contentRect.size.height * 0.7;
    
    return CGRectMake(imageX, imageY, imageW, imageH);
}

- (CGRect)titleRectForContentRect:(CGRect)contentRect {
    
    CGFloat titleX = 0.f;
    CGFloat titleW = contentRect.size.width;
    CGFloat titleY = contentRect.size.height * 0.7;
    CGFloat titleH = contentRect.size.height - titleY;
    
    return CGRectMake(titleX, titleY, titleW, titleH);
}

@end
