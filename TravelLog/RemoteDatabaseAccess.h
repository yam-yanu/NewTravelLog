//
//  RemoteDatabaseAccess.h
//  TravelLog
//
//  Created by ami on 2014/02/07.
//  Copyright (c) 2014年 Yosuke. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "R9HTTPRequest.h"

@interface RemoteDatabaseAccess : NSObject

@property (nonatomic)BOOL isFinished;
@property (nonatomic)BOOL MyID;
@property (nonatomic)BOOL SuccessCheck;
@property (nonatomic)int FailedCount;

-(int) RegisterUser;

@end
