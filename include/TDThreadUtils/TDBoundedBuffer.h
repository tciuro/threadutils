//
//  TDBoundedBuffer.h
//  TDThreadUtils
//
//  Created by Todd Ditchendorf on 1/12/15.
//  Copyright (c) 2015 Todd Ditchendorf. All rights reserved.
//

#import <TDThreadUtils/TDChannel.h>

@interface TDBoundedBuffer : NSObject <TDChannel>

+ (instancetype)boundedBufferWithSize:(NSUInteger)size;
- (instancetype)initWithSize:(NSUInteger)size NS_DESIGNATED_INITIALIZER;
- (instancetype)init NS_UNAVAILABLE;

- (void)put:(id)obj;
- (void)put:(id)obj beforeDate:(NSDate *)date;
- (id)takeBeforeDate:(NSDate *)date;

@property (nonatomic, readonly, strong) id take;

@end
