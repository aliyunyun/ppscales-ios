//
//  CalculateViewController.m
//  PPBlueToothDemo
//
//  Created by 彭思远 on 2019/3/14.
//  Copyright © 2019 彭思远. All rights reserved.
//

#import "CalculateViewController.h"
#import "PPBodyFatModel.h"

@interface CalculateViewController ()
@property (weak, nonatomic) IBOutlet UITextField *impedanceTF;
@property (weak, nonatomic) IBOutlet UITextField *weightTF;
@property (weak, nonatomic) IBOutlet UITextView *contentTextView;

@end

@implementation CalculateViewController
- (IBAction)onBtnClick:(id)sender {
    CGFloat weight = [self.weightTF.text floatValue];
    NSInteger impedance = [self.impedanceTF.text integerValue];
    PPUserModel *userModel = [[PPUserModel alloc] initWithUserHeight:self.height gender:self.sex age:self.age andUnit:self.sex];
    PPBodyFatModel *peopleModel = [[PPBodyFatModel alloc] initWithUserModel:userModel weight:weight heartRate:0 isHeartRateEnd:YES andImpedance:impedance];
    
    if (peopleModel.errorType == PPBodyfatErrorTypeNone) {
        NSLog(@"%.lf",peopleModel.ppproteinPercentage);
        NSString *str = [NSString stringWithFormat:@"(合泰)\n体重：%.1fKG\nBMI：%.1f\n身体水分：%.1f%%\n脂肪：%.1f%%\n肌肉含量：%.1fkg\n骨骼含量：%.1fkg\nBMR：%ld\n内脏脂肪：%ld\n皮下脂肪：%.1fKG\n身体年龄：%ld\n",peopleModel.ppWeightKg,peopleModel.ppBMI,peopleModel.ppWaterPercentage,peopleModel.ppBodyfatPercentage,peopleModel.ppMusclePercentage,peopleModel.ppBoneKg,peopleModel.ppBMR,peopleModel.ppVFAL,peopleModel.ppBodySubcutaneousFat,peopleModel.ppBodyAge];
        self.contentTextView.text = str;
    }else if (peopleModel.errorType == PPBodyfatErrorTypeImpedance){
        self.contentTextView.text = @"阻抗有误,阻抗有误时, 不计算除BMI/idealWeightKg以外参数(写0)";
    }else if (peopleModel.errorType == PPBodyfatErrorTypeAge){
        self.contentTextView.text = @"年龄参数有误，需在 10 ~ 99岁(不计算除BMI/idealWeightKg以外参数";
    }else if (peopleModel.errorType == PPBodyfatErrorTypeWeight){
        self.contentTextView.text = @"体重参数有误，需在 10  ~ 200kg(有误不计算所有参数)";
    }else if (peopleModel.errorType == PPBodyfatErrorTypeHeight){
        self.contentTextView.text = @"身高参数有误，需在 90 ~ 220cm(不计算所有参数)";
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
