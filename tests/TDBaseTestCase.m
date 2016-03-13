//
//  TDBaseTestCase.m
//  TDBaseTestCase
//
//  Created by Todd Ditchendorf on 1/12/15.
//  Copyright (c) 2015 Todd Ditchendorf. All rights reserved.
//

#import "TDBaseTestCase.h"

@interface TDBaseTestCase ()
@property (assign) NSUInteger threadCounter;
@end

@implementation TDBaseTestCase

- (void)setUp {
    [super setUp];
    [NSThread currentThread].name = @"MAIN";
    
    self.threadCounter = 0;

    self.done = [self expectationWithDescription:@"done"];
    self.flag = NO;
    self.counter = 0;
}

- (void)tearDown {
    self.done = nil;
    [super tearDown];
}

- (void)performAtomic:(void(^)(void))block {
    TDNotNil(block);
    @synchronized(self) {
        block();
    }
}

- (void)performAtomic:(NSTimeInterval)delay :(void(^)(void))block {
    TDPerformOnMainThreadAfterDelay(delay, ^{
        TDNotNil(block);
        @synchronized(self) {
            block();
        }
    });
}

- (void)performAtomicInBackground:(void(^)(void))block {
    TDPerformOnBackgroundThread(^{
        TDNotNil(block);
        @synchronized(self) {
            [self nameCurrentBackgroundThread];
            block();
        }
    });
}

- (void)performAtomicInBackground:(NSTimeInterval)delay :(void(^)(void))block {
    TDPerformOnBackgroundThreadAfterDelay(delay, ^{
        TDNotNil(block);
        @synchronized(self) {
            [self nameCurrentBackgroundThread];
            block();
        }
    });
}

- (void)nameCurrentBackgroundThread { // PRE: lock held
    [NSThread currentThread].name = [NSString stringWithFormat:@"BG#%lu", ++self.threadCounter];
}

@synthesize done=done;
@synthesize threshold=threshold;
@synthesize flag=flag;
@synthesize counter=counter;
@end
