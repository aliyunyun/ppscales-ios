[中文](https://gitee.com/pengsiyuan777/bluetooth_project/blob/ppscale/README_CN.md)| [English](https://gitee.com/pengsiyuan777/bluetooth_project/blob/ppscale/README_EN.md)
##### Brief Description
- Demo requires real scale to run since bluetooth connection is required. 
- If you need information other than your weight, enter your height, age, gender and weigh yourself barefoot. 
- Height range: 30-220 cm; Age range: 10-99 years old; The unit is 0 for kilogram, 1 for kilogram and 2 for pound;Gender 1 is male and 0 is female; User group values range from 0 to 9 (this value is required for specific scales) 
- To use the Demo, you need to turn on bluetooth and give permission
##### To use the DEMO 

- Bounding device - After the controller is instantiated it will start scanning for nearby peripherals and making a record of your peripherals.
- Weighing on the scale - This controller will also start scanning nearby peripherals after being instantiated to connect the bound devices through filtering.Therefore, only after being bound can we go to scale and weigh, otherwise we cannot receive the data.
- Device management - This controller displays a list of your bound peripherals on the Bound Device page.You can delete a bound device by long pressing.
- After receiving the data returned by the peripherals on the pages of "Binding Device" and "Weighing", the scan will automatically stop and disconnect from the peripherals, and then the data will be sent back to the column of "Home Information" to update weight through callback. The specific data can be viewed on the "Data Details" page.
##### Introduce PPScale into the project
###### Drag the PPScale folder directly into your project in the file you want
```
#import "PPScale.h"
```

##### Methods provided by PPScale

---

##### In the Demo of ConnectDeviceViewController. M and BindingDeviceViewController. M provide some examples of realization.
###### Methods of weight and body fat scale
###### Invoking instantiated method of the PPScaleManager to proceed initialization.
```
/// Instantiation method of an object
/// @param addressList Mac Array of addresses
/// @param filterDeviceNameArr An array of device names

/// @param userModel The user object
- (instancetype)initWithMacAddressList:(NSArray <NSString *>*)addressList filterDeviceNameArr:(NSArray<NSString *> *)filterDeviceNameArr andUserModel:(PPUserModel *)userModel;
```
#### Use the instance object of PPScale to invoke the method of scanning nearby devices to search for nearby Bluetooth scale and connect. 
```
/// Start scanning nearby devices
- (void)startSearching;
```

##### When you no longer need to use the information provided by PPScale, you need to stop scanning and disconnect the connected device. The following method needs to be invoked, and it can still be invoked if there are no currently connected devices.
```
/// Stop scanning and disconnect the device from the current connection
- (void)disconnect;
```

##### Invoke this method if you need to get information about the device you are currently connected to. If there is no connection, this method returns nil.
```
/// Currently connected devices
- (PPDeviceModel *)currentDevice;
```

---

#### Method of close eye monopod pattern
##### The instance object of PPScale is used to invoke the method of scanning nearby devices to search the nearby closed eyes monopodial Bluetooth scale  and make connection. 
```
/// Connect the closed eye monopodial device
- (void)connectBMDJScale;
```

##### Exit the closed eye monopole mode and stop scanning and disconnect
```
/// Stop scanning and cut off the device that are one colose eyes moopod
- (void)disconnectBMScale;
```
##### Send a command to put the device into closed-eye monopod mode
```
/// The eye - closing monopod is ready
/// @param start  If it has been on ready
- (void)BMScaleStartTiming:(void(^)(BOOL isSuccess))start;
```

##### Send an instruction to the device to exit the closed-eye monopod mode 
```
///  Device exits the closed eye monopod state
/// @param exit  If it has been exited closed eye monopod mode
- (void)BMScaleExitTiming:(void(^)(BOOL isSuccess))exit;
```
##### Returns the amount of time it took to stand with eyes closed on one leg in the callback function
```
/// Monitor the standing time of the eye - closing monopod
/// @param timeInterval A call-back for standing time

- (void)BMScaleTimeInterval:(void(^)(BOOL isEnd, NSInteger timeInterval, BOOL isFailed))timeInterval;
```
#### Proxy method
```
Monitor Bluetooth status
/// monitor Bluetooth status
@protocol PPBleStateInterface <NSObject>

@optional

/// monitor the working condition of bluetooth
- (void)monitorBluetoothWorkState:(PPBleWorkState)state;

/// Monitor the status of the Bluetooth switch
- (void)monitorBluetoothSwitchState:(CBManagerState)state API_AVAILABLE(ios(10.0));

/// Monitor Bluetooth authorization status
- (void)monitorBluetoothAuthorState:(CBManagerAuthorization)state API_AVAILABLE(ios(13.0));

@end
```

##### Bluetooth Data Monitoring
- If you know that the device to which you want to connect don’t need to support historical data, you don’t need to realize the scaleManager: monitorHistorData: Method is: and the PPScaleManager internally send instructions to the Bluetooth peripherals based on the condition adjustment of external implementation interface. 
- scaleManager：monitorProcessData：Monitoring of process data is provided, and some devices support real-time data transmission. In this method, data in the process of weighing can be obtained, with only weight in the process data, and no heart rate and impedance.
- scaleManager：monitorLockData：The method will return back to final weight data, and if there is fat data and heart rate data, the related properties of the PPBodyFatModel object will be assigned. 
```
/// Monitoring Bluetooth data
@protocol PPDataInterface <NSObject>

/// Monitor Lock Data From The Scale
- (void)scaleManager:(PPScaleManager *)manager monitorLockData:(PPBodyFatModel *)model;

@optional

/// Monitor The Process Data From The Scale
- (void)scaleManager:(PPScaleManager *)manager monitorProcessData:(PPBodyBaseModel *)model;

/// Monitor The Historical Data From The Scale
- (void)scaleManager:(PPScaleManager *)manager monitorHistorData:(PPBodyHistoryBaseModel *)model;
@end
```
