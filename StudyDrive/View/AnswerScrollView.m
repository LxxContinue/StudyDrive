//
//  AnswerScrollView.m
//  StudyDrive
//
//  Created by LXX on 2018/12/1.
//  Copyright © 2018年 lxx. All rights reserved.
//

#import "AnswerScrollView.h"
#import "AnswerTableViewCell.h"
#import "AnswerModel.h"
#import "Tools.h"
#define SIZE self.frame.size
@interface AnswerScrollView()<UIScrollViewDelegate,UITableViewDataSource,UITableViewDelegate>{
    
}
@end

@implementation AnswerScrollView
{
    UIScrollView * _scrollView;
    UITableView * _leftTableView;
    UITableView * _mainTableView;
    UITableView * _rightTableVIew;
    

}
-(instancetype)initWithFrame:(CGRect)frame withDataArray:(NSArray *)array{
    self=[super initWithFrame:frame];
    if(self){
        _currentPage=0;
        _dataArray=[[NSArray alloc]initWithArray:array];
        _hadAnswerArray=[[NSMutableArray alloc]init];
        for(int i=0;i<array.count;i++){
            [_hadAnswerArray addObject:@"0"];
        }
        _scrollView=[[UIScrollView alloc]initWithFrame:frame];
        _scrollView.delegate=self;
        _leftTableView=[[UITableView alloc]initWithFrame:frame style:UITableViewStyleGrouped];
        _mainTableView=[[UITableView alloc]initWithFrame:frame style:UITableViewStyleGrouped];
        _rightTableVIew=[[UITableView alloc]initWithFrame:frame style:UITableViewStyleGrouped];
        _leftTableView.delegate=self;
        _mainTableView.delegate=self;
        _rightTableVIew.delegate=self;
        _leftTableView.dataSource=self;
        _mainTableView.dataSource=self;
        _rightTableVIew.dataSource=self;
        _scrollView.pagingEnabled=YES;
        _scrollView.bounces=NO;
        _scrollView.showsVerticalScrollIndicator=NO;
        _scrollView.showsHorizontalScrollIndicator=NO;
        if(_dataArray.count>1){
            _scrollView.contentSize=CGSizeMake(SIZE.width*2, 0);
        }
        [self creatView];
    }
    return self;
}

-(void)creatView{
    _leftTableView.frame=CGRectMake(0, 0, SIZE.width, SIZE.height);
    _mainTableView.frame=CGRectMake(SIZE.width, 0, SIZE.width, SIZE.height);
    _rightTableVIew.frame=CGRectMake(SIZE.width*2, 0, SIZE.width, SIZE.height);
    [_scrollView addSubview:_leftTableView];
    [_scrollView addSubview:_mainTableView];
    [_scrollView addSubview:_rightTableVIew];
    [self addSubview:_scrollView];
    
}

#pragma mark - tableView delegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 4;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    AnswerModel * model=[self getTheFitModel:tableView];
    NSString * str =[NSString stringWithFormat:@"答案解析%@",model.mdesc];
    UIFont * font =[UIFont systemFontOfSize:16];
    return  [Tools getSizeWithString:str with:font withSize:CGSizeMake(tableView.frame.size.width-20, 400)].height+20;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    AnswerModel * model=[self getTheFitModel:tableView];
    CGFloat height;
    if([model.mtype intValue]==1){
        NSString * str =[[Tools getAnswerWithString:model.mquestion]objectAtIndex:0];
        UIFont * font =[UIFont systemFontOfSize:16];
        height= [Tools getSizeWithString:str with:font withSize:CGSizeMake(tableView.frame.size.width-20, 400)].height+20;
    }else{
        NSString * str =model.mquestion;
        UIFont * font =[UIFont systemFontOfSize:16];
        height= [Tools getSizeWithString:str with:font withSize:CGSizeMake(tableView.frame.size.width-20, 400)].height+20;
    }
    if(height<=80){
        return 80;
    }else {
        return height;
    }
}

-(UIView*)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    CGFloat height;
    NSString * str;
    AnswerModel * model=[self getTheFitModel:tableView];
    str =[NSString stringWithFormat:@"答案解析:%@",model.mdesc];
    UIFont * font =[UIFont systemFontOfSize:16];
    height= [Tools getSizeWithString:str with:font withSize:CGSizeMake(tableView.frame.size.width-20, 400)].height+20;
    UIView* view =[[UIView alloc]initWithFrame:CGRectMake(0, 0, SIZE.width, height)];
    UILabel * label=[[UILabel alloc]initWithFrame:CGRectMake(10, 10, tableView.frame.size.width-20, height-20)];
    label.text=str;
    label.font=[UIFont systemFontOfSize:16];
    label.numberOfLines=0;
    label.textColor=[UIColor blackColor];
    [view addSubview:label];
    
    int page=[self getQuestionNumber:tableView andCurrentPage:_currentPage];
    if([_hadAnswerArray[page-1] intValue]!=0){
        return view;
    }
    return nil;
}

-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    AnswerModel * model=[self getTheFitModel:tableView];
    CGFloat height;
    NSString * str;
    if([model.mtype intValue]==1){
        str =[[Tools getAnswerWithString:model.mquestion]objectAtIndex:0];
        UIFont * font =[UIFont systemFontOfSize:16];
        height= [Tools getSizeWithString:str with:font withSize:CGSizeMake(tableView.frame.size.width-20, 400)].height+20;
    }else{
        str =model.mquestion;
        UIFont * font =[UIFont systemFontOfSize:18];
        height= [Tools getSizeWithString:str with:font withSize:CGSizeMake(tableView.frame.size.width-20, 400)].height+20;
    }
    UIView* view =[[UIView alloc]initWithFrame:CGRectMake(0, 0, SIZE.width, height)];
    view.backgroundColor=[UIColor whiteColor];
    UILabel * label=[[UILabel alloc]initWithFrame:CGRectMake(10, 10, tableView.frame.size.width-20, height-20)];
    label.text=[NSString stringWithFormat:@"%d.%@",[self getQuestionNumber:tableView andCurrentPage:_currentPage],str];
    label.font=[UIFont systemFontOfSize:16];
    label.numberOfLines=0;
    [view addSubview:label];
    return view;
}

-(int)getQuestionNumber:(UITableView *)tableView andCurrentPage:(int)page{
    if(tableView==_leftTableView&&page==0){
        return 1;
    }else if(tableView==_leftTableView&&page>0){
        return page;
    }else if(tableView==_mainTableView&&page>0&&page<_dataArray.count-1){
        return page+1;
    }else if(tableView==_mainTableView&&page==0){
        return 2;
    }else if(tableView==_mainTableView&&page==_dataArray.count-1){
        return page;
    }else if(tableView==_rightTableVIew&&page<_dataArray.count-1){
        return page+2;
    }else if(tableView==_rightTableVIew&&page==_dataArray.count-1){
        return page+1;
    }
    return 0;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    int page=[self getQuestionNumber:tableView andCurrentPage:_currentPage];
    if([_hadAnswerArray[page-1] intValue]!=0){
        return;
    }else{
        [_hadAnswerArray replaceObjectAtIndex:page-1 withObject:[NSString stringWithFormat:@"%ld",indexPath.row+1]];
    }
    [self reloadData];
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellID =@"AnswerTableViewCell";
    AnswerTableViewCell * cell=[tableView dequeueReusableCellWithIdentifier:cellID];
    if(!cell){
        cell=[[[NSBundle mainBundle]loadNibNamed:@"AnswerTableViewCell" owner:self options:nil]lastObject];
        cell.numberLabel.layer.masksToBounds=YES;
        cell.numberLabel.layer.cornerRadius=14;
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
    }
    cell.numberLabel.text=[NSString stringWithFormat:@"%c",(char)('A'+indexPath.row)];
    if(indexPath.row%2==0){
        cell.backgroundColor=[UIColor colorWithRed:0 green:0 blue:0 alpha:0.01];
    }else{
        cell.backgroundColor=[UIColor whiteColor];
    }
    
    AnswerModel * model=[self getTheFitModel:tableView];
    if([model.mtype intValue]==1){
        cell.answerLabel.text=[[Tools getAnswerWithString:model.mquestion]objectAtIndex:indexPath.row+1];
        //cell.answerLabel.numberOfLines=3;
    }
    int page=[self getQuestionNumber:tableView andCurrentPage:_currentPage];
    //判断答题是否正确
    if([_hadAnswerArray[page-1] intValue]!=0){
        if([model.manswer isEqualToString:[NSString stringWithFormat:@"%c",'A'+(int)indexPath.row]]){//正确
            cell.numberImage.hidden=NO;
            cell.numberImage.image=[UIImage imageNamed:@"right.png"];
        }else if(![model.manswer isEqualToString:[NSString stringWithFormat:@"%c",'A'+[_hadAnswerArray[page-1] intValue]-1]]&&indexPath.row==[_hadAnswerArray[page-1] intValue]-1){//错误
            cell.numberImage.hidden=NO;
            cell.numberImage.image=[UIImage imageNamed:@"wrong.png"];
        }else{
            cell.numberImage.hidden=YES;
        }
    }else{
        cell.numberImage.hidden=YES;
    }
    return cell;
}
-(AnswerModel*)getTheFitModel:(UITableView *)tableView{
    AnswerModel * model;
    if(tableView==_leftTableView&&_currentPage==0){
        model=_dataArray[_currentPage];
    }else if(tableView==_leftTableView&&_currentPage>0){
        model=_dataArray[_currentPage-1];
    }else if(tableView==_mainTableView&&_currentPage==0){
        model=_dataArray[_currentPage+1];
    }else if(tableView==_mainTableView&&_currentPage>0&&_currentPage<_dataArray.count-1){
        model=_dataArray[_currentPage];
    }else if(tableView==_mainTableView&&_currentPage==_dataArray.count-1){
        model=_dataArray[_currentPage-1];
    }else if(tableView==_rightTableVIew&&_currentPage==_dataArray.count-1){
        model=_dataArray[_currentPage];
    }else if(tableView==_rightTableVIew&&_currentPage<_dataArray.count-1){
        model=_dataArray[_currentPage+1];
    }
    return model;
}


-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    CGPoint currentOffset=scrollView.contentOffset;
    int page=(int)currentOffset.x/SIZE.width;
    if(page<_dataArray.count-1&&page>0){
        _scrollView.contentSize=CGSizeMake(currentOffset.x+SIZE.width*2, 0);
        _mainTableView.frame=CGRectMake(currentOffset.x, 0, SIZE.width, SIZE.height);
        _leftTableView.frame=CGRectMake(currentOffset.x-SIZE.width, 0, SIZE.width, SIZE.height);
        _rightTableVIew.frame=CGRectMake(currentOffset.x+SIZE.width, 0, SIZE.width, SIZE.height);
    }
    _currentPage=page;
    [self reloadData];
}

-(void)reloadData{
    [_leftTableView reloadData];
    [_rightTableVIew reloadData];
    [_mainTableView reloadData];
}








@end
