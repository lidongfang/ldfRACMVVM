//
//  GoodListModel.h
//  ldfRACMVVM
//
//  Created by aigegou on 2017/2/28.
//  Copyright © 2017年 aigegou. All rights reserved.
//

#import "SuperModel.h"

@interface GoodListModel : SuperModel
@property (nonatomic , strong) NSString *goodsTypeStr;
@property (nonatomic, strong) NSString  *goodsBrandID;
@property (nonatomic, strong) NSString  *keyword;
@property (nonatomic,strong) NSString *iSearchType;
@property (nonatomic,strong) NSString *iSortField;
@property (nonatomic,strong) NSString *iSortOrder;

@end
