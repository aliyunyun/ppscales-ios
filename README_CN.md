[中文](https://gitee.com/pengsiyuan777/bluetooth_project/blob/ppscale/README_CN.md)| [English](https://gitee.com/pengsiyuan777/bluetooth_project/blob/ppscale/README_EN.md)
 ### 一些简单的说明
- 由于需要蓝牙连接，Demo需要真机运行。
- 如果需要体重值以外的信息需要输入身高、年龄、性别并且光脚上秤。
- 身高的取值范围：30-220厘米；年龄的取值范围：10-99岁；单位0代表千克，1代表斤，2代表镑；性别1代表男，0代表女；用户组取值范围0-9（特定的秤需要这个值）
- 使用Demo过程中需要您打开蓝牙，同时给予权限


### DEMO的使用

-  **绑定设备**  - 在这个控制器在被实例化后会开始扫描附近的外设，并将您的外设做一个记录。
-  **上秤称重** - 这个控制器在被实例化后也会开始扫描附近的外设，通过过滤去连接已绑定过的设备。所以只有被绑定过后才能去进行上秤称重，否则无法接收到数据。

-  **设备管理** - 这个控制器会用列表的方式展示你在“绑定设备”页面绑定的外设。你可以通过长按的方式去删除已绑定设备。

- 在“绑定设备”和“上秤称重”页面接收到外设返回的数据后，会自动停止扫描并断开与外设的连接，然后把数据通过回调的方式传回“主页信息”更新体重一栏，具体的数据可以去“ **数据详情**”页查看。


### 引入PPScale到工程中
直接拖动PPScale文件夹到你的工程中
在需要的文件中
```
#import "PPScale.h"

```

### PPScale提供的方法
--- 

Demo中的ConnectDeviceViewController.m和BindingDeviceViewController.m中提供了具体实现的例子。
#### 体重、体脂秤相关方法
调用PPScaleManager的实例化方法来进行初始化。
```
/// 对象的实例化方法
/// @param addressList Mac地址的数组
/// @param filterDeviceNameArr 设备名称的数组
/// @param userModel 用户对象
- (instancetype)initWithMacAddressList:(NSArray <NSString *>*)addressList filterDeviceNameArr:(NSArray<NSString *> *)filterDeviceNameArr andUserModel:(PPUserModel *)userModel;
```

使用PPScale的实例对象调用扫描附近设备的方法来搜索附近的蓝牙秤并进行连接。
```
/// 开始扫描附近设备
- (void)startSearching;
```

当你不再需要使用PPScale提供的信息，你需要停止扫描并且断开已连接的设备。这时需要调用下面的方法,如果当前没有已连接的设备也美观关系，依然可以调用此方法。

```
/// 停止扫描切断开当前连接的设备
- (void)disconnect;
```

如果需要获取当前连接着的设备的信息可以调用下面的方法，如果当前没有连接，这个方法会返回nil。
```
/// 当前连接着的设备
- (PPDeviceModel *)currentDevice;

```
--- 
#### 闭目单脚模式相关方法

使用PPScale的实例对象调用扫描附近设备的方法来搜索附近的闭目单脚蓝牙秤并进行连接。
```
/// 连接闭目单脚设备
- (void)connectBMDJScale;
```

退出闭目单脚模式并停止扫描断开连接
```
/// 停止扫描切断开闭目单脚的设备
- (void)disconnectBMScale;
```

发送指令使设备进入闭目单脚模式
```
/// 闭目单脚设备进入准备状态
/// @param start 是否进入了准备状态
- (void)BMScaleStartTiming:(void(^)(BOOL isSuccess))start;
```

发送指令使设备退出闭目单脚模式
```
/// 设备退出闭目单脚状态
/// @param exit 是否退出了闭目单脚
- (void)BMScaleExitTiming:(void(^)(BOOL isSuccess))exit;
```

在回调函数中返回闭目单脚站立的时间
```
/// 监听闭目单脚设备站立时间
/// @param timeInterval 站立时间的回调
- (void)BMScaleTimeInterval:(void(^)(BOOL isEnd, NSInteger timeInterval, BOOL isFailed))timeInterval;
```


#### 代理方法
蓝牙状态的监听
```
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
```

蓝牙数据的监听
- 如果已知所需要连接的设备不要支持历史数据，可以不去实现scaleManager：monitorHistorData：方法，PPScaleManager内部根据外部实现接口的情况调整对蓝牙外设发送的指令集。
- scaleManager：monitorProcessData：提供了过程数据的监听，有些设备支持实时的数据传输，可以在此方法中获取秤重过程中的数据，过程数据中只有体重，没有心律和阻抗。
- scaleManager：monitorLockData：方法会返回最终的重量数据，如果有测脂数据和心律数据，PPBodyFatModel对象的相关属性也会被赋值。
```
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
```
