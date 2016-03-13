//
//  TDInterpreterSync.h
//  TDThreadUtils
//
//
//  Created by Todd Ditchendorf on 5/19/14.
//
//

#import <Foundation/Foundation.h>

@interface TDInterpreterSync : NSObject

+ (instancetype)interpreterSync;

- (void)pauseWithInfo:(id)info;
- (void)resumeWithInfo:(id)info;

@property (nonatomic, readonly, strong) id awaitPause;
@property (nonatomic, readonly, strong) id awaitResume;

@end
