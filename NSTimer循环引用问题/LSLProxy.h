//
//  LSLProxy.h
//  NSTimer循环引用问题
//
//  Created by Jason on 2019/3/23.
//  Copyright © 2019 友邦创新资讯. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LSLProxy : NSProxy

@property (nonatomic,weak)id target;

+ (instancetype)proxyWithTarget:(id)target;

@end

NS_ASSUME_NONNULL_END
