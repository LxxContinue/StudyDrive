//
//  Tools.m
//  StudyDrive
//
//  Created by LXX on 2018/12/1.
//  Copyright © 2018年 lxx. All rights reserved.
//

#import "Tools.h"

@implementation Tools
+(NSArray*)getAnswerWithString:(NSString *)str{
    NSMutableArray * array=[[NSMutableArray alloc]init];
    NSArray * arr=[str componentsSeparatedByString:@"<BR>"];
    [array addObject:arr[0]];
    for(int i=0;i<4;i++){
        [array addObject:[arr[i+1] substringFromIndex:2]];
    }
    return array;
}
+(CGSize)getSizeWithString:(NSString *)str with:(UIFont *)font withSize:(CGSize)size{
    CGSize newSize=[str sizeWithFont:font constrainedToSize:size];
    return newSize;
}
@end
