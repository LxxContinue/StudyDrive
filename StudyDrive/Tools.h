//
//  Tools.h
//  StudyDrive
//
//  Created by LXX on 2018/12/1.
//  Copyright © 2018年 lxx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Tools : NSObject
+(NSArray*)getAnswerWithString:(NSString*)str;
+(CGSize)getSizeWithString:(NSString*)str with:(UIFont*)font withSize:(CGSize)size;
@end
