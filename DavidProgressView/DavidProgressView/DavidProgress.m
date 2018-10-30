//
//  DavidProgress.m
//  DavidProgressView
//
//  Created by MOON FLOWER on 2018/10/30.
//  Copyright © 2018 David. All rights reserved.
//

#import "DavidProgress.h"
#import "UIView+NTES.h"
#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#define ScreenHeight [UIScreen mainScreen].bounds.size.height
@interface DavidProgress ()

@property (nonatomic,strong)NSString *slideTitle;

@end

@implementation DavidProgress


- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        
        CGAffineTransform transform = CGAffineTransformMakeScale(1.0f, 5.0f);
        _progressView = [[UIProgressView alloc]initWithProgressViewStyle:UIProgressViewStyleDefault];
        _progressView.frame = CGRectMake(15, self.height-15, ScreenWidth-30, 10);
        _progressView.transform = transform;
        _progressView.layer.cornerRadius = 5.0;
        _progressView.layer.masksToBounds = YES;
        _progressView.progressImage = [UIImage imageNamed:@"my resume_progress bar"];
        [self addSubview:_progressView];
        
        _sliderView = [[UISlider alloc]initWithFrame:_progressView.frame];
        _sliderView.height = 31;
        _sliderView.center = _progressView.center;
        _sliderView.minimumValue = 1;
        _sliderView.maximumValue = 5;
        _sliderView.minimumTrackTintColor = [UIColor clearColor];
        _sliderView.maximumTrackTintColor = [UIColor clearColor];
        [_sliderView setThumbImage:[UIImage imageNamed:@"my resume_btn_slide"] forState:UIControlStateNormal];
        [self addSubview:_sliderView];
        [_sliderView addTarget:self action:@selector(sliderValueChange:) forControlEvents:UIControlEventValueChanged];
        [_sliderView addTarget:self action:@selector(sliderEnd:) forControlEvents:UIControlEventTouchUpInside];
        
        _imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, _sliderView.frame.origin.y-38-6, 32, 38)];
        [_imageView setImage:[UIImage imageNamed:@"resume_slider"]];
        [self addSubview:_imageView];
        
        _textLabel = [[UILabel alloc]initWithFrame:_imageView.bounds];
        _textLabel.text = @"熟悉";
        _textLabel.top -= 3;
        _textLabel.font =[UIFont systemFontOfSize:14] ;
        _textLabel.adjustsFontSizeToFitWidth = YES;
        _textLabel.textColor = [UIColor whiteColor];
        _textLabel.textAlignment = NSTextAlignmentCenter;
        [_imageView addSubview:_textLabel];
    }
    return self;
}

- (void)awakeFromNib {
    
    [super awakeFromNib];
}

- (void)setProgress:(CGFloat)progress {
    
    [_sliderView setValue:progress animated:YES];
    [self updateSlider];
    [self changeFrameAndTitle];
}

- (void)sliderValueChange:(UISlider *)slider {
    
    [self changeFrameAndTitle];
}

- (void)sliderEnd:(UISlider *)slider {
    
    [self updateSlider];
    [self changeFrameAndTitle];
    if (self.viewBlock) {
        self.viewBlock(_sliderView.value);
    }
}

- (void)updateSlider {
    
    if (_sliderView.value < 1.5) {
        _slideTitle = @"了解";
        [_sliderView setValue:1 animated:YES];
    }else if (_sliderView.value < 2.5) {
        _slideTitle = @"熟悉";
        [_sliderView setValue:2 animated:YES];
    }else if (_sliderView.value < 3.5) {
        _slideTitle = @"掌握";
        [_sliderView setValue:3 animated:YES];
    }else if (_sliderView.value < 4.5) {
        _slideTitle = @"精通";
        [_sliderView setValue:4 animated:YES];
    }else {
        _slideTitle = @"专家";
        [_sliderView setValue:5 animated:YES];
    }
}

/**
 设置
 */
- (void)changeFrameAndTitle {
    
    CGRect rect = [_sliderView thumbRectForBounds:_sliderView.bounds trackRect:[_sliderView trackRectForBounds:_sliderView.bounds] value:_sliderView.value];
    CGFloat x = rect.origin.x+15+rect.size.width/2.0;
    CGPoint center = CGPointMake(x, _imageView.center.y);
    _imageView.center = center;
    [_progressView setProgress:(_sliderView.value-1)/4.0 animated:NO];
    _textLabel.text = _slideTitle;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
