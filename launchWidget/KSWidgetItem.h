//
//  KSWidgetItem.h
//  kamyWidget
//
//  Created by xiaoshi on 2017/5/11.
//  Copyright © 2017年 xiaoshi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KSWidgetItem : NSObject
@property (nonatomic, copy) NSString *iconStr;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *url;
+ (instancetype)initItemWithIcon:(NSString *)icon title:(NSString *)title url:(NSString *)url;
+ (instancetype)initItemWithDic:(NSDictionary *)dic;
- (NSDictionary *)itemToDic;
@end
