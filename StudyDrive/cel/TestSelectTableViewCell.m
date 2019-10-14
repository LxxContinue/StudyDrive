//
//  TestSelectTableViewCell.m
//  StudyDrive
//
//  Created by LXX on 2018/11/4.
//  Copyright © 2018年 lxx. All rights reserved.
//

#import "TestSelectTableViewCell.h"

@implementation TestSelectTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.cornerView.layer.shadowOffset=CGSizeMake(0, -5);
    self.cornerView.layer.shadowColor=[UIColor blackColor].CGColor;
    self.cornerView.layer.shadowOpacity=0.1;
    self.cornerView.layer.masksToBounds=NO;
    
    self.backView.clipsToBounds=YES;
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
