//
//  ProjectDetailViewController.h
//  ProjectManage
//
//  Created by 单好坤 on 14-6-4.
//  Copyright (c) 2014年 zzlmilk. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProjectDetailViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>


@property(nonatomic,strong)IBOutlet UITableView *projectDetailTableView;

@property(nonatomic,strong) NSMutableArray *taskLists;



@end
