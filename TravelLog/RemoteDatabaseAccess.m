//
//  RemoteDatabaseAccess.m
//  TravelLog
//
//  Created by ami on 2014/02/07.
//  Copyright (c) 2014年 Yosuke. All rights reserved.
//

#import "RemoteDatabaseAccess.h"

@implementation RemoteDatabaseAccess
@synthesize isFinished;
@synthesize MyID;
@synthesize FailedCount;

//ユーザーを登録
-(int) RegisterUser{
    isFinished = NO;
    MyID = 0;
    
    NSURL *URL = [NSURL URLWithString:@"http://49.212.200.39/TravelLog/RegisterUser.php"];
    R9HTTPRequest *request = [[R9HTTPRequest alloc] initWithURL:URL];
    [request setHTTPMethod:@"POST"];
    [request setCompletionHandler:^(
                                    NSHTTPURLResponse *responseHeader, NSString *responseString){
        // JSON 文字列をそのまま NSJSONSerialization に渡せないので、NSData に変換する
        NSData *jsonData = [responseString dataUsingEncoding:NSUnicodeStringEncoding];
        
        // JSON を NSArray に変換する
        NSError *error;
        NSMutableArray *array = [NSJSONSerialization JSONObjectWithData:jsonData
                                                                options:NSJSONReadingAllowFragments
                                                                  error:&error];
        for (NSDictionary *obj in array)
        {
            MyID = [(NSNumber *)[obj objectForKey:@"id"] intValue];
        }
        //MyIDになにも入ってなかったら３回まで通信を繰り返す
        if(MyID == 0){
            if(FailedCount >= 3){
                FailedCount = 0;
            }else{
                FailedCount ++;
                [self RegisterUser];
            }
        }else{
            isFinished = YES;
            FailedCount = 0;
        }
    }];
    
    //通信に失敗したら３回まで通信を繰り返す
    [request setFailedHandler:^(NSError *error){
        if(FailedCount >= 3){
            FailedCount = 0;
            isFinished = YES;
        }else{
            FailedCount ++;
            [self RegisterUser];
        }
    }];
    
    //通信開始
    [request startRequest];
    
    //通信処理が終了するまで待つ
    while (!isFinished) {
        [[NSRunLoop currentRunLoop]
         runUntilDate:[NSDate dateWithTimeIntervalSinceNow:0.1]];
    }
    
    return MyID;
}

@end
