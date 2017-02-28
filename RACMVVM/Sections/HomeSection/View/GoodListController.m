//
//  GoodListController.m
//  ldfRACMVVM
//
//  Created by aigegou on 2017/2/28.
//  Copyright © 2017年 aigegou. All rights reserved.
//

#import "GoodListController.h"

@interface GoodListController ()

@end

@implementation GoodListController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self bind];
    self.listVM.iPageNo=1;
}
-(void)bind{
    @weakify(self);
    self.listVM=[[GoodlistVM alloc]init];
    [self.listVM.requestBeforeObject subscribeNext:^(id x) {
        @strongify(self);
        //弹出loading
    }];
    [self.listVM.successObject subscribeNext:^(id x) {
        @strongify(self);
        //隐藏loading，刷新view
    }];
    [self.listVM.errorObject subscribeNext:^(id x) {
       //隐藏loading，并且弹出错误消息
    }];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

@end
