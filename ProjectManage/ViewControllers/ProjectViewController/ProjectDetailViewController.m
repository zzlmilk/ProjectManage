//
//  ProjectDetailViewController.m
//  ProjectManage
//
//  Created by 单好坤 on 14-6-4.
//  Copyright (c) 2014年 zzlmilk. All rights reserved.
//

#import "ProjectDetailViewController.h"
#import "AddProjectViewController.h"
#import "ContentViewCell.h"
#import "ContentTableViewCell.h"
#import "Task.h"
#import "TaskList.h"


@interface ProjectDetailViewController ()

@end

@implementation ProjectDetailViewController

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

    self.title = @"熟悉Tower";
    
    // Do any additional setup after loading the view.
    
    self.projectDetailTableView.dataSource = self;
    self.projectDetailTableView.delegate = self;
    self.projectDetailTableView.separatorStyle = NO;
    //[self.view addSubview:self.projectDetailTableView];
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    TaskList *tl1 = [[TaskList alloc]init];
    tl1.taskListName= @"task 1111 ";
    Task *task1 = [[Task alloc]init];
    task1.name = @"t1";
    
    Task *t11 = [[Task alloc]init];
    t11.name = @"111";
    
    [tl1.tasks addObject:t11];
    [tl1.tasks addObject:t11];
        [tl1.tasks addObject:task1];
    [tl1.tasks addObject:task1];
    [tl1.tasks addObject:task1];
     [tl1.tasks addObject:task1];
     [tl1.tasks addObject:task1];
     [tl1.tasks addObject:t11];
     [tl1.tasks addObject:task1];
     [tl1.tasks addObject:task1];
     [tl1.tasks addObject:task1];
     [tl1.tasks addObject:task1];
    
    
    
    
    TaskList *tl2 = [[TaskList alloc]init];
    tl2.taskListName= @"task 2222 ";
    Task *task2 = [[Task alloc]init];
    task2.name = @"t2";
       Task *task3 = [[Task alloc]init];
    task3.name =@"3333";
    [tl2.tasks addObject:task3];
    [tl2.tasks addObject:task2];
    [tl2.tasks addObject:task2];
    [tl2.tasks addObject:task2];
    [tl2.tasks addObject:task2];
    

    
    
    
    _taskLists = [NSMutableArray array];
    [_taskLists addObject:tl1];
    [_taskLists addObject:tl2];
    [self.projectDetailTableView reloadData];
    
    
}

#pragma mark -
#pragma mark UITableView Datasource

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    long row = indexPath.row;
    
    if (row == 0) {
        return 84;
    }
    
    TaskList *taskList = [_taskLists objectAtIndex:indexPath.row-1];
    return 44*(taskList.tasks.count+1);
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)sectionIndex
{
    
    return _taskLists.count+1;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    long row = indexPath.row;
    
    if (row == 0) {
        static NSString *cellID = @"cellID";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
        if (cell == nil) {
            
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
            UIButton* addNewJobBtn = [UIButton buttonWithType: UIButtonTypeRoundedRect];
            addNewJobBtn.layer.cornerRadius = 5;
            [addNewJobBtn setTitle:@"添 加 新 任 务" forState:UIControlStateNormal];
            [addNewJobBtn setFrame:CGRectMake(20, 22, 280, 40)];
            addNewJobBtn.backgroundColor = [UIColor clearColor];
            addNewJobBtn.titleLabel.font = [UIFont fontWithName:@"Arial" size:15];
            [addNewJobBtn setBackgroundColor:[UIColor whiteColor]];
            [addNewJobBtn setTitleColor:[UIColor colorWithRed:50/255.f green:50/255.f blue:50/255.f alpha:1.0f] forState:UIControlStateNormal];
            addNewJobBtn.layer.shadowColor = [UIColor blackColor].CGColor;
            addNewJobBtn.layer.shadowOffset = CGSizeMake(1.0, 2.0);
            addNewJobBtn.layer.shadowOpacity = 0.2;
            [addNewJobBtn addTarget:self action:@selector(addNewProject:) forControlEvents:UIControlEventTouchUpInside];
            [cell.contentView addSubview:addNewJobBtn];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.backgroundColor = [UIColor colorWithRed:245/255.f green:245/255.f blue:245/255.f alpha:1];
        }
        
        return cell;
    }
    
    else {
        
        
        
        static NSString *cellID = @"cellId";
        ContentTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
        
        cell.taskList = [_taskLists objectAtIndex:indexPath.row-1];
        //cell.frame = CGRectMake(0, 0, 320, 44*(cell.taskList.tasks.count+1));
        return cell;
        
    }
  
    
}

-(void)addNewProject:(id)sender{
    
    AddProjectViewController *addProjectDetailVC = [self.storyboard instantiateViewControllerWithIdentifier:@"addProjectViewController"];
    
    [self.navigationController pushViewController: addProjectDetailVC animated:true];
    
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
