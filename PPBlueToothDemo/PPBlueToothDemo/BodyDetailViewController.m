//
//  BodyDetailViewController.m
//  PPBlueToothDemo
//
//  Created by 彭思远 on 2018/7/27.
//  Copyright © 2018年 彭思远. All rights reserved.
//

#import "BodyDetailViewController.h"
#import "MJExtension.h"

@interface BodyDetailViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *table;
@end

@implementation BodyDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (self.model) {
        NSDictionary *dic = [self.model mj_keyValues];
        return dic.allKeys.count;
    }else{
        return 0;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    }
    
    NSDictionary *dic = nil;
    if (self.model) {
        dic = [self.model mj_keyValues];
    }
    id data = dic.allValues[indexPath.row];
    if ([data isKindOfClass:[NSNumber class]]) {
        cell.textLabel.text = dic.allKeys[indexPath.row];
        cell.detailTextLabel.text = [NSString stringWithFormat:@"%@",data];
    }
    return cell;
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
