//
//  LeftViewController.h
//  ProjectManage
//
//  Created by zzlmilk on 14-6-2.
//  Copyright (c) 2014年 zzlmilk. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RESideMenu.h"

@interface LeftViewController : UIViewController<UITableViewDataSource, UITableViewDelegate, RESideMenuDelegate>

@property(nonatomic,strong)UITableView *tableView;


@end
