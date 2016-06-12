//
//  FKObject.h
//  lock
//
//  Created by Fujun on 16/6/12.
//  Copyright © 2016年 Fujun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FKObject : NSObject

@property (readonly, nonatomic) NSUInteger fk_retainCount;

- (void)fk_retain;

- (void)fk_release;

@end
