//
//  MyDataManager.h
//  StudyDrive
//
//  Created by LXX on 2018/11/3.
//  Copyright © 2018年 lxx. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum{
    chapter,//章节练习
    answer,//答题数据
}DataType;

@interface MyDataManager : NSObject

+(NSArray*)getData:(DataType)type;

@end
