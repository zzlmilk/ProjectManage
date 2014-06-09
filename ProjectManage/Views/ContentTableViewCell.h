//
//  ContentTableViewCell.h
//  ProjectManage
//
//  Created by 单好坤 on 14-6-6.
//  Copyright (c) 2014年 zzlmilk. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TaskList.h"

@interface ContentTableViewCell : UITableViewCell<UITableViewDataSource,UITableViewDelegate>



@property(nonatomic,strong)IBOutlet UITableView *cellTableView;
@property(nonatomic,strong)TaskList *taskList;


@end
