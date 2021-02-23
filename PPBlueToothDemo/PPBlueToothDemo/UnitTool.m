//
//  UnitTool.m
//  PPBlueToothDemo
//
//  Created by 彭思远 on 2018/7/27.
//  Copyright © 2018年 彭思远. All rights reserved.
//

#import "UnitTool.h"

@implementation UnitTool


+ (NSString *)weight:(CGFloat)weightKG withUnit:(UnitType)unit{
    CGFloat weight = [UnitTool weightValue:weightKG withUnit:unit];
    NSString *unitStr = [UnitTool getUnitStrWithUnit:unit];
    return [NSString stringWithFormat:@"%.1f %@",weight, unitStr];
}

+ (CGFloat)weightValue:(CGFloat)kg withUnit:(UnitType)unit{
    if (unit==Unit_KG) {
        return kg;
    }
    else if(unit==Unit_lb){
        return [UnitTool Lb_Kg:kg];
    }
    else if(unit==Unit_Jin){
        return [UnitTool Jin_Kg:kg];
    }
    else{
        return kg;
    }
}

+ (CGFloat)Lb_Kg:(CGFloat)kg
{
    return kg*2.2046226;
}

+ (CGFloat)Jin_Kg:(CGFloat)kg
{
    return 2*kg;
}

+ (NSString *)getUnitStrWithUnit:(UnitType)unit{
    if (unit==Unit_KG) {
        return @"kg";
    }
    else if (unit==Unit_lb){
        return @"lb";
    }
    else if (unit==Unit_Jin){
        return @"斤";
    }
    else{
        return @"kg";
    }
}
@end
