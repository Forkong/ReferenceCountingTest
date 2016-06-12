//
//  ViewController.m
//  ReferenceCountingTest
//
//  Created by Fujun on 16/6/12.
//  Copyright © 2016年 Fujun. All rights reserved.
//

#import "ViewController.h"
#import "FKObject.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
FKObject *object = [[FKObject alloc] init];
NSLog(@"%ld", object.fk_retainCount);
[object fk_retain];
NSLog(@"%ld", object.fk_retainCount);
[object fk_release];
NSLog(@"%ld", object.fk_retainCount);
[object fk_release];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
