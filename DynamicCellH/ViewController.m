//
//  ViewController.m
//  DynamicCellH
//
//  Created by taitanxiami on 16/3/14.
//  Copyright © 2016年 taitanxiami. All rights reserved.
//

#import "ViewController.h"
#import "CustomCell.h"
#import "NSString+Ext.h"
#import "CustomCellWithXib.h"
#define ScreenWidth     [UIScreen mainScreen].bounds.size.width
#define ScreenHeight     [UIScreen mainScreen].bounds.size.height

#define SYSTEM_VERSION_EQUAL_TO(v)                  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedSame)
#define SYSTEM_VERSION_GREATER_THAN(v)              ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending)
#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN(v)                 ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(v)     ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedDescending)

static NSString *const CellIdentify = @"cell";
static NSString *const Cell2Identiy = @"cell2";

@interface ViewController ()
<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong)NSMutableArray *items;
@property (nonatomic, strong) UITableViewCell *cella;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.items = [[NSMutableArray alloc] init];
    
    [self.items addObject:@"Happiness is having a large, loving, caring, close-knit family in another city."];
    [self.items addObject:@"When I am abroad, I always make it a rule never to criticize or attack the government of my own country. I make up for lost time when I come home."];
    [self.items addObject:@"After two years in Washington, I often long for the realism "];
    [self.items addObject:@"It is a profitable thing, if one is wise, to seem foolish."];
    [self.items addObject:@"Bill Gates is a very rich man today... and do you want to know why? The answer is one word: versions."];
    [self.items addObject:@"At the worst, a house unkept cannot be so distressing as a life unlived.\n\n\t\t-Dame Rose Macaulay (1881 - 1958)"];
    [self.items addObject:@"It is curious that physical courage should be so common in the world and moral courage so rare.\n\n\t\t-Mark Twain (1835 - 1910)"];
    [self.items addObject:@"The knowledge of the world is only to be acquired in the world, and not in a closet.\n\n\t\t-Lord Chesterfield (1694 - 1773), Letters to His Son, 1746, published 1774"];
    [self.items addObject:@"What lies behind us and what lies before us are tiny matters compared to what lies within us.\n\n\t\t-Ralph Waldo Emerson (1803 - 1882), (attributed)"];
    [self.items addObject:@"At the worst, a house unkept cannot be so distressing as a life unlived.\n\n\t\t-Dame Rose Macaulay (1881 - 1958)"];
    [self.items addObject:@"What lies behind us and what lies before us are tiny matters compared to what lies within us.\n\n\t\t-Ralph Waldo Emerson (1803 - 1882), (attributed)"];
    [self.items addObject:@"When I am abroad, I always make it a rule never to criticize or attack the government of my own country. I make up for lost time when I come home.\n\n\t\t-Sir Winston Churchill (1874 - 1965)"];
    [self.items addObject:@"After two years in Washington, I often long for the realism and sincerity of Hollywood.\n\n\t\t-Fred Thompson, Speech before the Commonwealth Club of California"];
    
    
    
    UINib *nib = [UINib nibWithNibName:@"CustomCellWithXib" bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:Cell2Identiy];
    
}

#pragma mark - UITableView DataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.items.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
//    CustomCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentify ];
//    cell.cellContentLabel.text = self.items[indexPath.row];
//    cell.cellContentLabel.tag = 1000;
    
    CustomCellWithXib *cell = [tableView dequeueReusableCellWithIdentifier:Cell2Identiy];
    if (!cell) {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"CustomCellWithXib" owner:nil options:nil] lastObject];
    }
    cell.contentLabel.text = self.items[indexPath.row];

    return cell;
}

#pragma mark - UITableView Delegate

-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 44;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if([[[UIDevice currentDevice] systemVersion] floatValue] >= 8) {
        
        return UITableViewAutomaticDimension;
    }
    static CustomCellWithXib *cell = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        cell = [self.tableView dequeueReusableCellWithIdentifier:Cell2Identiy];
    });
    
// Method 1:
//        UILabel *label = nil;
//        if (!label) {            
//            label = [cell.contentView viewWithTag:1000];
//        }
//        NSString *contentStr = self.items[indexPath.row];
//        cell.contentLabel.text = contentStr;
//        CGSize s = [contentStr calculateSize:CGSizeMake(cell.contentLabel.frame.size.width, FLT_MAX) font:cell.contentLabel.font];
//        CGFloat defaultHeight = cell.contentView.frame.size.height;
//        CGFloat height = s.height > defaultHeight ? s.height : defaultHeight;
//        NSLog(@"h=%f", height);
//        return 1  + height;
        
// Method 2:
    
        cell.contentLabel.text = self.items[indexPath.row];
        CGSize size = [cell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize];
        NSLog(@"h=%f", size.height + 1);
        return 1  + size.height;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
