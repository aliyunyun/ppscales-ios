//
//  PPUserModel.h
//  PPBlueToothDemo
//
//  Created by 彭思远 on 2020/7/31.
//  Copyright © 2020 彭思远. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PPScaleDefine.h"

NS_ASSUME_NONNULL_BEGIN

@interface PPUserModel : NSObject

/// 用户身高 单位是厘米
@property (nonatomic, assign) NSInteger userHeight;

/// 用户性别
@property (nonatomic, assign) PPUserGender userGender;

/// 用户年龄
@property (nonatomic, assign) NSInteger userAge;

/// 单位
@property (nonatomic, assign) PPUserUnit userUnit;


- (instancetype)initWithUserHeight:(NSInteger)userHeight gender:(PPUserGender)userGender age:(NSInteger)userAge andUnit:(PPUserUnit)userUnit;
@end

NS_ASSUME_NONNULL_END
