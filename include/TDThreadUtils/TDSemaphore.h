//
//  TDSemaphore.h
//  TDThreadUtils
//
//  Created by Todd Ditchendorf on 5/31/13.
//  Copyright (c) 2013 Todd Ditchendorf. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TDSemaphore : NSObject

+ (instancetype)semaphoreWithValue:(NSInteger)value;
- (instancetype)initWithValue:(NSInteger)value NS_DESIGNATED_INITIALIZER;
- (instancetype)init NS_UNAVAILABLE;

- (BOOL)attemptBeforeDate:(NSDate *)limit; // returns success. can block up to limit

- (void)acquire; // blocks forever
- (void)relinquish; // returns immediately

@property (nonatomic, readonly) BOOL attempt; // returns success immediately

@end
