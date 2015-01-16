//
//  ReplyViewController.m
//  BookExchange
//
//  Created by CY on 5/1/15.
//  Copyright (c) 2015年 LINYC. All rights reserved.
//

#import "ReplyViewController.h"
#import "TitleHeaderView.h"

#define FONT_SIZE 16.0f
#define CELL_CONTENT_MARGIN 10.0f
#define CELL_HEIGHT 90.0f

@interface ReplyViewController ()
@property (nonatomic,strong) TitleHeaderView *headerView;
@property (nonatomic,strong) NSMutableArray *tableData;

@property (nonatomic,strong) NSURLSession *urlSession;
@end

@implementation ReplyViewController{
    CGFloat CELL_WIDTH;
    
    NSIndexPath *currentIndexPath;
    
    NSString *getString;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        NSURLSessionConfiguration *sessionConfig = [NSURLSessionConfiguration defaultSessionConfiguration];
        self.urlSession = [NSURLSession sessionWithConfiguration:sessionConfig];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    CELL_WIDTH = [UIScreen mainScreen].bounds.size.width;
    
    self.tableData =  @[@"1\n2\n3\n4\n5\n6", @"123456789012345678901234567890123456789012345678901234567890", @"1\n2", @"1\n2\n3", @"1",@"56789012345678901234567890123456789012345678901234567890", @"1\n2\n3"];
    
    
//    self.headerView = [HeaderView instancetFromNib];
//    self.headerView.backgroundColor = [UIColor colorWithRed:0.59 green:0.85 blue:0.27 alpha:1];
    
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 60)];
    headerView.backgroundColor = [UIColor colorWithRed:0.59 green:0.85 blue:0.27 alpha:1];
    
    UILabel *lblBookName = [[UILabel alloc] initWithFrame:CGRectMake(2.0, 2.0, [UIScreen mainScreen].bounds.size.width-4, 58)];
    lblBookName.numberOfLines = 2;
    lblBookName.lineBreakMode = NSLineBreakByWordWrapping;
    //stickyLabel.backgroundColor = [UIColor colorWithRed:1 green:0.749 blue:0.976 alpha:1];
    lblBookName.textAlignment = NSTextAlignmentCenter;
    lblBookName.text = @"摩托车修理店的未来工作哲学";
//    [self.headerView addSubview:lblBookName];
    [headerView addSubview:lblBookName];
    
    
//    [self.tableView setParallaxHeaderView:self.headerView mode:VGParallaxHeaderModeFill height:60];
//    
//    self.tableView.parallaxHeader.stickyViewPosition = VGParallaxHeaderStickyViewPositionTop;
    self.tableView.tableHeaderView = headerView;
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
//    [self.tableView shouldPositionParallaxHeader];
    
    // Log Parallax Progress
    //NSLog(@"Progress: %f", scrollView.parallaxHeader.progress);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Bar Button Action
- (IBAction)barBtnBack:(id)sender {
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}


#pragma mark - Table view data source

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//
//    return 2;
//}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.tableData.count;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    currentIndexPath = indexPath;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    /*
    UILabel *lblContent;
    
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"ReplyCell"];
    if (cell != nil) {
        lblContent = [[UILabel alloc] initWithFrame:CGRectZero];
        lblContent.numberOfLines = 0;
        lblContent.lineBreakMode = NSLineBreakByWordWrapping;
        lblContent.layer.borderWidth = 1.0;
        lblContent.tag = 2014;
        
        [cell.contentView addSubview:lblContent];
    }
    if (!lblContent) {
        lblContent = (UILabel*)[cell viewWithTag:2014];
    }
    lblContent.text = self.tableData[indexPath.row];
    
//    UILabel *lblBookName = (UILabel *)[cell viewWithTag:2011];
//    UILabel *lblReplyTime = (UILabel *)[cell viewWithTag:2012];
    UILabel *lblFloor = (UILabel *)[cell viewWithTag:2013];
    lblFloor.text = [NSString stringWithFormat:@"%ld楼",indexPath.row+1];
    
    
    CGSize constraint = CGSizeMake(CELL_CONTENT_WIDTH - (CELL_CONTENT_MARGIN * 2), 20000.0f);
    
    CGSize size = [lblContent.text sizeWithFont:[UIFont systemFontOfSize:FONT_SIZE] constrainedToSize:constraint lineBreakMode:UILineBreakModeWordWrap];
    
    [lblContent setFrame:CGRectMake(CELL_CONTENT_MARGIN, 32, CELL_CONTENT_WIDTH - (CELL_CONTENT_MARGIN * 2), MAX(size.height, 21.0f))];
    
    return cell;
     */
    UITableViewCell *cell;
    UILabel *label = nil;
    UILabel *lblNikeName = nil;
    UILabel *lblTime = nil;
    UILabel *lblFloor = nil;
    UIView *bgView = nil;
    UIButton *btnLike = nil;
    
    cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:@"Cell"];
        
        label = [[UILabel alloc] initWithFrame:CGRectZero];
        [label setLineBreakMode:UILineBreakModeWordWrap];
        [label setMinimumFontSize:FONT_SIZE];
        [label setNumberOfLines:0];
        [label setFont:[UIFont systemFontOfSize:FONT_SIZE]];
        [label setTag:2014];
        
        [[label layer] setBorderWidth:2.0f];
        
        [cell.contentView addSubview:label];
        
        
        //--
        bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, CELL_WIDTH, 32)];
        bgView.backgroundColor = [UIColor colorWithRed:0.8 green:0.8 blue:0.8 alpha:1];
        bgView.tag = 2010;
        [cell.contentView addSubview:bgView];
        
        //--
        lblNikeName = [[UILabel alloc] initWithFrame:CGRectMake(CELL_CONTENT_MARGIN, CELL_CONTENT_MARGIN-4, 160, 21)];
        lblNikeName.font = [UIFont systemFontOfSize:12.0];
        lblNikeName.tag = 2011;
        [cell.contentView addSubview:lblNikeName];
        //--
        lblFloor = [[UILabel alloc] initWithFrame:CGRectMake(CELL_WIDTH - (35 + CELL_CONTENT_MARGIN), CELL_CONTENT_MARGIN-4, 35, 21)];
        lblFloor.font = [UIFont systemFontOfSize:10.0];
        lblFloor.tag = 2013;
        [cell.contentView addSubview:lblFloor];
        //--
        lblTime = [[UILabel alloc] initWithFrame:CGRectMake(CELL_WIDTH - lblFloor.bounds.size.width - 105 - (CELL_CONTENT_MARGIN*2), CELL_CONTENT_MARGIN-4, 105, 21)];
        lblTime.font = [UIFont systemFontOfSize:10.0];
        lblTime.tag = 2012;
        [cell.contentView addSubview:lblTime];
        
        //--
        btnLike = [[UIButton alloc] initWithFrame:CGRectZero];
        [btnLike setTitle:@"赞" forState:UIControlStateNormal];
        [btnLike setTitleColor:btnLike.tintColor forState:UIControlStateNormal];
        [btnLike.titleLabel setFont:[UIFont systemFontOfSize:10.0]];
        btnLike.tag = 2015;
        [btnLike addTarget:self action:@selector(btnLikeClick:) forControlEvents:UIControlEventTouchUpInside];
        [cell.contentView addSubview:btnLike];
        
    }
    NSString *text = [self.tableData objectAtIndex:[indexPath row]];
    
    CGSize constraint = CGSizeMake(CELL_WIDTH - (CELL_CONTENT_MARGIN * 2), 20000.0f);
    
//    CGSize size = [text sizeWithFont:[UIFont systemFontOfSize:FONT_SIZE] constrainedToSize:constraint lineBreakMode:UILineBreakModeWordWrap];
    CGSize size = [text boundingRectWithSize:constraint options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:FONT_SIZE]} context:nil].size;
    
    if (!label){
        label = (UILabel*)[cell viewWithTag:2014];
    }
    if (!bgView) {
        bgView = (UIView*)[cell viewWithTag:2010];
    }
    if (!lblNikeName){
        lblNikeName = (UILabel*)[cell viewWithTag:2011];
    }
    if (!lblTime){
        lblTime = (UILabel*)[cell viewWithTag:2012];
    }
    if (!lblFloor){
        lblFloor = (UILabel*)[cell viewWithTag:2013];
    }
    if (!btnLike) {
        btnLike = (UIButton*)[cell viewWithTag:2015];
    }
    
    label.text = text;
    
    lblNikeName.text = [NSString stringWithFormat:@"Name %lu",indexPath.row];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyy-MM-dd hh:mm:ss";
    lblTime.text = [formatter stringFromDate:[NSDate date]];
    
    lblFloor.text = [NSString stringWithFormat:@"%ld00楼",indexPath.row+1];
    
    [label setFrame:CGRectMake(CELL_CONTENT_MARGIN, 34, CELL_WIDTH - (CELL_CONTENT_MARGIN * 2), MAX(size.height, 23.0f))];
    [btnLike setFrame:CGRectMake(CELL_WIDTH - (20 + CELL_CONTENT_MARGIN),CGRectGetMaxY(label.frame) + 4, 21, 21)];
    
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    /*
    NSString *text = self.tableData[indexPath.row];
    
    CGSize constraint = CGSizeMake(CELL_CONTENT_WIDTH - (CELL_CONTENT_MARGIN * 2), 20000.0f);
    
    CGSize size = [text sizeWithFont:[UIFont systemFontOfSize:FONT_SIZE] constrainedToSize:constraint lineBreakMode:UILineBreakModeWordWrap];
    
    CGFloat height = MAX(size.height, 21.0f);
    
    return height + 50;
    
//    return MAX(lblContent.bounds.size.height+40,90);
     */
    
    
    NSString *text = [self.tableData objectAtIndex:[indexPath row]];
    
    CGSize constraint = CGSizeMake(CELL_WIDTH - (CELL_CONTENT_MARGIN * 2), 20000.0f);
    
//    CGSize size = [text sizeWithFont:[UIFont systemFontOfSize:FONT_SIZE] constrainedToSize:constraint lineBreakMode:UILineBreakModeWordWrap];
    CGSize size = [text boundingRectWithSize:constraint options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:FONT_SIZE]} context:nil].size;
    
    CGFloat height = MAX(size.height, 20.0f);
    
    return height + (CELL_CONTENT_MARGIN * 2)+40;
}
-(void)btnLikeClick:(id)sender
{
    UITableViewCell *cell = (UITableViewCell*)[[sender superview] superview];
    currentIndexPath = [self.tableView indexPathForCell:cell];
//
//    [[[UIAlertView alloc] initWithTitle:@"OH you click" message:[NSString stringWithFormat:@"%lu",currentIndexPath.row] delegate:self cancelButtonTitle:@"I know" otherButtonTitles:@"second btn", nil] show];
    NSLog(@"%lu",currentIndexPath.row);
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://192.168.1.18:802/BookHandler.ashx?NO=%lu",currentIndexPath.row]];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    NSURLSessionDataTask *dataTask = [[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (!error) {
            getString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
            NSLog(@"%@",getString);
        }
        else{
            NSLog(@"error: %@",error.localizedDescription);
        }
    }];
    [dataTask resume];
    
    [[[UIAlertView alloc] initWithTitle:@"OH you Data" message:getString delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil] show];
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
