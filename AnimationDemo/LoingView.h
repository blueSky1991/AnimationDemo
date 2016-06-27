//
//  CustomView.h
//  AnimationDemo
//
//  Created by 张东东 on 16/6/27.
//  Copyright © 2016年 张东东. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    /** 圆形进度条 ,默认 */
    LoingViewTypeCircle,
    /** 扇形进度条 */
    LoingViewTypeFanShaped
    
}LoingViewType;


@interface LoingView : UIView

/**
 *  下载进度数据
 */
@property (nonatomic,assign)CGFloat endAngle;
/**
 *  进度条类型
 */
@property (nonatomic,assign)LoingViewType type;
/**
 *  开始加载,模拟动画
 */
- (void)startLoing;





@end
