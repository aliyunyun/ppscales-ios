//
//  PPScaleManager.h
//  PPBlueToothDemo
//
//  Created by 彭思远 on 2020/7/31.
//  Copyright © 2020 彭思远. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreBluetooth/CoreBluetooth.h>
#import "PPScaleDefine.h"

@class PPScaleManager;
@class PPBodyHistoryBaseModel;
@class PPBodyFatModel;
@class PPBodyBaseModel;
@class PPDeviceModel;
@class PPUserModel;

/// 蓝牙状态监听
@protocol PPBleStateInterface <NSObject>

@optional

/// 监听蓝牙的工作状态
- (void)monitorBluetoothWorkState:(PPBleWorkState)state;

/// 监听蓝牙开关的状态
- (void)monitorBluetoothSwitchState:(CBManagerState)state API_AVAILABLE(ios(10.0));

/// 监听蓝牙授权状态
- (void)monitorBluetoothAuthorState:(CBManagerAuthorization)state API_AVAILABLE(ios(13.0));

@end


/// 蓝牙数据监听
@protocol PPDataInterface <NSObject>

/// 监听秤发出的锁定数据
- (void)scaleManager:(PPScaleManager *)manager monitorLockData:(PPBodyFatModel *)model;

@optional

/// 监听秤发出的过程数据
- (void)scaleManager:(PPScaleManager *)manager monitorProcessData:(PPBodyBaseModel *)model;

/// 监听秤发出的历史数据
- (void)scaleManager:(PPScaleManager *)manager monitorHistorData:(PPBodyHistoryBaseModel *)model;
@end

@interface PPScaleManager : NSObject

/// 蓝牙状态监听
@property (nonatomic, weak) id<PPBleStateInterface> stateInterface;

/// 蓝牙数据监听代理
@property (nonatomic, weak) id<PPDataInterface> dataInterface;

/// 对象的实例化方法
/// @param addressList Mac地址的数组
/// @param filterDeviceNameArr 设备名称的数组
/// @param userModel 用户对象
- (instancetype)initWithMacAddressList:(NSArray <NSString *>*)addressList filterDeviceNameArr:(NSArray<NSString *> *)filterDeviceNameArr andUserModel:(PPUserModel *)userModel;

/// 开始扫描附近设备
- (void)startSearching;

/// 停止扫描切断开当前连接的设备
- (void)disconnect;

/// 当前连接着的设备
- (PPDeviceModel *)currentDevice;

/// 连接闭目单脚设备
- (void)connectBMDJScale;

/// 停止扫描切断开闭目单脚的设备
- (void)disconnectBMScale;

/// 闭目单脚设备进入准备状态
/// @param start 是否进入了准备状态
- (void)BMScaleStartTiming:(void(^)(BOOL isSuccess))start;

/// 设备退出闭目单脚状态
/// @param exit 是否退出了闭目单脚
- (void)BMScaleExitTiming:(void(^)(BOOL isSuccess))exit;

/// 监听闭目单脚设备站立时间
/// @param timeInterval 站立时间的回调
- (void)BMScaleTimeInterval:(void(^)(BOOL isEnd, NSInteger timeInterval, BOOL isFailed))timeInterval;

@end

