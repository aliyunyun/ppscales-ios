//
//  UnitTool.h
//  PPBlueToothDemo
//
//  Created by 彭思远 on 2018/7/27.
//  Copyright © 2018年 彭思远. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, UnitType) {
    Unit_KG = 0,//KG
    Unit_Jin = 3,//斤
    Unit_lb = 1,//lb
};

@interface UnitTool : NSObject

+ (NSString *)getUnitStrWithUnit:(UnitType)unit;

+ (CGFloat)weightValue:(CGFloat)kg withUnit:(UnitType)unit;

+ (NSString *)weight:(CGFloat)weightKG withUnit:(UnitType)unit;
@end
