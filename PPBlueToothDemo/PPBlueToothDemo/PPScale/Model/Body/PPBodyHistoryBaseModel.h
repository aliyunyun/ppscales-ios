//
//  PPBodyHistoryBaseModel.h
//  PPBlueToothDemo
//
//  Created by 彭思远 on 2020/7/31.
//  Copyright © 2020 彭思远. All rights reserved.
//

#import "PPBodyBaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface PPBodyHistoryBaseModel : PPBodyBaseModel

/// 时间 yyyy-mm-dd HH:mm:ss
@property (nonatomic, copy) NSString *dateStr;
@end

NS_ASSUME_NONNULL_END
