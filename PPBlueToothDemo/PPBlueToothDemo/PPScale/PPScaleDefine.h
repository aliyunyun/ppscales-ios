//
//  PPScaleDefine.h
//  PPBlueToothDemo
//
//  Created by 彭思远 on 2020/7/31.
//  Copyright © 2020 彭思远. All rights reserved.
//

#ifndef PPScaleDefine_h
#define PPScaleDefine_h

typedef NS_ENUM(NSUInteger, PPUserGender) {
    PPUserGenderFemale, //女性
    PPUserGenderMale,   //男性
};

typedef NS_ENUM(NSUInteger, PPUserUnit) {
    PPUnitKG = 0,   // 千克
    PPUnitLB = 1,   // 磅
    PPUnitJin = 3,  // 斤
};

typedef NS_ENUM(NSUInteger, PPDeviceType) {
    PPDeviceTypeWeight = 1 << 0,    //体重
    PPDeviceTypeBodyFat = 1 << 1,   //体脂
    PPDeviceTypeHearRate = 1 << 2,  //心律
    PPDeviceTypeHistory = 1 << 3,   //历史
    PPDeviceTypeCalcuteInScale = 1 << 4, //秤端计算人体参数
};

typedef NS_ENUM(NSUInteger, PPBodyDetailType) {
     PPBodyTypeThin,             //!< 偏瘦型
     PPBodyTypeLThinMuscle,      //!< 偏瘦肌肉型
     PPBodyTypeMuscular,         //!< 肌肉发达型
    
     PPBodyTypeLackofexercise,   //!< 缺乏运动型
     PPBodyTypeStandard,         //!< 标准型
     PPBodyTypeStandardMuscle,   //!< 标准肌肉型
    
     PPBodyTypeObesFat,          //!< 浮肿肥胖型
     PPBodyTypeLFatMuscle,       //!< 偏胖肌肉型
     PPBodyTypeMuscleFat,        //!< 肌肉型偏胖
};

typedef NS_ENUM(NSUInteger, PPBleSwitchState) {
    PPBleSwitchStateOn, //蓝牙开
    PPBleSwitchStateOff,    //蓝牙关
};

typedef NS_ENUM(NSUInteger, PPBleWorkState) {
    PPBleWorkStateSearching, //扫描中
    PPBleWorkStateSearchStop, //停止扫描
    PPBleWorkStateConnecting, //设备连接中
    PPBleWorkStateConnected, //设备已连接
    PPBleWorkStateDisconnected, //设备已断开
};

#define kBLEDeviceEnergyScale @"Energy Scale"
#define kBLEDeviceHealthScale @"Health Scale"
#define kBLEDeviceADore @"ADORE"
#define kBLEDeviceLFScale @"LFScale"
#define kBLEDeviceBFScale @"BFScale"
#define kBLEDeviceElectronicScale @"Electronic Scale"
#define kBLEDeviceBMScale @"BM Scale"
#define kBLEDeviceBodyFatScale @"BodyFat Scale"
#define KBLEDeviceHumanScale @"Human Scale"
#define kBLEDeviceSHINILITOSCALE @"SHINIL ITO SCALE"
#define kBLEDeviceHeartRateScale @"HeartRate Scale"
#define KBLEDeviceWeightScale @"Weight Scale"
#define KBLEDeviceBodyFatScale1 @"BodyFat Scale1"

#endif /* PPScaleDefine_h */
