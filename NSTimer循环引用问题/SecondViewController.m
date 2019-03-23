//
//  SecondViewController.m
//  NSTimer循环引用问题
//
//  Created by Jason on 2019/3/23.
//  Copyright © 2019 友邦创新资讯. All rights reserved.
//

#import "SecondViewController.h"
#import "LSLProxy.h"

@interface SecondViewController ()
//第一种定时器
@property (nonatomic,strong)NSTimer *timer;
//第二种定时器
@property (nonatomic,strong)CADisplayLink *link;

@property (weak, nonatomic) IBOutlet UILabel *countLabel;

@end

@implementation SecondViewController
 int count = 0;
- (void)viewDidLoad {
    [super viewDidLoad];
    //这里会发生强引用
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:[LSLProxy proxyWithTarget:self] selector:@selector(fire) userInfo:nil repeats:YES];
    self.link = [CADisplayLink displayLinkWithTarget:[LSLProxy proxyWithTarget:self] selector:@selector(fire)];
    [self.link addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
}

- (void)fire {
    self.countLabel.text = [NSString stringWithFormat:@"%d",count++];
    NSLog(@"count ===%d",count);
}

- (void)dealloc {
    NSLog(@"secondViewController dealloc");
    //销毁定时器
    [self.timer invalidate];
    [self.link invalidate];
}
@end
