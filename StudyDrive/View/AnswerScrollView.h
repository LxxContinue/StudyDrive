//
//  AnswerScrollView.h
//  StudyDrive
//
//  Created by LXX on 2018/12/1.
//  Copyright © 2018年 lxx. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AnswerScrollView : UIView

@property(nonatomic,assign,readonly)int currentPage;
@property(nonatomic,strong) NSMutableArray * hadAnswerArray;
@property(nonatomic,strong) NSArray* dataArray;

-(instancetype)initWithFrame:(CGRect)frame withDataArray:(NSArray*)array;
-(void)reloadData;
@end
