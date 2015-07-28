//
//  BaseViewController.m
//  Base64
//
//  Created by apple on 15/7/28.
//  Copyright (c) 2015年 CloudRoom. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController
#pragma mark - life cycle
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setupUIScreenForBaseViewController];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - private methods

- (void)setupUIScreenForBaseViewController
{
    if ([self respondsToSelector:@selector(edgesForExtendedLayout)] == YES)
    {
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
}

@end
