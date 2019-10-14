//
//  SelectModelView.h
//  StudyDrive
//
//  Created by LXX on 2018/12/2.
//  Copyright © 2018年 lxx. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum{
    testModel,
    lookingModel
}SelectModel;
typedef void (^SelecTouch)(SelectModel model);

@interface SelectModelView : UIView

@property(nonatomic,assign)SelectModel  model;
-(SelectModelView *)initWithFrame:(CGRect)frame addTouch:(SelecTouch)touch;

@end
