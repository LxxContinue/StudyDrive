//
//  ViewController.m
//  StudyDrive
//
//  Created by lxx on 2018/9/24.
//  Copyright © 2018年 lxx. All rights reserved.
//

#import "ViewController.h"
#include "SelectView.h"
#include "FirstViewController.h"

@interface ViewController ()
@property(strong,nonatomic)SelectView*selecView;
@property (weak, nonatomic) IBOutlet UIButton *selectBtn;
@property (weak, nonatomic) IBOutlet UIButton *lesson1;
@property (weak, nonatomic) IBOutlet UIButton *lesson2;
@property (weak, nonatomic) IBOutlet UIButton *lesson3;
@property (weak, nonatomic) IBOutlet UIButton *lesson4;

@end

@implementation ViewController
- (IBAction)click:(UIButton *)sender {
    switch (sender.tag) {
        case 1:
            {
                [UIView animateWithDuration:0.3 animations:^{
                    _selecView.alpha=1;
                }];
            }
            break;
        case 2:
            {
                [self.navigationController pushViewController:[[FirstViewController alloc]init] animated:YES];
            }
            break;
        case 3:
            {
                UIAlertController * alertVC=[UIAlertController alertControllerWithTitle:@"尚未完成此功能" message:@"敬请期待" preferredStyle:UIAlertControllerStyleAlert];
                [alertVC addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
                }]];
                [self presentViewController:alertVC animated:YES completion:nil];
            }
            break;
        case 4:
            {
                UIAlertController * alertVC=[UIAlertController alertControllerWithTitle:@"尚未完成此功能" message:@"敬请期待" preferredStyle:UIAlertControllerStyleAlert];
                [alertVC addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
                }]];
                [self presentViewController:alertVC animated:YES completion:nil];
            }
            break;
        case 5:
        {
            UIAlertController * alertVC=[UIAlertController alertControllerWithTitle:@"尚未完成此功能" message:@"敬请期待" preferredStyle:UIAlertControllerStyleAlert];
            [alertVC addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            }]];
            [self presentViewController:alertVC animated:YES completion:nil];
        }
            break;
        default:
            break;
    }
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _selecView=[[SelectView alloc]initWithFrame:self.view.frame andBtn:_selectBtn];
    _selecView.alpha=0;
    [self.view addSubview:_selecView];
    
    self.lesson1.layer.shadowOffset=CGSizeMake(10, 10);
    self.lesson1.layer.shadowColor=[UIColor blackColor].CGColor;
    self.lesson1.layer.shadowOpacity=0.3;
    self.lesson1.layer.masksToBounds=NO;
    
    self.lesson2.layer.shadowOffset=CGSizeMake(10, 10);
    self.lesson2.layer.shadowColor=[UIColor blackColor].CGColor;
    self.lesson2.layer.shadowOpacity=0.3;
    self.lesson2.layer.masksToBounds=NO;
    
    self.lesson3.layer.shadowOffset=CGSizeMake(10, 10);
    self.lesson3.layer.shadowColor=[UIColor blackColor].CGColor;
    self.lesson3.layer.shadowOpacity=0.3;
    self.lesson3.layer.masksToBounds=NO;
    
    self.lesson4.layer.shadowOffset=CGSizeMake(10, 10);
    self.lesson4.layer.shadowColor=[UIColor blackColor].CGColor;
    self.lesson4.layer.shadowOpacity=0.3;
    self.lesson4.layer.masksToBounds=NO;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
