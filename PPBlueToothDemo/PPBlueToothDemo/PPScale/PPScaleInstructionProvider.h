//
//  PPScaleInstructionProvider.h
//  PPBlueToothDemo
//
//  Created by 彭思远 on 2020/8/1.
//  Copyright © 2020 彭思远. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PPScaleDefine.h"

@class PPUserModel;
NS_ASSUME_NONNULL_BEGIN

@interface PPScaleInstructionProvider : NSObject

- (instancetype)initWithUserModel:(PPUserModel *)model;

- (NSArray <NSData *> *)send2ScaleInstructionByType:(PPDeviceType)type andHistoryState:(BOOL)needHistory;

+ (NSData *)delHistoryDataInstruction;

+ (NSData *)exitBMDJInstruction;

+ (NSData *)intoBMDJInstruction;




@end

NS_ASSUME_NONNULL_END
