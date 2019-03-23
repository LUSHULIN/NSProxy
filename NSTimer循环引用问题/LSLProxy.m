//
//  LSLProxy.m
//  NSTimer循环引用问题
//
//  Created by Jason on 2019/3/23.
//  Copyright © 2019 友邦创新资讯. All rights reserved.
//

#import "LSLProxy.h"

@implementation LSLProxy

+ (instancetype)proxyWithTarget:(id)target {
    LSLProxy *proxy = [LSLProxy alloc];
    proxy.target = target;
    return proxy;
}

//消息转发机制
- (nullable NSMethodSignature *)methodSignatureForSelector:(SEL)sel {
    return [self.target methodSignatureForSelector:sel];

}

- (void)forwardInvocation:(NSInvocation *)invocation {
    [invocation invokeWithTarget:self.target];

}
@end
