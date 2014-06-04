//
//  RootViewController.m
//  ProjectManage
//
//  Created by zzlmilk on 14-6-2.
//  Copyright (c) 2014年 zzlmilk. All rights reserved.
//

#import "RootViewController.h"


@implementation RootViewController

- (void)awakeFromNib
{
    self.menuPreferredStatusBarStyle = UIStatusBarStyleLightContent;
    self.contentViewShadowColor = [UIColor blackColor];
    self.contentViewShadowOffset = CGSizeMake(0, 0);
    self.contentViewShadowOpacity = 0.6;
    self.contentViewShadowRadius = 12;
    self.contentViewShadowEnabled = YES;
    
    self.contentViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"contentViewController"];
    
    self.leftMenuViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"leftViewController"];
    
     self.backgroundImage = [UIImage imageNamed:@"Stars"];
    self.delegate = self;


}

@end
