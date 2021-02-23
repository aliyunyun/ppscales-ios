//
//  ConnectDeviceViewController.m
//  PPBlueToothDemo
//
//  Created by 彭思远 on 2018/7/26.
//  Copyright © 2018年 彭思远. All rights reserved.
//

#import "ConnectDeviceViewController.h"
#import "UnitTool.h"

@interface ConnectDeviceViewController ()<PPDataInterface, PPBleStateInterface>

@property (weak, nonatomic) IBOutlet UILabel *currentWeightLabel;
@property (weak, nonatomic) IBOutlet UILabel *bleConnectStateLabel;

@property (nonatomic, strong) PPScaleManager *scaleManager;
@end

@implementation ConnectDeviceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self search];
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
}

- (void)search{
    PPUserModel *userModel = [[PPUserModel alloc] initWithUserHeight:self.height gender:PPUserGenderMale age:self.age andUnit:self.unit];
    NSMutableArray *arr = [[NSUserDefaults standardUserDefaults] arrayForKey:@"deviceMac"].mutableCopy;
    self.scaleManager = [[PPScaleManager alloc] initWithMacAddressList:arr filterDeviceNameArr:nil andUserModel:userModel];
    self.scaleManager.stateInterface = self;
    self.scaleManager.dataInterface = self;
    [self.scaleManager startSearching];

}

- (void)monitorProcessData:(PPBodyBaseModel *)model{
    NSLog(@"monitorProcessData:%@", model);
    self.currentWeightLabel.text = [UnitTool weight:model.weight / 100.0 withUnit:self.unit];

}

- (void)monitorLockData:(PPBodyFatModel *)model andCurrentDevice:(PPDeviceModel *)device{
    
    NSLog(@"monitorLockData:%@", model);
    NSLog(@"currentDevice:%@",device);
    self.currentWeightLabel.text = [UnitTool weight:model.ppWeightKg withUnit:self.unit];
    //停止搜索
    [self.scaleManager disconnect];
    
    self.BodyDataHandler(model);
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)monitorHistorData:(PPBodyHistoryBaseModel *)model{
    NSLog(@"monitorHistorData:%@", model);
}


- (void)monitorBluetoothWorkState:(PPBleWorkState)state{
    NSLog(@"monitorBluetoothWorkState:%ld", state);
    switch (state) {
        case PPBleWorkStateSearching:
            NSLog(@"扫描中");
            self.bleConnectStateLabel.text = @"扫描中";
            break;
        case PPBleWorkStateSearchStop:
            NSLog(@"停止扫描");
            self.bleConnectStateLabel.text = @"停止扫描";

            break;
        case PPBleWorkStateConnecting:
            NSLog(@"设备连接中");
            self.bleConnectStateLabel.text = @"设备连接中";

            break;
        case PPBleWorkStateConnected:
            NSLog(@"设备已连接");
            self.bleConnectStateLabel.text = @"设备已连接";

            break;
        case PPBleWorkStateDisconnected:
            NSLog(@"设备已断开");
            self.bleConnectStateLabel.text = @"设备已断开";

            break;
    }
}

- (void)monitorBluetoothSwitchState:(CBManagerState)state API_AVAILABLE(ios(10.0)){
    NSLog(@"monitorBluetoothSwitchState:%ld", state);
    if (state != CBManagerStatePoweredOn) {
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"请先开启蓝牙哦" message:nil preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *action = [UIAlertAction actionWithTitle:@"知道了" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [alertController dismissViewControllerAnimated:YES completion:nil];
        }];
        [alertController addAction:action];
        [self presentViewController:alertController animated:YES completion:nil];
    }


}

- (void)monitorBluetoothAuthorState:(CBManagerAuthorization)state API_AVAILABLE(ios(13.0)){
    NSLog(@"monitorBluetoothAuthorState:%ld", state);
    if (state != CBManagerAuthorizationAllowedAlways) {
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"请先开启蓝牙权限哦" message:nil preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *action = [UIAlertAction actionWithTitle:@"知道了" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [alertController dismissViewControllerAnimated:YES completion:nil];
        }];
        [alertController addAction:action];
        [self presentViewController:alertController animated:YES completion:nil];
    }
}

#pragma mark - Navigation

@end
