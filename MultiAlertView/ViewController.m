//
//  ViewController.m
//  MultiAlertView
//
//  Created by R on 2016/03/12.
//  Copyright © 2016年 マック太郎. All rights reserved.
//

#import "ViewController.h"
#import "UIViewController+Alert.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self createAlertWithTitle:@"アラート"
                       message:@"テスト"
             cancelButtonTitle:@"キャンセル"];
    [self isAlertButtonAction:YES];
    
    [self addCancelAction:^{
        NSLog(@"キャンセル");
    }];
    
    [self addActionWithButonName:@"ボタン1"
                    buttonAction:nil];
    
    [self addActionWithButonName:@"ボタン2"
                    buttonAction:^{
        NSLog(@"ボタン2");
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)tapBtn:(id)sender {
    [self showAlert];
}

@end
