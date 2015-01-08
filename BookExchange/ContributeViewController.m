//
//  SecondViewController.m
//  BookExchange
//
//  Created by CY on 5/1/15.
//  Copyright (c) 2015年 LINYC. All rights reserved.
//

#import "ContributeViewController.h"
#define FONT_SIZE 14.0f
#define CELL_CONTENT_WIDTH 320.0f
#define CELL_CONTENT_MARGIN 10.0f
@interface ContributeViewController ()

@end

@implementation ContributeViewController{
    NSMutableArray *items;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    items = [[NSMutableArray alloc] init];
    
    [items addObject:@"Happiness is having a large, loving, caring, close-knit family in another city.\n\n\t\t-George Burns (1896 - 1996)"];
    [items addObject:@"When I am abroad, I always make it a rule never to criticize or attack the government of my own country. I make up for lost time when I come home.\n\n\t\t-Sir Winston Churchill (1874 - 1965)"];
    [items addObject:@"After two years in Washington, I often long for the realism and sincerity of Hollywood.\n\n\t\t-Fred Thompson, Speech before the Commonwealth Club of California"];
    [items addObject:@"It is a profitable thing, if one is wise, to seem foolish.\n\n\t\t-Aeschylus (525 BC - 456 BC)"];
    [items addObject:@"Bill Gates is a very rich man today... and do you want to know why? The answer is one word: versions.\n\n\t\t-Dave Barry"];
    [items addObject:@"At the worst, a house unkept cannot be so distressing as a life unlived.\n\n\t\t-Dame Rose Macaulay (1881 - 1958)"];
    [items addObject:@"It is curious that physical courage should be so common in the world and moral courage so rare.\n\n\t\t-Mark Twain (1835 - 1910)"];
    [items addObject:@"The knowledge of the world is only to be acquired in the world, and not in a closet.\n\n\t\t-Lord Chesterfield (1694 - 1773), Letters to His Son, 1746, published 1774"];
    [items addObject:@"What lies behind us and what lies before us are tiny matters compared to what lies within us.\n\n\t\t-Ralph Waldo Emerson (1803 - 1882), (attributed)"];
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView;
{
    return 1;
}
- (NSInteger)tableView:(UITableView*)tableView numberOfRowsInSection:(NSInteger)section
{
    return [items count];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    NSString *text = [items objectAtIndex:[indexPath row]];
    
    CGSize constraint = CGSizeMake(CELL_CONTENT_WIDTH - (CELL_CONTENT_MARGIN * 2), 20000.0f);
    
    CGSize size = [text sizeWithFont:[UIFont systemFontOfSize:FONT_SIZE] constrainedToSize:constraint lineBreakMode:UILineBreakModeWordWrap];
    
    CGFloat height = MAX(size.height, 44.0f);
    
    return height + (CELL_CONTENT_MARGIN * 2);
}

- (UITableViewCell *)tableView:(UITableView *)tv cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell;
    UILabel *label = nil;
    
    cell = [tv dequeueReusableCellWithIdentifier:@"Cell"];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:@"Cell"];
        
        label = [[UILabel alloc] initWithFrame:CGRectZero];
        [label setLineBreakMode:UILineBreakModeWordWrap];
        [label setMinimumFontSize:FONT_SIZE];
        [label setNumberOfLines:0];
        [label setFont:[UIFont systemFontOfSize:FONT_SIZE]];
        [label setTag:1];
        
        [[label layer] setBorderWidth:2.0f];
        
        [[cell contentView] addSubview:label];
        
    }
    NSString *text = [items objectAtIndex:[indexPath row]];
    
    CGSize constraint = CGSizeMake(CELL_CONTENT_WIDTH - (CELL_CONTENT_MARGIN * 2), 20000.0f);
    
    CGSize size = [text sizeWithFont:[UIFont systemFontOfSize:FONT_SIZE] constrainedToSize:constraint lineBreakMode:UILineBreakModeWordWrap];
    
    if (!label)
        label = (UILabel*)[cell viewWithTag:1];
    
    [label setText:text];
    [label setFrame:CGRectMake(CELL_CONTENT_MARGIN, CELL_CONTENT_MARGIN, CELL_CONTENT_WIDTH - (CELL_CONTENT_MARGIN * 2), MAX(size.height, 44.0f))];
    
    return cell;
}
@end
