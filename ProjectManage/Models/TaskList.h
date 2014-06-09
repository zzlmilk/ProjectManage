//
//  TaskList.h
//  ProjectManage
//
//  Created by 单好坤 on 14-6-6.
//  Copyright (c) 2014年 zzlmilk. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TaskList : NSObject

@property(nonatomic,strong)NSString *taskListName;
@property(nonatomic,strong)NSMutableArray *tasks;
@end
