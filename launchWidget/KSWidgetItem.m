//
//  KSWidgetItem.m
//  kamyWidget
//
//  Created by xiaoshi on 2017/5/11.
//  Copyright © 2017年 xiaoshi. All rights reserved.
//

#import "KSWidgetItem.h"

@implementation KSWidgetItem
+ (instancetype)item
{
    return [[KSWidgetItem alloc] init];
}
+ (instancetype)initItemWithIcon:(NSString *)icon title:(NSString *)title url:(NSString *)url
{
    KSWidgetItem *item = [self item];
    item.iconStr = icon;
    item.title = title;
    item.url = url;
    return item;
}

+ (instancetype)initItemWithDic:(NSDictionary *)dic
{
    KSWidgetItem *item = [self item];
    item.iconStr = dic[@"icon"];
    item.title = dic[@"title"];
    item.url = dic[@"url"];
    return item;
}

- (NSDictionary *)itemToDic
{
    return @{@"icon":self.iconStr,@"title":self.title,@"url":self.url};
}
@end
