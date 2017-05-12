//
//  KSWidgetCell.m
//  kamyWidget
//
//  Created by xiaoshi on 2017/5/11.
//  Copyright © 2017年 xiaoshi. All rights reserved.
//

#import "KSWidgetCell.h"

@interface KSWidgetCell()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@end

@implementation KSWidgetCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setItem:(KSWidgetItem *)item
{
    _item = item;
    self.imageView.image = [UIImage imageNamed:item.iconStr];
    self.titleLabel.text = item.title;
}
@end
