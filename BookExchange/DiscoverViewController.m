//
//  FirstViewController.m
//  BookExchange
//
//  Created by CY on 5/1/15.
//  Copyright (c) 2015年 LINYC. All rights reserved.
//

#import "DiscoverViewController.h"
#import "SearchHeaderView.h"
#import "Books.h"
#import "JSONModelLib.h"
#import "MBProgressHUD.h"
#import "UIImageView+AFNetWorking.h"

@interface DiscoverViewController ()

@end

@implementation DiscoverViewController{
    CGFloat screenWidth;
    Books *_books;
}
-(void)netConnection
{
    [MBProgressHUD showHUDAddedTo:self.tableView animated:YES];
    
    NSURL *url = [NSURL URLWithString:@"http://192.168.1.16:802/BookHandler.ashx?cmd=getbooklist"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    NSURLSessionTask *sessionTask = [[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (!error) {
            
            [MBProgressHUD hideHUDForView:self.tableView animated:YES];
            
            _books = [[Books alloc] initWithData:data error:nil];
            
            [self.tableView reloadData];
        }
        else{
            NSLog(@"NSURLSessionTask error:%@",error.localizedDescription);
        }
    }];
    
    [sessionTask resume];
}

-(NSArray*)getBookListWithSortType:(int)sortType AndSearchWord:(NSString*)andSearchWord
{
//    if (andSearchWord == nil) {
//        switch (sortType) {
//            case 1:
//                
//                break;
//                
//            default:
//                break;
//        }
//    }
    return nil;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    screenWidth = [UIScreen mainScreen].bounds.size.width;
    
    [self netConnection];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - TableView Function

-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    SearchHeaderView *searchHeaderView = [SearchHeaderView instantiateFromNib];
    [searchHeaderView setFrame:CGRectMake(0, 0, screenWidth, 90)];
    searchHeaderView.delegate = self;
    
    return searchHeaderView;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 90;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _books.bookLists.count;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellId = @"BookCell";
    
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:cellId];
    
    BookModel *bookInfo = _books.bookLists[indexPath.row];
    
    UILabel *lblTitle = (UILabel*)[cell viewWithTag:2001];
    UILabel *lblDetail = (UILabel*)[cell viewWithTag:2002];
    UIImageView *imageCover = (UIImageView*)[cell viewWithTag:2003];
    
    imageCover.contentMode = UIViewContentModeScaleAspectFit;
    [imageCover setImageWithURL:[NSURL URLWithString:bookInfo.faceImageUrl] placeholderImage:[UIImage imageNamed:@"bookfacedefault.jpg"]];
    
    lblTitle.text = [NSString stringWithFormat:@"%@",bookInfo.title];
    
    NSString *detail = [NSString stringWithFormat:@"%@\t贡献者:%@",bookInfo.inputTime,bookInfo.bookAux.userName];
    lblDetail.text = [NSString stringWithFormat:@"%@",detail];
    
    
    return cell;
}

#pragma mark - SearchHeaderView Delegate
-(void)reloadTableViewData
{
    [self netConnection];
}
-(void)segmentedChanged:(UISegmentedControl *)segmented
{
    NSLog(@"index:%lu", segmented.selectedSegmentIndex);
}
@end
