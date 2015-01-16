//
//  SearchHeaderView.m
//  BookExchange
//
//  Created by CY on 15/1/15.
//  Copyright (c) 2015年 LINYC. All rights reserved.
//

#import "SearchHeaderView.h"


@interface SearchHeaderView()
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;


@end

@implementation SearchHeaderView


+ (instancetype)instantiateFromNib
{
    NSArray *views = [[NSBundle mainBundle] loadNibNamed:[NSString stringWithFormat:@"%@", [self class]] owner:nil options:nil];
    return [views firstObject];
}
- (IBAction)btnCancelClick:(id)sender {
    if([self.searchBar isFirstResponder])
    {
        [self.searchBar resignFirstResponder];
    }
    if (self.delegate) {
            [self.delegate reloadTableViewData];
    }

}
- (IBAction)segmentedChanged:(id)sender {
    if (self.delegate) {
        [self.delegate segmentedChanged:sender];
    }
}
@end
