//
//  GCDSocketManger.m
//  learningTest
//
//  Created by Apple on 2018/4/2.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import "GCDSocketManger.h"

@implementation GCDSocketManger

+ (GCDSocketManger *)sharedInstance {
    static GCDSocketManger *instance = nil;
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        instance = [[self alloc] init];
    });
    return instance;
}

- (instancetype)init {
    self = [super init];
    if (!self) {
        return nil;
    }
    return self;
}

@end
