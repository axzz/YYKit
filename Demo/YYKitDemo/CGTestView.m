//
//  CGTestView.m
//  YYKitDemo
//
//  Created by 鲁辰喜 on 2021/10/21.
//  Copyright © 2021 ibireme. All rights reserved.
//

#import "CGTestView.h"
#import <CoreText/CoreText.h>

@implementation CGTestView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


- (void)drawCircles:(CGRect)rect {
    //获得当前上下文
    CGContextRef ctx=UIGraphicsGetCurrentContext();
     [[UIColor redColor] setStroke];

    CGContextSaveGState(UIGraphicsGetCurrentContext());
    // UIGraphicsPushContext(ctx);

    //画椭圆
    CGContextAddEllipseInRect(ctx, CGRectMake(200, 130, 60, 30));
    //以下等价
    //CGContextStrokePath(ctx);
    CGContextDrawPath(ctx, kCGPathStroke);

    //画圆形
    CGContextAddEllipseInRect(ctx, CGRectMake(200, 80, 50, 50));
    CGContextSetLineWidth(ctx, 3);
    [[UIColor yellowColor] setStroke];
    CGContextStrokePath(ctx);

    CGContextRestoreGState(UIGraphicsGetCurrentContext());
    //UIGraphicsPopContext();

    //画圆弧
    CGContextAddArc(ctx, 200, 70, 70, M_PI_4, M_PI, 1);
    CGContextStrokePath(ctx);
}

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    [self drawCircles:rect];
    CGContextRef context = UIGraphicsGetCurrentContext();

    // 翻转渲染
    CGContextSetTextMatrix(context, CGAffineTransformIdentity);
    CGContextTranslateCTM(context, 0, self.bounds.size.height);
    CGContextScaleCTM(context, 1.0, -1.0);


    // container
    CGMutablePathRef path = CGPathCreateMutable();

//    CGPathAddEllipseInRect(path, NULL, self.bounds);

    CGPathMoveToPoint(path, NULL, 50, 250);
    CGPathAddLineToPoint(path, NULL, 100, 250);
    CGPathAddLineToPoint(path, NULL, 300, 150);
    CGPathAddLineToPoint(path, NULL, 0, 50);
    CGPathAddLineToPoint(path, NULL, 50, 250); // 创建闭合的图形

//    CGPathAddRect(path, NULL, self.bounds);
    CGContextAddPath(context, path);

    CGContextSetRGBStrokeColor(context, 1.0, 0, 0, 1);//设置笔触颜色
    CGContextSetRGBFillColor(context, 0, 0.7, 0.7, 1);//设置填充色
    CGContextSetLineWidth(context, 2.0);//设置线条宽度
    CGContextSetLineCap(context, kCGLineCapRound);//设置顶点样式
    CGContextSetLineJoin(context, kCGLineJoinRound);//设置连接点样式
    CGFloat lengths[2] = { 18, 9 };
    CGContextSetLineDash(context, 0, lengths, 2);
    CGContextDrawPath(context, kCGPathFillStroke);//最后一个参数是填充类型

    NSAttributedString *attString = [[NSAttributedString alloc]initWithString:@"Hello World! "
                                     " 创建绘制的区域，CoreText 本身支持各种文字排版的区域，"
                                     " 我们这里简单地将 UIView 的整个界面作为排版的区域。"
                                     " 为了加深理解，建议读者将该步骤的代码替换成如下代码，"
                                     " 测试设置不同的绘制区域带来的界面变化。"
                                    attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:20]}];

    CTFramesetterRef framesetter = CTFramesetterCreateWithAttributedString((CFAttributedStringRef)attString);
    CTFrameRef frame = CTFramesetterCreateFrame(framesetter, CFRangeMake(0, [attString length]), path, NULL);
    CGContextSetShadowWithColor(context, CGSizeMake(2, 2), 0, [UIColor greenColor].CGColor);
    CTFrameDraw(frame, context);

    CFRelease(frame);
    CFRelease(path);
    CFRelease(framesetter);
}


@end
