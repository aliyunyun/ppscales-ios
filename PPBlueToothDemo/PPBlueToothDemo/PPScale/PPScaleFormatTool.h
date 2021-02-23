//
//  PPScaleFormatTool.h
//  PPBlueToothDemo
//
//  Created by 彭思远 on 2020/8/3.
//  Copyright © 2020 彭思远. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface PPScaleFormatTool : NSObject

+ (NSInteger)numberHexString:(NSString *)aHexString;

+ (NSString *)data2String:(NSData *)data;

+ (Byte)convertDecimalTo0x:(NSInteger) decimal;

+ (NSString *)getHexByDecimal:(NSInteger)decimal;

+ (NSData *)convertHexStrToData:(NSString *)str;

+ (NSString *)getBinaryStrByHexStr:(NSString *)hex;
@end

NS_ASSUME_NONNULL_END
