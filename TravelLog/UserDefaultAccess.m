//
//  UserDefaultAccess.m
//  TravelLog
//
//  Created by ami on 2014/02/07.
//  Copyright (c) 2014年 Yosuke. All rights reserved.
//

#import "UserDefaultAccess.h"

@implementation UserDefaultAccess

//------------------------------最初に起動したときに使用---------------------------------------
+ (void)LaunchApp{
    //ユーザーデフォルトからMyIDを取得
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    int MyID = [userDefaults integerForKey:@"MyID"];
    //初めてアプリを起動する場合IDを登録
    if(MyID == 0){
        RemoteDatabaseAccess *remotedatabase = [[RemoteDatabaseAccess alloc]init];
        // ユーザーデフォルトにMyIDを登録+BTOid,Stateを初期化
        [userDefaults setInteger:[remotedatabase RegisterUser] forKey:@"MyID"];
    }
}

@end
