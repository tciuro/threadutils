//
//  TDSynchronousChannel.m
//  TDThreadUtils
//
//  Created by Todd Ditchendorf on 5/19/14.
//
//

#import <TDThreadUtils/TDSynchronousChannel.h>
#import <TDThreadUtils/TDSemaphore.h>

@interface TDSynchronousChannel ()
@property (retain) TDSemaphore *putPermit;
@property (retain) TDSemaphore *takePermit;
@property (retain) TDSemaphore *taken;
@property (retain) id item;
@end

@implementation TDSynchronousChannel

+ (instancetype)synchronousChannel {
    return [[self alloc] init];
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.putPermit = [TDSemaphore semaphoreWithValue:1];
        self.takePermit = [TDSemaphore semaphoreWithValue:0];
        self.taken = [TDSemaphore semaphoreWithValue:0];
    }
    return self;
}

- (void)put:(id)obj {
    NSParameterAssert(obj);
    NSAssert(_putPermit, @"");
    NSAssert(_takePermit, @"");
    NSAssert(_taken, @"");

    [_putPermit acquire];
    NSAssert(!_item, @"");
    self.item = obj;
    NSAssert(_item, @"");
    [_takePermit relinquish];
    
    [_taken acquire]; // wait for someone to take it
}

- (id)take {
    NSAssert(_putPermit, @"");
    NSAssert(_takePermit, @"");
    NSAssert(_taken, @"");
    
    [_takePermit acquire];
    NSAssert(_item, @"");
#warning [What to do here?]
    id obj = _item;//[[_item retain] autorelease];
    self.item = nil;
    [_putPermit relinquish];
    
    [_taken relinquish]; // signal you've taken it

    NSAssert(obj, @"");
    return obj;
}

@end
