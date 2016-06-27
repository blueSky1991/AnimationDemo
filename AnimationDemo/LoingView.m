//
//  CustomView.m
//  AnimationDemo
//
//  Created by 张东东 on 16/6/27.
//  Copyright © 2016年 张东东. All rights reserved.
//

#import "LoingView.h"

#define   kDegreesToRadians(degrees)  (( M_PI* degrees)/ 180)
#define  CENTER CGPointMake(self.frame.size.width*0.5, self.frame.size.height*0.5)
#define   screenWith  self.frame.size.width*0.5
#define   screenHeight  self.frame.size.height*0.5

@interface LoingView()

@property (nonatomic,assign)CGFloat startAngle;

@property (nonatomic,strong)NSTimer *timer;

@end


@implementation LoingView

- (void)setEndAngle:(CGFloat)endAngle{
    if (_endAngle != endAngle) {
        if (self.endAngle == 360) {
            [self endLoing];
            return;
        }
        _endAngle  =endAngle;
        [self setNeedsDisplay];
    }
}


-(void)drawRect:(CGRect)rect{
    
    UIBezierPath *path2 = [UIBezierPath bezierPathWithArcCenter:CENTER radius:self.frame.size.width*0.5 startAngle:0 endAngle:kDegreesToRadians(360) clockwise:YES];
    [[UIColor lightGrayColor] set];
    [path2 fill];

    if (self.type == LoingViewTypeCircle) {
        UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CENTER radius:self.frame.size.width*0.5 startAngle:self.startAngle endAngle:kDegreesToRadians(self.endAngle) clockwise:YES];
        path.lineWidth = 2;
        [[UIColor redColor] set];
        [path stroke];//填充所画线条的颜色

    }else if (self.type == LoingViewTypeFanShaped){
        
        CGContextRef context  = UIGraphicsGetCurrentContext();
        CGContextSetFillColorWithColor(context,[UIColor whiteColor].CGColor);
        CGContextMoveToPoint(context, screenWith, screenHeight);
        CGContextAddArc(context, screenWith, screenHeight, screenWith,  0,kDegreesToRadians(self.endAngle) , 1);
        CGContextClosePath(context);
        CGContextDrawPath(context, kCGPathFillStroke); //绘制路径

    }
    
    NSString *text = [NSString stringWithFormat:@"%.1f%%",self.endAngle/360*100];
    if (self.endAngle==360) {
        text = @"完成";
    }
    [text drawAtPoint:CGPointMake(self.frame.size.width*0.5-15, self.frame.size.height*0.5) withAttributes:@{NSFontAttributeName:[UIFont boldSystemFontOfSize:13.0],
                                              NSForegroundColorAttributeName:[UIColor blackColor] }];

}

- (void)endLoing{
    self.endAngle = 360;
    [self.timer invalidate];
}

/***********************************模拟动画添加的方法******************************************************/

-(void)startLoing{
       self.timer = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(startAnimation) userInfo:nil repeats:YES];
       self.startAngle = 0;
}
- (void)startAnimation{
    if (self.endAngle == 360) {
        [self endLoing];
        return;
    }
    self.endAngle +=1;
    [self setNeedsDisplay];
}

@end
