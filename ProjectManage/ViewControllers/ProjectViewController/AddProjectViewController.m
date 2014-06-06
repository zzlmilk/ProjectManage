//
//  AddProjectViewController.m
//  ProjectManage
//
//  Created by 单好坤 on 14-6-4.
//  Copyright (c) 2014年 zzlmilk. All rights reserved.
//

#import "AddProjectViewController.h"
#import "JobListViewController.h"
#import "ChoosePeopleViewController.h"

@interface AddProjectViewController ()


@end



@implementation AddProjectViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}



- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"添加新任务";
    [self.navigationController.navigationBar setBackgroundColor:[UIColor whiteColor]];
    self.view.backgroundColor = [UIColor colorWithRed:255/255.f green:255/255.f blue:255/255.f alpha:1];
    //self.view.backgroundColor = [UIColor colorWithRed:222/255.f green:222/255.f blue:222/255.f alpha:1];
    
    UIButton *playNowButton = [[UIButton alloc] initWithFrame:CGRectMake(100, 0, 23, 16)];
    playNowButton.backgroundColor = [UIColor clearColor];
    [playNowButton setBackgroundImage:[UIImage imageNamed:@"btn-checkmark-highlighted"] forState:UIControlStateNormal];
    [playNowButton addTarget:self action:@selector(barcCheckNewJob) forControlEvents:UIControlEventTouchDown];
    UIBarButtonItem *rightBarItem =[[UIBarButtonItem alloc] initWithCustomView:playNowButton];
    self.navigationItem.rightBarButtonItem = rightBarItem;

    
    jobContentField = [[UITextView alloc]init];
    jobContentField.frame = CGRectMake(0, 64, self.view.frame.size.width, 91);
    jobContentField.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    jobContentField.font = [UIFont fontWithName:@"Arial" size:16.0f];
    jobContentField.backgroundColor = [UIColor clearColor];
    jobContentField.scrollEnabled = YES;
    jobContentField.delegate = self;
    [self.view addSubview:jobContentField];
    
    UIToolbar * topView = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
    [topView setBarStyle:UIBarStyleDefault];
    UIBarButtonItem * btnSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    UIBarButtonItem * doneButton = [[UIBarButtonItem alloc] initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(dismissKeyBoard)];
    NSArray * buttonsArray = [NSArray arrayWithObjects:btnSpace, doneButton, nil];
    [topView setItems:buttonsArray];
    [jobContentField setInputAccessoryView:topView];
    
    
    UIButton *chooseJobListBtn = [UIButton buttonWithType: UIButtonTypeCustom];
    [chooseJobListBtn setFrame:CGRectMake(0, 155,self.view.frame.size.width, 45)];
    [chooseJobListBtn.layer setBorderWidth:1.0];
    [chooseJobListBtn.layer setBorderColor: [[UIColor colorWithRed:240/255.f green:240/255.f blue:240/255.f alpha:1] CGColor]];
    chooseJobListBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    chooseJobListBtn.contentEdgeInsets = UIEdgeInsetsMake(0, 11, 0, 0);
    [chooseJobListBtn setImage: [UIImage imageNamed: @"btn-menu-highlighted"] forState: UIControlStateNormal];
    [chooseJobListBtn setTitle:@"   选择任务列表" forState:UIControlStateNormal];
    [chooseJobListBtn setTitleColor:[UIColor colorWithRed:80/255.f green:80/255.f blue:80/255.f alpha:1] forState:UIControlStateNormal];
    [chooseJobListBtn addTarget:self action:@selector(chooseJobList) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:chooseJobListBtn];
    
    
    UIButton *choosePeopleListBtn = [UIButton buttonWithType: UIButtonTypeCustom];
    [choosePeopleListBtn setFrame:CGRectMake(0, 164+35,self.view.frame.size.width, 45)];
    [choosePeopleListBtn.layer setBorderWidth:1.0];
    [choosePeopleListBtn.layer setBorderColor: [[UIColor colorWithRed:240/255.f green:240/255.f blue:240/255.f alpha:1] CGColor]];
    choosePeopleListBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    choosePeopleListBtn.contentEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
    [choosePeopleListBtn setImage: [UIImage imageNamed: @"icon-menu-me"] forState: UIControlStateNormal];
    [choosePeopleListBtn setTitle:@"  选择任务负责人" forState:UIControlStateNormal];
    [choosePeopleListBtn setTitleColor:[UIColor colorWithRed:80/255.f green:80/255.f blue:80/255.f alpha:1] forState:UIControlStateNormal];
    [choosePeopleListBtn setBackgroundColor:[UIColor clearColor]];
    [choosePeopleListBtn addTarget:self action:@selector(choosePeopleList) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:choosePeopleListBtn];
    
    
    
    UIButton *chooseTimeListBtn = [UIButton buttonWithType: UIButtonTypeCustom];
    [chooseTimeListBtn setFrame:CGRectMake(0, 174+69,self.view.frame.size.width, 45)];
    [chooseTimeListBtn.layer setBorderWidth:1.0];
    [chooseTimeListBtn.layer setBorderColor: [[UIColor colorWithRed:240/255.f green:240/255.f blue:240/255.f alpha:1] CGColor]];
    _endTime = @" ";
    chooseTimeListBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    chooseTimeListBtn.contentEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
    [chooseTimeListBtn setImage: [UIImage imageNamed: @"icon-menu-progress"] forState: UIControlStateNormal];
    [chooseTimeListBtn setTitle:_endTime forState:UIControlStateNormal];
    [chooseTimeListBtn setTitleColor:[UIColor colorWithRed:80/255.f green:80/255.f blue:80/255.f alpha:1] forState:UIControlStateNormal];
    [self.view addSubview:chooseTimeListBtn];
    
    
    
    UIButton *addJobBtn = [UIButton buttonWithType: UIButtonTypeCustom];
    [addJobBtn setFrame:CGRectMake((self.view.frame.size.width-280)/2, 320,280, 40)];
    [addJobBtn setTitle:@"添加任务" forState:UIControlStateNormal];
    [addJobBtn setBackgroundImage:[UIImage imageNamed:@"login-button"] forState:UIControlStateNormal];
    [addJobBtn setBackgroundImage:[UIImage imageNamed:@"login-button-highlighted"] forState:UIControlStateHighlighted];
    [addJobBtn.titleLabel setTextColor:[UIColor colorWithRed:250/255.f green:250/255.f blue:250/255.f alpha:1]];
    [addJobBtn addTarget:self action:@selector(addJob) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:addJobBtn];
    
    
    dateTextField = [[UITextField alloc] initWithFrame:CGRectMake(40, 174+69,self.view.frame.size.width-40, 45)];
    [dateTextField setBorderStyle:UITextBorderStyleNone];
    dateTextField.backgroundColor = [UIColor clearColor];
    //dateTextField.enabled = NO;
    dateTextField.tintColor=[UIColor whiteColor];
    //dateTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    //dateTextField.text=@" 没有截止时间";
    dateTextField.placeholder = @" 没有截止时间";
    [dateTextField setValue:[UIColor colorWithRed:80/255.f green:80/255.f blue:80/255.f alpha:1] forKeyPath:@"_placeholderLabel.textColor"];
    dateTextField.textColor=[UIColor colorWithRed:80/255.f green:80/255.f blue:80/255.f alpha:1];
    [self.view addSubview:dateTextField];
    
    clearTextBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [clearTextBtn setTitle:@"X" forState:UIControlStateNormal];
    [clearTextBtn setTitleColor:[UIColor  colorWithRed:151/255.f green:151/255.f blue:151/255.f alpha:1]forState:UIControlStateNormal];
    clearTextBtn.backgroundColor = [UIColor clearColor];
    [clearTextBtn setFrame:CGRectMake(292, 174+82,15, 15)];
    clearTextBtn.hidden = YES;
    [clearTextBtn addTarget:self action:@selector(clearTextContent) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:clearTextBtn];
    
    

    datePicker = [[UIDatePicker alloc]init];
    datelocale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh_TW"];
    datePicker.locale = datelocale;
    datePicker.timeZone = [NSTimeZone timeZoneWithName:@"GMT"];
    datePicker.datePickerMode = UIDatePickerModeDate;
    dateTextField.inputView = datePicker;
    
    UIToolbar *toolBar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 320, 44)];
    toolBar.backgroundColor = [UIColor clearColor];
    UIBarButtonItem *right = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self
        action:@selector(cancelPicker)];

    UIBarButtonItem *flexible = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    
    [toolBar setItems:[NSArray arrayWithObjects:flexible,right,nil]  animated:YES];
    dateTextField.inputAccessoryView = toolBar;
    
    
    
}

-(BOOL) textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    NSMutableString *text = [dateTextField.text mutableCopy];
    [text replaceCharactersInRange:range withString:string];
    return [text length] <= 6;
}

-(void)clearTextContent{


    clearTextBtn.hidden = YES;
    
    dateTextField.text = @"";
}


//导航栏保存
-(void) barcCheckNewJob{

    NSLog(@"保存确认");

}

//关闭键盘
-(void) dismissKeyBoard{
    
    [jobContentField resignFirstResponder];
}

//关闭选择日期 pickerView 并赋值 更新dateTextField 数据
-(void) cancelPicker {
    
    if ([self.view endEditing:NO]) {

        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        NSString *dateFormat = [NSDateFormatter dateFormatFromTemplate:@"yyyy-MM-dd" options:0 locale:datelocale];
        [formatter setDateFormat:dateFormat];
        [formatter setLocale:datelocale];
        NSString *datePickertime =[NSString stringWithFormat:@"%@",[formatter stringFromDate:datePicker.date]];
        NSString *string1 = @"  ";
        dateTextField.text = [string1 stringByAppendingString:datePickertime];
    }
    
    clearTextBtn.hidden =  NO;
}

//选择任务列表
-(void)chooseJobList{

   NSLog(@"选择任务列表");
    JobListViewController *jobListlVC = [self.storyboard instantiateViewControllerWithIdentifier:@"jobListViewController"];
    
    [self.navigationController pushViewController: jobListlVC animated:true];
    
   // [self presentModalViewController:jobListlVC animated:YES];
    
}

//选择负责人列表
-(void)choosePeopleList{

    NSLog(@"选择负责人列表");
    ChoosePeopleViewController *choosePeopleVC = [self.storyboard instantiateViewControllerWithIdentifier:@"choosePeopleViewController"];
    
    [self.navigationController pushViewController: choosePeopleVC animated:true];
    
    
}

//添加任务
-(void)addJob{

    NSLog(@"添加任务");

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
