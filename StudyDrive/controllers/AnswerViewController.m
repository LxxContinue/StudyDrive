//
//  AnswerViewController.m
//  StudyDrive
//
//  Created by LXX on 2018/12/1.
//  Copyright © 2018年 lxx. All rights reserved.
//

#import "AnswerViewController.h"
#import "AnswerScrollView.h"
#import "MyDataManager.h"
#import "AnswerModel.h"
#import "SelectModelView.h"
@interface AnswerViewController ()
{
    AnswerScrollView * view;
    SelectModelView * modelView;
}
@end

@implementation AnswerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout=UIRectEdgeNone;
    self.view.backgroundColor=[UIColor whiteColor];
    NSMutableArray *arr=[[NSMutableArray alloc]init];
    NSArray * array=[MyDataManager getData:answer];
    for(int i=0;i<array.count;i++){
        AnswerModel * model=array[i];
        if([model.pid intValue]==_number+1){
            [arr addObject:model];
        }
    }
    view=[[AnswerScrollView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height-64-60) withDataArray:arr];
    [self.view addSubview:view];
    [self creatToolBar];
    [self creatModelView];
}

-(void)creatModelView{
    modelView=[[SelectModelView alloc]initWithFrame:self.view.frame addTouch:^(SelectModel model) {
        //NSLog(@"当前模式:%d",model);
    }];
    [self.view addSubview:modelView];
    modelView.alpha=0;
    UIBarButtonItem * item=[[UIBarButtonItem alloc]initWithTitle:@"模式" style:UIBarButtonItemStylePlain target:self action:@selector(modelChange:)];
    self.navigationItem.rightBarButtonItem=item;
}
-(void)modelChange:(UIBarButtonItem*)item{
    [UIView animateWithDuration:0.3 animations:^{
        modelView.alpha=1;
    }];
}


-(void)creatToolBar{
    UIView * barView=[[UIView alloc]initWithFrame:CGRectMake(0, self.view.frame.size.height-60-64, self.view.frame.size.width, 60)];
    barView.backgroundColor=[UIColor whiteColor];
    NSString * sum=[NSString stringWithFormat:@"%lu",(unsigned long)view.dataArray.count];
    NSArray * arr=@[sum,@"查看答案",@"收藏本题"];
    for(int i=0;i<3;i++){
        UIButton * btn=[UIButton buttonWithType:UIButtonTypeSystem];
        btn.frame=CGRectMake(self.view.frame.size.width/3*i+self.view.frame.size.width/3/2-22, 0, 36, 36);
        [btn setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"tool%d.png",i+1]] forState:UIControlStateNormal];
        [btn setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"tool%d_inactive.png",i+1]] forState:UIControlStateHighlighted];
        [btn addTarget:self action:@selector(clickToolBar:) forControlEvents:UIControlEventTouchUpInside];
        btn.tag=301+i;
        UILabel * label=[[UILabel alloc]initWithFrame:CGRectMake(btn.frame.origin.x-10, 40, 60, 18)];
        label.textAlignment=NSTextAlignmentCenter;
        label.text=arr[i];
        label.font=[UIFont systemFontOfSize:14];
        [barView addSubview:btn];
        [barView addSubview:label];
    }
    [self.view addSubview:barView];
}
-(void)clickToolBar:(UIButton*)button{
    switch (button.tag) {
        case 302://查看答案
        {
            if([view.hadAnswerArray[view.currentPage]intValue]!=0){//已答过的题不用重复出答案
                return;
            }else{
                AnswerModel * model=[view.dataArray objectAtIndex:view.currentPage];
                NSString * answer=model.manswer;
                char an =[answer characterAtIndex:0];
                [view.hadAnswerArray replaceObjectAtIndex:view.currentPage withObject:[NSString stringWithFormat:@"%d",an-'A'+1]];
                //NSLog(@"%@",answer);
                [view reloadData];
            }
        }
            break;
        default:
            break;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
