//
//  TestViewController.m
//  YHTabbarViewController
//
//  Created by yh on 16/5/16.
//  Copyright © 2016年 yh. All rights reserved.
//

#import "TestViewController.h"

@interface TestViewController ()

@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIButton *add = [UIButton buttonWithType:UIButtonTypeContactAdd];
    add.frame = CGRectMake(100, 100, 100, 100);
    [add addTarget:self action:@selector(btnDown) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:add];
}

- (void)btnDown
{
    
    UIViewController *someVC = [[UIViewController alloc] init];
    someVC.title = @"tabBar hide ok?";
    someVC.view.backgroundColor = [UIColor greenColor];
    someVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:someVC animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    self.tabBarItem.badgeValue = nil;
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
