//
//  ContentTableViewCell.m
//  ProjectManage
//
//  Created by 单好坤 on 14-6-6.
//  Copyright (c) 2014年 zzlmilk. All rights reserved.
//

#import "ContentTableViewCell.h"
#import "ContentViewCell.h"

@implementation ContentTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
           }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
    self.cellTableView.delegate = self;
    self.cellTableView.dataSource = self;
    self.cellTableView.scrollEnabled =NO;
    self.cellTableView.backgroundColor = [UIColor clearColor];
    
    
    
}

-(void)setTaskList:(TaskList *)taskList{
    
    _taskList = taskList;
    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)sectionIndex
{
    
       return _taskList.tasks.count +1 ;
}






- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    long row = indexPath.row;
    if (row == 0 ) {
        static NSString *contentViewCellID = @"contentViewCellID";
        UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:contentViewCellID];
        cell.textLabel.text = _taskList.taskListName;
        return cell;
    }
    
    else{
       
        
        static NSString *cellID = @"contentViewCell";
        ContentViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
        NSLog(@"%@",[[[_taskList tasks] objectAtIndex:indexPath.row-1] name]);
        cell.task = [_taskList.tasks objectAtIndex:indexPath.row-1];
    
        return cell;
    }
    
    
}




- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
