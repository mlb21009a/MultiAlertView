//
//  UIViewController+Alert.m
//  MultiAlertView
//
//  Created by R on 2016/03/12.
//  Copyright © 2016年 マック太郎. All rights reserved.
//

#import "UIViewController+Alert.h"

@implementation UIViewController (Alert)

// アラートアクション保持用の型
typedef void (^AlertAction)(void);

// アラートインスタンス
id alert;

// キャンセルボタンのタイトル
NSString *alertCancelBtnTitle;

// アラートタップ時のイベントリスト
NSMutableArray<AlertAction> *alertActionList;


/**
 *  アラート生成メソッド
 *
 *  @param title             タイトル
 *  @param message           メッセージ
 *  @param cancelButtonTitle キャンセルボタンのタイトル
 *  @param otherButtonTitles その他のボタンのタイトル
 */
- (void)createAlertWithTitle:(NSString *)title
                     message:(NSString *)message
           cancelButtonTitle:(NSString *)cancelButtonTitle {
    
    // アラートの生成
    if ([UIAlertController class]) {
        
        alert = [UIAlertController alertControllerWithTitle:title
                                                    message:message
                                             preferredStyle:UIAlertControllerStyleAlert];
        
    } else {
        alert = [[UIAlertView alloc] initWithTitle:title
                                           message:message
                                          delegate:nil
                                 cancelButtonTitle:cancelButtonTitle
                                 otherButtonTitles:nil];
    }
    
    alertCancelBtnTitle = cancelButtonTitle;
    
    alertActionList = [NSMutableArray array];
    
}



/**
 *  アラートボタン押下時になにかしらのアクションをするか設定(デフォルトNO)
 *
 *  @param buttonAction NOだとアクションしないYESだとアクションする
 */

-(void)isAlertButtonAction:(BOOL)buttonAction {
    
    if (![UIAlertController class]) {
        if (buttonAction) {
            ((UIAlertView *)alert).delegate = self;
        } else {
            ((UIAlertView *)alert).delegate = nil;
        }
    }
}

/**
 *  キャンセルボタン生成とアクション登録メソッド
 *
 *  @param buttonAction ボタンアクション
 */

- (void)addCancelAction:(void (^)(void))buttonAction {
    
    if ([UIAlertController class]) {
        
        UIAlertAction *action = [UIAlertAction actionWithTitle:alertCancelBtnTitle
                                                         style:UIAlertActionStyleCancel
                                                       handler:^(UIAlertAction * _Nonnull action) {
                                                           buttonAction();
                                                       }];
        [alert addAction:action];
    } else {
        
        // アクション用の変数に引数で来たアクションを格納
        AlertAction action = buttonAction;
        // 配列に格納
        [alertActionList addObject:action];
    }
}



/**
 *  ボタン生成とアクション登録メソッド
 *
 *  @param buttonName   ボタン名
 *  @param buttonAction アクション
 */
-  (void)addActionWithButonName:(NSString *)buttonName
                   buttonAction:(void (^)(void))buttonAction {
    
    if ([UIAlertController class]) {
        UIAlertAction *action = [UIAlertAction actionWithTitle:buttonName
                                                         style:UIAlertActionStyleDefault
                                                       handler:^(UIAlertAction * _Nonnull action) {
                                                           buttonAction();
                                                       }];
        [alert addAction:action];
    } else {
        [alert addButtonWithTitle:buttonName];
        
        // アクション用の変数に引数で来たアクションを格納
        AlertAction action = buttonAction;
        // 配列に格納
        [alertActionList addObject:action];
    }
}



/**
 *  アラート表示メソッド
 */
- (void)showAlert {
    
    if ([UIAlertController class]) {
        
        [self presentViewController:alert
                           animated:YES
                         completion:nil];
    } else {
        [alert show];
    }
}



- (void)alertView:(UIAlertView*)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    AlertAction action = alertActionList[buttonIndex];
    action();
}

@end
