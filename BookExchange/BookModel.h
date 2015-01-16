//
//  BookInfoModel.h
//  BookExchange
//
//  Created by CY on 7/1/15.
//  Copyright (c) 2015年 LINYC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BookAuxiliaryModel.h"
#import "JSONModel.h"
@protocol BookModel @end

@interface BookModel : JSONModel
@property (nonatomic,assign) NSInteger bookId;
@property (nonatomic,copy) NSString *title;//书名
@property (nonatomic,copy) NSString *article;//作者
@property (nonatomic,copy) NSString *translator;//译者
@property (nonatomic,copy) NSString *sendWord;//寄语
@property (nonatomic,copy) NSString *ISBN;//条形码
@property (nonatomic,copy) NSString *libBookNumber;//索书号
@property (nonatomic,copy) NSString *faceImageUrl;//封面图
@property (nonatomic,copy) NSString *inputTime;//贡献时间

@property (nonatomic,strong) BookAuxiliaryModel *bookAux;
@end
