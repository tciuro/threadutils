//
//  TDSynchronousChannel.h
//  TDThreadUtils
//
//  Created by Todd Ditchendorf on 5/19/14.
//
//

#import <TDThreadUtils/TDChannel.h>

@interface TDSynchronousChannel : NSObject <TDChannel>

+ (instancetype)synchronousChannel;

- (void)put:(id)obj;

@property (nonatomic, readonly, strong) id take;

@end
