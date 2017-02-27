//
//  SuperViewModel.m
//  ldfRACMVVM
//
//  Created by aigegou on 2017/2/27.
//  Copyright © 2017年 aigegou. All rights reserved.
//

#import "SuperViewModel.h"

@implementation SuperViewModel
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.successObject = [RACSubject subject];
        self.failureObject = [RACSubject subject];
        self.errorObject = [RACSubject subject];
        self.requestBeforeObject = [RACSubject subject];
    }
    return self;
}
@end
