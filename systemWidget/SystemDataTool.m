
//
//  SystemDataTool.m
//  kamyWidget
//
//  Created by xiaoshi on 2017/5/12.
//  Copyright © 2017年 xiaoshi. All rights reserved.
//

#import "SystemDataTool.h"
#import <SystemConfiguration/SystemConfiguration.h>
#import <SystemConfiguration/CaptiveNetwork.h>
#import <NetworkExtension/NetworkExtension.h>

@implementation SystemDataTool
+ (NSString *)getWifiName
{
    NSString *wifiName = @"未连接";
    CFArrayRef wifiInterfaces = CNCopySupportedInterfaces();
    if (!wifiInterfaces) {
        return @"未连接";
    }
    NSArray *interfaces = (__bridge NSArray *)wifiInterfaces;
    for (NSString *name in interfaces) {
        CFDictionaryRef dicRef = CNCopyCurrentNetworkInfo((__bridge CFStringRef)(name));
        if (dicRef) {
            NSDictionary *netInfo = (__bridge NSDictionary *)dicRef;
            wifiName = [netInfo objectForKey:(__bridge NSString *)kCNNetworkInfoKeySSID];
        }
        CFRelease(dicRef);
    }
    CFRelease(wifiInterfaces);
    return wifiName;
}
@end
