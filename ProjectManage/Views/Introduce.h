//
//  Introduce.h
//  ProjectManage
//
//  Created by 单好坤 on 14-6-9.
//  Copyright (c) 2014年 zzlmilk. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Introduce : UIView
{
        BOOL buttonIsSelected;
}

@property(nonatomic,strong) IBOutlet UILabel *viewTitleLabel;
@property (nonatomic,strong)IBOutlet UIButton *checkBoxButton;
@property(nonatomic,strong) IBOutlet UILabel *contentLabel;

-(IBAction)buttonSelect:(id)sender;

@end
