//
//  ViewController.m
//  NSTimer循环引用问题
//
//  Created by Jason on 2019/3/23.
//  Copyright © 2019 友邦创新资讯. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic,strong)dispatch_source_t timer;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self begainTimer];
}

//开启一个GCD的定时器
- (void)begainTimer {
    //创建队列
    dispatch_queue_t queue = dispatch_get_main_queue();
    //创建定时器
    self.timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    //设置时间
    NSTimeInterval start = 1;//一秒后开始
    NSTimeInterval interval = 1;//间隔1秒针
    
    dispatch_source_set_timer(self.timer, dispatch_time(DISPATCH_TIME_NOW, (int64_t)(start * NSEC_PER_SEC) ), (uint64_t)(interval * NSEC_PER_SEC), 0);
    //设置回掉
    dispatch_source_set_event_handler(self.timer, ^{
        NSLog(@"timer is fire");
    });
    dispatch_resume(self.timer);
}

@end
