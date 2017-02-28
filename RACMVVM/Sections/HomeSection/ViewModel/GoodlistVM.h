//
//  GoodlistVM.h
//  ldfRACMVVM
//
//  Created by aigegou on 2017/2/28.
//  Copyright © 2017年 aigegou. All rights reserved.
//

#import "SuperViewModel.h"

@interface GoodlistVM : SuperViewModel
@property (nonatomic , strong) NSString *goodsTypeStr;
@property (nonatomic, strong) NSString  *goodsBrandID;
@property (nonatomic, strong) NSString  *keyword;
@property (nonatomic,strong) NSString *iSearchType;
@property (nonatomic,strong) NSString *iSortField;
@property (nonatomic,strong) NSString *iSortOrder;
@property (nonatomic) NSInteger saleOrder;
@property (nonatomic) NSInteger listOrder;
@property (nonatomic) NSInteger iPageSize;
@property (nonatomic) NSInteger iPageNo;
@property (nonatomic, strong) RACSubject *selectedSignal;
@property (strong, nonatomic) NSArray *iGoodsListArr;
@end
