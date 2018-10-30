//
//  ViewController.m
//  DavidProgressView
//
//  Created by MOON FLOWER on 2018/10/30.
//  Copyright © 2018 David. All rights reserved.
//

#import "ViewController.h"
#import "DavidProgress.h"
@interface ViewController ()

@property(nonatomic,strong)DavidProgress*progress;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.progress=[[DavidProgress alloc]initWithFrame:CGRectMake(0, 80, self.view.bounds.size.width, 70)];
    
    [self.view addSubview:self.progress];
    // Do any additional setup after loading the view, typically from a nib.
}


@end
