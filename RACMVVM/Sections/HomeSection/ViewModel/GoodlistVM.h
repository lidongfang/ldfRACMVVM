//
//  GoodlistVM.h
//  ldfRACMVVM
//
//  Created by aigegou on 2017/2/28.
//  Copyright © 2017年 aigegou. All rights reserved.
//

#import "SuperViewModel.h"
#import "GoodListModel.h"
@interface GoodlistVM : SuperViewModel
//参数 输入i
@property (nonatomic) NSInteger saleOrder;
@property (nonatomic) NSInteger listOrder;
@property (nonatomic) NSInteger iPageSize;
@property (nonatomic) NSInteger iPageNo;
@property (nonatomic,assign) BOOL valiteToLogin;
//参数 输出o
@property (nonatomic,strong) GoodListModel *listModel;
@property (nonatomic,strong) NSMutableArray <GoodListModel*> *outPutArray;
@property (nonatomic,strong) NSMutableDictionary *dic;
@end
