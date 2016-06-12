//
//  FKObject.m
//  lock
//
//  Created by Fujun on 16/6/12.
//  Copyright © 2016年 Fujun. All rights reserved.
//

#import "FKObject.h"
#import <objc/runtime.h>
#include <pthread.h>

@interface FKObject ()
{
    pthread_mutex_t fk_lock;
}

@property (readwrite, nonatomic) NSUInteger fk_retainCount;
@end

@implementation FKObject

- (instancetype)init
{
    if (self = [super init])
    {
        pthread_mutex_init(&fk_lock, NULL);
        _fk_retainCount = 1;
    }
    return self;
}
- (void)fk_retain
{
    [self addReference];
}
- (void)fk_release
{
    NSUInteger count = [self deleteReference];
    if (count == 0)
    {
        [self fk_dealloc];
    }
}
- (void)fk_dealloc
{
    //因为ARC下不能主动调用dealloc方法，所以这里伪造一个fk_dealloc来模拟
    NSLog(@"%@ dealloc", self);
}
- (void)addReference
{
    pthread_mutex_lock(&fk_lock);
    NSUInteger count = [self fk_retainCount];
    [self setFk_retainCount:++count];
    pthread_mutex_unlock(&fk_lock);
}
- (NSUInteger)deleteReference
{
    pthread_mutex_lock(&fk_lock);
    NSUInteger count = [self fk_retainCount];
    [self setFk_retainCount:--count];
    pthread_mutex_unlock(&fk_lock);
    return count;
}
@end
