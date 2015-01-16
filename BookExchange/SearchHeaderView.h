//
//  SearchHeaderView.h
//  BookExchange
//
//  Created by CY on 15/1/15.
//  Copyright (c) 2015年 LINYC. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SearchHeaderViewDelegate <NSObject>

//取消按钮触发协议
-(void)reloadTableViewData;

//segmented选择改变协议
-(void)segmentedChanged:(UISegmentedControl*)segmented;

@end

@interface SearchHeaderView : UIView
+ (instancetype)instantiateFromNib;

@property (nonatomic,weak) id <SearchHeaderViewDelegate> delegate;
@end
