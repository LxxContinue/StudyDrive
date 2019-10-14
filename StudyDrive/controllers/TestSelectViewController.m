//
//  TestSelectViewController.m
//  StudyDrive
//
//  Created by lxx on 2018/10/13.
//  Copyright © 2018年 lxx. All rights reserved.
//

#import "TestSelectViewController.h"
#import "TestSelectModel.h"
#import "TestSelectTableViewCell.h"
#import "AnswerViewController.h"
@interface TestSelectViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)UITableView*tableView;

@end

@implementation TestSelectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    self.edgesForExtendedLayout=UIRectEdgeNone;
    self.title=_mytile;
    [self creatTableView];
   
}

-(void)creatTableView{
    _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height-64) style:UITableViewStylePlain];
    _tableView.dataSource=self;
    _tableView.delegate=self;
    [self.view addSubview:_tableView];
    
    
}

#pragma mark - tableView delegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataArray.count;
//    return 9;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 90;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString*cellID=@"TestSelectTableViewCell";
    TestSelectTableViewCell * cell =[tableView dequeueReusableCellWithIdentifier:cellID];
    if(cell==nil){
        //载入XIB文件
        cell=[[[NSBundle mainBundle]loadNibNamed:cellID owner:self options:nil]lastObject];
    }
    
    cell.textLabel.layer.masksToBounds=YES;
    
    TestSelectModel * model =_dataArray[indexPath.row];

    cell.numberLabel.text=model.pid;
    cell.titleLabel.text=model.pname;
    cell.titleLabel.font=[UIFont fontWithName:@"宋体" size:10];
    
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    AnswerViewController * avc=[[AnswerViewController alloc]init];
    avc.number=indexPath.row;
    [self.navigationController pushViewController:avc animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
