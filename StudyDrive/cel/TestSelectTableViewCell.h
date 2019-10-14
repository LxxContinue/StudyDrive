//
//  TestSelectTableViewCell.h
//  StudyDrive
//
//  Created by LXX on 2018/11/4.
//  Copyright © 2018年 lxx. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TestSelectTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIView *cornerView;
@property (weak, nonatomic) IBOutlet UIView *backView;
@property (weak, nonatomic) IBOutlet UILabel *numberLabel;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@end
