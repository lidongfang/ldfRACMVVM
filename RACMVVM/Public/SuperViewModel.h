//
//  SuperViewModel.h
//  ldfRACMVVM
//
//  Created by aigegou on 2017/2/27.
//  Copyright © 2017年 aigegou. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SuperViewModel : NSObject
@property (nonatomic, strong) RACSubject *requestBeforeObject;
@property (nonatomic, strong) RACSubject *successObject;
@property (nonatomic, strong) RACSubject *failureObject;
@property (nonatomic, strong) RACSubject *errorObject;
@end
