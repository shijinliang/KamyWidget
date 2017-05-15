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
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"AllWidget" ofType:@"plist"];
    NSDictionary *dataDic = [NSDictionary dictionaryWithContentsOfFile:path];
    NSArray *items = dataDic[@"items"];
    
    NSUserDefaults *shared = [[NSUserDefaults alloc] initWithSuiteName:@"group.kamy"];
    [shared setObject:items forKey:ItemArrayUserDefault];
    [shared synchronize];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
