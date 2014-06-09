//
//  AddProjectViewController.h
//  ProjectManage
//
//  Created by 单好坤 on 14-6-4.
//  Copyright (c) 2014年 zzlmilk. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddProjectViewController : UIViewController<UITextViewDelegate>{

    UITextField *dateTextField;
    NSLocale *datelocale;
    UIDatePicker *datePicker;
    UITextView *jobContentField;
    UIButton *clearTextBtn;
}

@property (nonatomic,strong) NSString *endTime;





@end
