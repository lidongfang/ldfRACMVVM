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
    [[RACObserve(self, iPageNo) filter:^BOOL(NSNumber *value) {
        return value.integerValue!=0;
    }] subscribeNext:^(id x) {
        [self getGoodsList:[x integerValue]];
    }];
    self.iSearchType = @"gcIdSearch";
    self.keyword = @"200";
    self.listOrder = 1;
    self.iSortField = @"";
    self.iSortOrder = @"";
    self.iGoodsListArr = [[NSMutableArray alloc] init];
    self.iPageSize = 10;
    self.selectedSignal = [RACSubject subject];
}

- (void)getGoodsList:(NSInteger)page {
    NSDictionary *_dic = @{@"searchType":self.iSearchType,@"keyword":self.keyword,@"sortField":self.iSortField,@"sortOrder":self.iSortOrder,@"specFilter":self.goodsTypeStr.length== 0?@"":self.goodsTypeStr,@"brandId":@"",@"pageSize":[NSNumber numberWithInteger:self.iPageSize],@"pageNo":@(page)};
    [self.requestBeforeObject sendNext:nil];
    @weakify(self);
    [[LdfNetWorkingClient sharedInstance] requestForUrl:@"" withParams:_dic completion:^(NSDictionary *netRequestResponseDictionary, NSError *error) {
        @strongify(self);
        if (error==nil) {
            if ([Tools Object_IsNotBlank:netRequestResponseDictionary]) {
                [self.successObject sendNext:nil];
            }else{
                [self.errorObject sendNext:@"没有找到符合的商品"];
            }
        }else{
            [self.errorObject sendNext:@"网络出现异常，请检查您的网络！"];
        }
    }];
}
@end
