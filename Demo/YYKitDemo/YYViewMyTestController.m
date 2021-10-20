//
//  YYViewMyTestController.m
//  YYKitDemo
//
//  Created by 鲁辰喜 on 2021/10/15.
//  Copyright © 2021 ibireme. All rights reserved.
//

#import "YYViewMyTestController.h"
#import "YYKit.h"
#import "YYTextExampleHelper.h"
#import "YYImageExampleHelper.h"

@interface YYViewMyTestController ()
@property (nonatomic, strong)YYLabel *label;
@end

@implementation YYViewMyTestController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
    
    [YYTextExampleHelper addDebugOptionToViewController:self];

    
    NSMutableAttributedString *text = [NSMutableAttributedString new];
    UIFont *font = [UIFont systemFontOfSize:16];
    
    {
        NSString *title = @"Att:\nA:";
        [text appendAttributedString:[[NSAttributedString alloc] initWithString:title attributes:nil]];
        
        UIImage *image = [UIImage imageNamed:@"dribbble64_imageio"];
        image = [UIImage imageWithCGImage:image.CGImage scale:2 orientation:UIImageOrientationUp];

        NSMutableAttributedString *attachText = [NSMutableAttributedString attachmentStringWithContent:nil contentMode:UIViewContentModeCenter attachmentSize:CGSizeZero alignToFont:font alignment:YYTextVerticalAlignmentCenter];
//        [text appendAttributedString:attachText];
        [text replaceCharactersInRange:NSMakeRange(1, 2) withAttributedString:attachText];
//        [text appendAttributedString:[[NSAttributedString alloc] initWithString:@"\n" attributes:nil]];
        
        NSLog(@"text length:%lu", (unsigned long)text.length);
    }
    
    text.font = font;
    
    _label = [YYLabel new];
    _label.userInteractionEnabled = YES;
    _label.numberOfLines = 0;
    _label.textVerticalAlignment = YYTextVerticalAlignmentTop;
    _label.size = CGSizeMake(260, 260);
    _label.center = CGPointMake(self.view.width / 2, self.view.height / 2 - (kiOS7Later ? 0 : 32));
    _label.attributedText = text;
    [self.view addSubview:_label];
    
    _label.layer.borderWidth = CGFloatFromPixel(1);
    _label.layer.borderColor = [UIColor colorWithRed:0.000 green:0.463 blue:1.000 alpha:1.000].CGColor;
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
