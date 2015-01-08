//
//  UserInfoModel.h
//  BookExchange
//
//  Created by CY on 7/1/15.
//  Copyright (c) 2015年 LINYC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserModel : NSObject
@property (nonatomic,assign) NSUInteger userId;
@property (nonatomic,copy) NSString *nikeName;
@property (nonatomic,copy) NSString *email;
@property (nonatomic,assign) BOOL isMan;//if Man then YES
@property (nonatomic,assign) NSUInteger age;
@property (nonatomic,assign) NSUInteger bookCount;//贡献总数
@property (nonatomic,copy) NSString *headImageUrl;//头像图片（预留）
@end
