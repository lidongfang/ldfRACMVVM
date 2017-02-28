//
//  ViewController.m
//  ldfRACMVVM
//
//  Created by aigegou on 2017/2/27.
//  Copyright © 2017年 aigegou. All rights reserved.
//

#import "ViewController.h"
#import "GoodListController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.title = @"测试标题";
    [self presentViewController:[[GoodListController alloc]init] animated:YES completion:^{
        
    }];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
