//
//  PPBodyBaseModel.h
//  PPBlueToothDemo
//
//  Created by 彭思远 on 2020/7/31.
//  Copyright © 2020 彭思远. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface PPBodyBaseModel : NSObject

/// 体重 
@property (nonatomic, assign) NSInteger weight;

/// 阻抗
@property (nonatomic, assign) NSInteger impedance;

/// 是否结束
@property (nonatomic, assign) BOOL isEnd;

/// 心率
@property (nonatomic, assign) NSInteger heartRate;

/// 心率是否结束
@property (nonatomic, assign) NSInteger isHeartRatingEnd;

/// 是否有阻抗
@property (nonatomic, assign) BOOL haveImpedance;

@end

NS_ASSUME_NONNULL_END
