//
//  ProjectDetailViewController.m
//  ProjectManage
//
//  Created by 单好坤 on 14-6-4.
//  Copyright (c) 2014年 zzlmilk. All rights reserved.
//

#import "ProjectDetailViewController.h"
#import "AddProjectViewController.h"

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
    self.projectDetailTableView = ({
        UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.separatorStyle = NO;
        tableView;
    });
    
    [self.view addSubview:self.projectDetailTableView];
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
}

#pragma mark -
#pragma mark UITableView Datasource

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return 80;
    }
    return 10;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)sectionIndex
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    

    static NSString *cellID = @"cellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    UIButton* addNewJob = [UIButton buttonWithType: UIButtonTypeRoundedRect];
    addNewJob.layer.cornerRadius = 5;
    [addNewJob setTitle:@"添 加 新 任 务" forState:UIControlStateNormal];
    [addNewJob setFrame:CGRectMake(20, 22, 280, 40)];
    addNewJob.backgroundColor = [UIColor clearColor];
    addNewJob.titleLabel.font = [UIFont fontWithName:@"Arial" size:15];
    [addNewJob setBackgroundColor:[UIColor whiteColor]];
    [addNewJob setTitleColor:[UIColor colorWithRed:50/255.f green:50/255.f blue:50/255.f alpha:1.0f] forState:UIControlStateNormal];
    addNewJob.layer.shadowColor = [UIColor blackColor].CGColor;
    addNewJob.layer.shadowOffset = CGSizeMake(1.0, 2.0);
    addNewJob.layer.shadowOpacity = 0.2;
    //
    [addNewJob addTarget:self action:@selector(addNewProject:) forControlEvents:UIControlEventTouchUpInside];
    //
    [cell.contentView addSubview:addNewJob];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.backgroundColor = [UIColor colorWithRed:245/255.f green:245/255.f blue:245/255.f alpha:1];
        }
       return cell;
    
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
