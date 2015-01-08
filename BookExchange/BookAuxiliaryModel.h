//
//  BookAuxiliary.h
//  BookExchange
//
//  Created by CY on 7/1/15.
//  Copyright (c) 2015年 LINYC. All rights reserved.
//

#import <Foundation/Foundation.h>
//书Model的附属model
@interface BookAuxiliaryModel : NSObject
@property (nonatomic,assign) NSUInteger bookId;
@property (nonatomic,assign) NSUInteger viewCount;//阅览量
@property (nonatomic,assign) NSUInteger replyCount;//回复数
@property (nonatomic,assign) NSUInteger userId;//贡献者
@end
