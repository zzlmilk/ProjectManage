//
//  ContentViewCell.h
//  ProjectManage
//
//  Created by 单好坤 on 14-6-6.
//  Copyright (c) 2014年 zzlmilk. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "Task.h"

@interface ContentViewCell : UITableViewCell
{
    BOOL buttonIsSelected;
}


@property (nonatomic,strong)Task *task;

@property (nonatomic,strong)IBOutlet UIButton *checkBoxButton;
@property(nonatomic,strong) IBOutlet UILabel *contentLabel;

-(IBAction)buttonSelect:(id)sender;



@end
