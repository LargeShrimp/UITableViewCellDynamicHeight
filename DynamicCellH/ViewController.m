//
//  ViewController.m
//  DynamicCellH
//
//  Created by taitanxiami on 16/3/14.
//  Copyright © 2016年 taitanxiami. All rights reserved.
//

#import "ViewController.h"
#import "CustomCell.h"
static NSString *const CellIdentify = @"cell";

@interface ViewController ()
<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong)NSMutableArray *items;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.items = [[NSMutableArray alloc] init];
    
    [self.items addObject:@"Happiness is having a large, loving, caring, close-knit family in another city.\n\n\t\t-George Burns (1896 - 1996)"];
    [self.items addObject:@"When I am abroad, I always make it a rule never to criticize or attack the government of my own country. I make up for lost time when I come home.\n\n\t\t-Sir Winston Churchill (1874 - 1965)"];
    [self.items addObject:@"After two years in Washington, I often long for the realism and sincerity of Hollywood.\n\n\t\t-Fred Thompson, Speech before the Commonwealth Club of California"];
    [self.items addObject:@"It is a profitable thing, if one is wise, to seem foolish.\n\n\t\t-Aeschylus (525 BC - 456 BC)"];
    [self.items addObject:@"Bill Gates is a very rich man today... and do you want to know why? The answer is one word: versions.\n\n\t\t-Dave Barry"];
    [self.items addObject:@"At the worst, a house unkept cannot be so distressing as a life unlived.\n\n\t\t-Dame Rose Macaulay (1881 - 1958)"];
    [self.items addObject:@"It is curious that physical courage should be so common in the world and moral courage so rare.\n\n\t\t-Mark Twain (1835 - 1910)"];
    [self.items addObject:@"The knowledge of the world is only to be acquired in the world, and not in a closet.\n\n\t\t-Lord Chesterfield (1694 - 1773), Letters to His Son, 1746, published 1774"];
    [self.items addObject:@"What lies behind us and what lies before us are tiny matters compared to what lies within us.\n\n\t\t-Ralph Waldo Emerson (1803 - 1882), (attributed)"];
    [self.items addObject:@"At the worst, a house unkept cannot be so distressing as a life unlived.\n\n\t\t-Dame Rose Macaulay (1881 - 1958)"];
    [self.items addObject:@"What lies behind us and what lies before us are tiny matters compared to what lies within us.\n\n\t\t-Ralph Waldo Emerson (1803 - 1882), (attributed)"];
    [self.items addObject:@"When I am abroad, I always make it a rule never to criticize or attack the government of my own country. I make up for lost time when I come home.\n\n\t\t-Sir Winston Churchill (1874 - 1965)"];
    [self.items addObject:@"After two years in Washington, I often long for the realism and sincerity of Hollywood.\n\n\t\t-Fred Thompson, Speech before the Commonwealth Club of California"];
    
    
    
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 85;
//    self.tableView.tableFooterView = [UIView new];
    
}

#pragma mark - UITableView DataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.items.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    CustomCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentify];
    cell.cellContentLabel.text = self.items[indexPath.row];
    return cell;
}

#pragma mark - UITableView Delegate

//-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
//    
//}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
