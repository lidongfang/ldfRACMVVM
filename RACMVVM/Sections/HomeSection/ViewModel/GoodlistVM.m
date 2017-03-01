//
//  GoodlistVM.m
//  ldfRACMVVM
//
//  Created by aigegou on 2017/2/28.
//  Copyright © 2017年 aigegou. All rights reserved.
//

#import "GoodlistVM.h"

@implementation GoodlistVM
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self initialize];
    }
    return self;
}
- (void)initialize {
    self.listModel=[[GoodListModel alloc]init];
    [[RACObserve(self, iPageNo) filter:^BOOL(NSNumber *value) {
        return value.integerValue!=0;
    }] subscribeNext:^(id x) {
        [self getGoodsList:[x integerValue]];
    }];
    [[RACObserve(self.listModel, keyword) filter:^BOOL(NSString *value) {
        return value.length!=0;
    }] subscribeNext:^(id x) {
        NSLog(@"------%@",[NSString stringWithFormat:@"%@",x]);
    }];
    self.listOrder = 1;
    self.iPageSize = 10;
    self.outPutArray=[[NSMutableArray alloc]init];
    
}

- (void)getGoodsList:(NSInteger)page {
    NSDictionary *_dic = @{@"pageSize":[NSNumber numberWithInteger:self.iPageSize],@"pageNo":@(page)};
    [self.requestBeforeObject sendNext:nil];
    @weakify(self);
    [[LdfNetWorkingClient sharedInstance] requestForUrl:@"" withParams:_dic completion:^(NSDictionary *netRequestResponseDictionary, NSError *error) {
        @strongify(self);
        if (error==nil) {
            if ([Tools Object_IsNotBlank:netRequestResponseDictionary]) {
                [self.successObject sendNext:nil];
                //处理数据源，转为GoodListModel模型放在容器outPutArray中，通过Controller中唯一的一个GoodlistVM来调用
                
            }else{
                [self.errorObject sendNext:@"没有找到符合的商品"];
            }
        }else{
            [self.errorObject sendNext:@"网络出现异常，请检查您的网络！"];
        }
    }];
}
@end
