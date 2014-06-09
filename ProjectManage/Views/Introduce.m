//
//  Introduce.m
//  ProjectManage
//
//  Created by 单好坤 on 14-6-9.
//  Copyright (c) 2014年 zzlmilk. All rights reserved.
//

#import "Introduce.h"

@implementation Introduce

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        
        
        self.backgroundColor = [UIColor yellowColor];
    }
    return self;
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


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
