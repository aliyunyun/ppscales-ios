//
//  ConnectDeviceViewController.h
//  PPBlueToothDemo
//
//  Created by 彭思远 on 2018/7/26.
//  Copyright © 2018年 彭思远. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PPScale.h"

@interface ConnectDeviceViewController : UIViewController

@property (nonatomic, assign) NSInteger height;
@property (nonatomic, assign) NSInteger age;
@property (nonatomic, assign) NSInteger unit;
@property (nonatomic, assign) NSInteger sex;
@property (nonatomic, assign) NSInteger group;
@property (nonatomic, strong) void(^BodyDataHandler)(PPBodyFatModel *model);
@end
