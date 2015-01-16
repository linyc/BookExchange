//
//  HeaderView.m
//  BookExchange
//
//  Created by CY on 6/1/15.
//  Copyright (c) 2015年 LINYC. All rights reserved.
//

#import "TitleHeaderView.h"

@implementation TitleHeaderView

+(instancetype)instancetFromNib
{
    NSArray *views = [[NSBundle mainBundle] loadNibNamed:[NSString stringWithFormat:@"%@",[self class] ] owner:nil options:nil];
    if (views != nil && views.count > 0) {
        if (views[0] != nil) {
            return [views firstObject];
        }
        return [[TitleHeaderView alloc]init];
    }
    
    return [[TitleHeaderView alloc] init];
}

@end
