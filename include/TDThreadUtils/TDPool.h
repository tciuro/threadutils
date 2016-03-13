//
//  TDPool.h
//  TDThreadUtils
//
//  Created by Todd Ditchendorf on 5/21/15.
//  Copyright (c) 2015 Todd Ditchendorf. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TDPool : NSObject

+ (instancetype)poolWithItems:(NSArray *)items;
- (instancetype)initWithItems:(NSArray *)items NS_DESIGNATED_INITIALIZER;
- (instancetype)init NS_UNAVAILABLE;

- (void)returnItem:(id)obj;

@property (nonatomic, readonly, strong) id takeItem;

@end
