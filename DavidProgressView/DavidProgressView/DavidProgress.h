//
//  DavidProgress.h
//  DavidProgressView
//
//  Created by MOON FLOWER on 2018/10/30.
//  Copyright © 2018 David. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface DavidProgress : UIView

@property (strong, nonatomic)UIProgressView *progressView;

@property (nonatomic,strong)UISlider *sliderView;

@property (nonatomic,strong)UILabel *textLabel;

@property (nonatomic,strong)UIImageView *imageView;

- (void)setProgress:(CGFloat)progress;

@property (nonatomic, copy) void(^viewBlock)(CGFloat progress);

@end


