//
//  AnswerTableViewCell.h
//  StudyDrive
//
//  Created by LXX on 2018/12/1.
//  Copyright © 2018年 lxx. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AnswerTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *numberLabel;
@property (weak, nonatomic) IBOutlet UIImageView *numberImage;
@property (weak, nonatomic) IBOutlet UILabel *answerLabel;

@end
