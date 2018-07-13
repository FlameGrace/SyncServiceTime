//
//  NSDate+SyncServiceTime.h
//  LMChargingPoint
//
//  Created by FlameGrace on 2018/7/13.
//  Copyright © 2018年 FlameGrace. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (SyncServiceTime)
+ (NSDate *)serviceDate;
+ (void)updateServiceTime:(NSDate *)serviceTime;
+ (NSTimeInterval)getSystemUptime;
+ (NSTimeInterval)bootTime;

@end
