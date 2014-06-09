//
//  ContentViewCell.m
//  ProjectManage
//
//  Created by 单好坤 on 14-6-6.
//  Copyright (c) 2014年 zzlmilk. All rights reserved.
//

#import "ContentViewCell.h"

@implementation ContentViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
       
    }
    return self;
}


-(void)setTask:(Task *)task{
    _task = task;
    self.contentLabel.text = _task.name;
}

- (void)awakeFromNib
{
    // Initialization code
     self.contentLabel.font = [UIFont systemFontOfSize:12];

}

-(IBAction)buttonSelect:(id)sender{
    UIButton *button = (UIButton *)sender;
    if (buttonIsSelected) {
        UIImage * image = [UIImage imageNamed:@"todo-checkbox"];
        [button setImage:image forState:UIControlStateNormal];
        self.contentLabel.textColor = [UIColor blackColor];
        self.contentLabel.font = [UIFont systemFontOfSize:12];
       
    }
    else{
        UIImage * image = [UIImage imageNamed:@"todo-checkbox-completed"];
        [button setImage:image forState:UIControlStateNormal];
        self.contentLabel.textColor = [UIColor grayColor];
        self.contentLabel.font = [UIFont systemFontOfSize:10];
    }
    
     buttonIsSelected = !buttonIsSelected;
    
}



@end
