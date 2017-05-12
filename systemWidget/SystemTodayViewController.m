//
//  SystemTodayViewController.m
//  systemWidget
//
//  Created by xiaoshi on 2017/5/12.
//  Copyright © 2017年 xiaoshi. All rights reserved.
//

#import "SystemTodayViewController.h"
#import <NotificationCenter/NotificationCenter.h>
#import "SystemDataTool.h"

@interface SystemTodayViewController () <NCWidgetProviding>

@end

@implementation SystemTodayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self setData];
}
- (void)setData
{
    self.wifiNameLabel.text = [SystemDataTool getWifiName];
}

- (IBAction)clickButton:(UIButton *)sender {
    NSString *url = @"";
    if (sender.tag==11) {
        url = @"App-Prefs:root=WIFI";
    }
    
    if (![url isEqualToString:@""]) {
        [self.extensionContext openURL:[NSURL URLWithString:url] completionHandler:^(BOOL success) {
            
        }];
    }
}

- (void)widgetPerformUpdateWithCompletionHandler:(void (^)(NCUpdateResult))completionHandler {
    // Perform any setup necessary in order to update the view.
    
    // If an error is encountered, use NCUpdateResultFailed
    // If there's no update required, use NCUpdateResultNoData
    // If there's an update, use NCUpdateResultNewData

    completionHandler(NCUpdateResultNewData);
}

@end
