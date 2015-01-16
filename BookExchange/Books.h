//
//  BookListsModel.h
//  BookExchange
//
//  Created by CY on 16/1/15.
//  Copyright (c) 2015年 LINYC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONModel.h"
#import "BookModel.h"

@interface Books : JSONModel

@property (nonatomic,strong) NSArray<BookModel>* bookLists;

@end
