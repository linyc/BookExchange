//
//  FirstViewController.m
//  BookExchange
//
//  Created by CY on 5/1/15.
//  Copyright (c) 2015年 LINYC. All rights reserved.
//

#import "DiscoverViewController.h"

@interface DiscoverViewController ()

@end

@implementation DiscoverViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellId = @"ShowReplayCell";
    
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:cellId];
    
    if (cell != nil) {
        UILabel *lblTitle = (UILabel*)[cell viewWithTag:2001];
        UILabel *lblDetail = (UILabel*)[cell viewWithTag:2002];
        UIImageView *imageCover = (UIImageView*)[cell viewWithTag:2003];
        
        lblTitle.text = [NSString stringWithFormat:@"L %ld",indexPath.row];
        lblDetail.text = [NSString stringWithFormat:@"D %ld",indexPath.row];
        imageCover.image = [UIImage imageNamed:@"first"];
    }
    
    return cell;
}

@end
