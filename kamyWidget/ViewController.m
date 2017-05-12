//
//  ViewController.m
//  kamyWidget
//
//  Created by xiaoshi on 2017/5/11.
//  Copyright © 2017年 xiaoshi. All rights reserved.
//

#import "ViewController.h"
#import "KSWidgetItem.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.title = @"Kamy欢迎你";
    self.view.backgroundColor = [UIColor whiteColor];
    
    NSMutableArray *itemArray = [NSMutableArray array];
    for (int i=0; i<10; i++) {
        KSWidgetItem *item = [KSWidgetItem initItemWithIcon:@"database" title:@"电池" url:@"App-Prefs:root=Battery"];
        NSDictionary *dic = [item itemToDic];
        [itemArray addObject:dic];
    }
    NSArray *array = [NSArray arrayWithArray:[itemArray copy]];
    
    NSUserDefaults *shared = [[NSUserDefaults alloc] initWithSuiteName:@"group.kamy"];
    [shared setObject:array forKey:ItemArrayUserDefault];
    [shared setObject:@"test" forKey:@"test"];
    [shared synchronize];
    
    NSArray *userDefaultArray = (NSArray *)[[NSUserDefaults standardUserDefaults] valueForKey:ItemArrayUserDefault];
    NSLog(@"%d", userDefaultArray.count);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
