//
//  ReplyModel.h
//  BookExchange
//
//  Created by CY on 7/1/15.
//  Copyright (c) 2015年 LINYC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ReplyModel : NSObject
@property (nonatomic,assign) NSUInteger replyId;
@property (nonatomic,copy) NSString *replyContent;
@property (nonatomic,strong) NSDate *replyTime;
@property (nonatomic,assign) NSUInteger userId;
@property (nonatomic,assign) NSUInteger bookId;
@property (nonatomic,assign) NSUInteger atUserId;//该回复内容是@了谁的
@property (nonatomic,assign) NSUInteger likeCount;//被赞的次数
@end
