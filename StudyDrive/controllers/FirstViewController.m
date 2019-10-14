//
//  FirstViewController.m
//  StudyDrive
//
//  Created by lxx on 2018/9/25.
//  Copyright © 2018年 lxx. All rights reserved.
//

#import "FirstViewController.h"
#import "FirstTableViewCell.h"
#import "TestSelectViewController.h"
#import "MyDataManager.h"
@interface FirstViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong)UITableView*tableView;
@property(nonatomic)NSArray*dataArray;

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout=UIRectEdgeNone;
    self.view.backgroundColor=[UIColor whiteColor];
    _dataArray=@[@"章节练习",@"随机练习",@"模拟考试",@"专项练习"];
    [self creatTableView];
    [self creatView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)creatView{
    NSArray * array =@[@"错题",@"成绩",@"收藏",@"统计"];
    for(int i=0;i<4;i++){
        UIButton * button =[UIButton buttonWithType:UIButtonTypeSystem];
        button.frame=CGRectMake(self.view.frame.size.width/4*i+self.view.frame.size.width/4/2-20, self.view.frame.size.height-64-100, 60, 60);
        [button setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"foot%d.png",i+1]] forState:UIControlStateNormal];
        [self.view addSubview:button];
        
        UILabel * label=[[UILabel alloc]initWithFrame:CGRectMake(self.view.frame.size.width/4*i+self.view.frame.size.width/4/2-20, self.view.frame.size.height-64-25, 60, 20)];
        label.text=array[i];
        label.textAlignment=NSTextAlignmentCenter;
        label.font=[UIFont boldSystemFontOfSize:12];
        [self.view addSubview:label];
    }
}


-(void)creatTableView{
    _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 320) style:UITableViewStylePlain];
    _tableView.dataSource=self;
    _tableView.delegate=self;
    [self.view addSubview:_tableView];
}

#pragma mark - tableview delegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataArray.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    static NSString*cellID=@"FirstTableViewCell";
    FirstTableViewCell * cell =[tableView dequeueReusableCellWithIdentifier:cellID];
    if(cell==nil){
        //载入XIB文件
        cell=[[[NSBundle mainBundle]loadNibNamed:cellID owner:self options:nil]lastObject];
    }
    cell.myLabel.text=_dataArray[indexPath.row];
    cell.myImageView.image=[UIImage imageNamed:[NSString stringWithFormat:@"pra%ld.png",indexPath.row+1]];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.row) {
        case 0:
        {
            TestSelectViewController * con=[[TestSelectViewController alloc]init];
            con.dataArray=[MyDataManager getData:chapter];
            con.mytile=@"章节练习";
            UIBarButtonItem * item =[[UIBarButtonItem alloc]init];
            item.title=@"";
            self.navigationItem.backBarButtonItem=item;
            [self.navigationController pushViewController:con animated:YES];
        }
            break;
        case 1:{
            UIAlertController * alertVC=[UIAlertController alertControllerWithTitle:@"尚未完成此功能" message:@"敬请期待" preferredStyle:UIAlertControllerStyleAlert];
            [alertVC addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            }]];
            [self presentViewController:alertVC animated:YES completion:nil];
        }
            break;
        case 2:{
            UIAlertController * alertVC=[UIAlertController alertControllerWithTitle:@"尚未完成此功能" message:@"敬请期待" preferredStyle:UIAlertControllerStyleAlert];
            [alertVC addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            }]];
            [self presentViewController:alertVC animated:YES completion:nil];
        }
            break;
        case 3:{
            UIAlertController * alertVC=[UIAlertController alertControllerWithTitle:@"尚未完成此功能" message:@"敬请期待" preferredStyle:UIAlertControllerStyleAlert];
            [alertVC addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            }]];
            [self presentViewController:alertVC animated:YES completion:nil];
        }
            break;
        default:
            break;
    }
}



@end
