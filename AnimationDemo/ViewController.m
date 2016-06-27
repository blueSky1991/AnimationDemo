//
//  ViewController.m
//  AnimationDemo
//
//  Created by 张东东 on 16/6/27.
//  Copyright © 2016年 张东东. All rights reserved.
//

#import "ViewController.h"
#import "LoingView.h"

@interface ViewController ()

@property (nonatomic,strong)LoingView *loginViewCircle;

@property (nonatomic,strong)LoingView *loginViewFanShaped;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
   self.loginViewCircle = [[LoingView alloc] initWithFrame:CGRectMake(100, 100, 200, 200)];
    self.loginViewCircle.type =LoingViewTypeCircle;
    [self.view addSubview:self.loginViewCircle];
    
    self.loginViewFanShaped = [[LoingView alloc] initWithFrame:CGRectMake(100, 400, 200, 200)];
    self.loginViewFanShaped.type =LoingViewTypeFanShaped;
    [self.view addSubview:self.loginViewFanShaped];

    
   [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(startAnimation) userInfo:nil repeats:YES];
    
}
- (void)startAnimation{
    
    self.loginViewCircle.endAngle++;
    self.loginViewFanShaped.endAngle++;
    
}

@end
