//
//  ViewController.m
//  PPBlueToothDemo
//
//  Created by 彭思远 on 2018/7/25.
//  Copyright © 2018年 彭思远. All rights reserved.
//

#import "ViewController.h"
#import "ConnectDeviceViewController.h"
#import "BindingDeviceViewController.h"
#import "BodyDetailViewController.h"
#import "CalculateViewController.h"
#import "UnitTool.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *heightTF;
@property (weak, nonatomic) IBOutlet UITextField *ageTF;
@property (weak, nonatomic) IBOutlet UITextField *unitTF;
@property (weak, nonatomic) IBOutlet UITextField *sexTF;
@property (weak, nonatomic) IBOutlet UITextField *groupTF;

@property (weak, nonatomic) IBOutlet UILabel *weightLabel;

@property (nonatomic, strong) PPBodyFatModel *model;
@property (nonatomic, assign) CGFloat currentWeight;
@end

@implementation ViewController


#pragma mark - Public Func
#pragma mark - Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    self.heightTF.text = @"180";
    self.ageTF.text = @"18";
    self.unitTF.text = @"0";
    self.sexTF.text = @"0";
    self.groupTF.text = @"1";
//    HTBodyfat_NewSDK *peopleModel = [[HTBodyfat_NewSDK alloc]init];
//    THTBodyfatErrorType errorType = [peopleModel getBodyfatWithweightKg:59.1 heightCm:160 sex:0 age:22 impedance:13849945];
}



#pragma mark - Private Func
#pragma mark - Actions


#pragma mark - Delegate
#pragma mark - Setter
#pragma mark - Getter

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"ConnectDeviceViewController"]) {
        ConnectDeviceViewController *connect = segue.destinationViewController;
        connect.height = [self.heightTF.text integerValue];
        connect.age = [self.ageTF.text integerValue];
        connect.unit = [self.unitTF.text integerValue];
        connect.sex = [self.sexTF.text integerValue];
        connect.group = [self.groupTF.text integerValue];
        connect.BodyDataHandler = ^(PPBodyFatModel *bodyFatModel) {
            self.model = bodyFatModel;
            self.currentWeight = bodyFatModel.ppWeightKg;
            self.weightLabel.text = [UnitTool weight:bodyFatModel.ppWeightKg withUnit:[self.unitTF.text integerValue]];
        };
    }
    if ([segue.identifier isEqualToString:@"BindingDeviceViewController"]) {
        BindingDeviceViewController *binding = segue.destinationViewController;
        binding.height = [self.heightTF.text integerValue];
        binding.age = [self.ageTF.text integerValue];
        binding.unit = [self.unitTF.text integerValue];
        binding.sex = [self.sexTF.text integerValue];
        binding.group = [self.groupTF.text integerValue];
        binding.BodyDataHandler = ^(PPBodyFatModel *bodyFatModel) {
            self.model = bodyFatModel;
            self.currentWeight = bodyFatModel.ppWeightKg;
            self.weightLabel.text = [UnitTool weight:bodyFatModel.ppWeightKg withUnit:[self.unitTF.text integerValue]];
        };
    }
    if ([segue.identifier isEqualToString:@"BodyDetailViewController"]) {
        BodyDetailViewController *detail = segue.destinationViewController;
        detail.model = self.model;
    }
    if ([segue.identifier isEqualToString:@"CalculateViewController"]) {
        CalculateViewController *calculate = segue.destinationViewController;
        calculate.height = [self.heightTF.text integerValue];
        calculate.age = [self.ageTF.text integerValue];
        calculate.sex = [self.sexTF.text integerValue] == 0? PPUserGenderFemale:PPUserGenderMale;
    }
}

@end
