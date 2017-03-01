//
//  GoodListController.m
//  ldfRACMVVM
//
//  Created by aigegou on 2017/2/28.
//  Copyright © 2017年 aigegou. All rights reserved.
//

#import "GoodListController.h"

@interface GoodListController ()
@property (weak, nonatomic) IBOutlet UITextField *textFiled;


@end

@implementation GoodListController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self bind];
    self.listVM.iPageNo=1;
    @weakify(self);
    [[self.textFiled.rac_textSignal
      filter:^BOOL(NSString*text){
          return text.length > 3;
      }]subscribeNext:^(id x){
         @strongify(self);
         self.listVM.listModel.keyword=[NSString stringWithFormat:@"%@",x];
     }];
}
-(void)bind{
    @weakify(self);
    self.listVM=[[GoodlistVM alloc]init];
    [self.listVM.requestBeforeObject subscribeNext:^(id x) {
        @strongify(self);
        //弹出loading
//        [SVProgressHUD showWithStatus:@"数据加载中"];
//        [SVProgressHUD setDefaultAnimationType:SVProgressHUDAnimationTypeNative];
    }];
    [self.listVM.successObject subscribeNext:^(id x) {
        @strongify(self);
        //隐藏loading，获取GoodListModel数据，刷新view
    }];
    [self.listVM.errorObject subscribeNext:^(id x) {
       //隐藏loading，并且弹出错误消息
    }];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

@end
