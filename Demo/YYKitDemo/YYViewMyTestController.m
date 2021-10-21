//
//  YYViewMyTestController.m
//  YYKitDemo
//
//  Created by 鲁辰喜 on 2021/10/15.
//  Copyright © 2021 ibireme. All rights reserved.
//

#import "YYViewMyTestController.h"
#import "YYKit.h"
#import "CGTestView.h"

@interface YYViewMyTestController ()
@property (nonatomic, strong)YYLabel *label;
@end

@implementation YYViewMyTestController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    CGTestView *drawView = [CGTestView new];
    drawView.backgroundColor = [UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:1];
    drawView.height = self.view.height * 1 / 2;
    drawView.width = self.view.width;
    drawView.center = self.view.center;
    [self.view addSubview:drawView];
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
