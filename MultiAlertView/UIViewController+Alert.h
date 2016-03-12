//
//  UIViewController+Alert.h
//  MultiAlertView
//
//  Created by R on 2016/03/12.
//  Copyright © 2016年 マック太郎. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (Alert)

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
           cancelButtonTitle:(NSString *)cancelButtonTitle;


/**
 *  アラートボタン押下時になにかしらのアクションをするか設定(デフォルトNO)
 *
 *  @param buttonAction NOだとアクションしないYESだとアクションする
 */
- (void)isAlertButtonAction:(BOOL)buttonAction;


/**
 *  キャンセルボタン生成とアクション登録メソッド
 *
 *  @param buttonAction ボタンアクション
 */
- (void)addCancelAction:(void (^)(void))buttonAction;

/**
 *  ボタン生成とアクション登録メソッド
 *
 *  @param buttonName   ボタン名
 *  @param buttonAction アクション
 */
- (void)addActionWithButonName:(NSString *)buttonName
                   buttonAction:(void (^)(void))buttonAction;

/**
 *  アラート表示メソッド
 */
- (void)showAlert;

@end
