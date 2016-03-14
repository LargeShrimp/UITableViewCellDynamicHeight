//
//  CustomCell.h
//  DynamicCellH
//
//  Created by taitanxiami on 16/3/14.
//  Copyright © 2016年 taitanxiami. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *cellTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *cellContentLabel;
@property (weak, nonatomic) IBOutlet UILabel *cellDateLabel;
@end
