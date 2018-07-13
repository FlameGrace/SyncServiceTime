//
//  NSDate+SyncServiceTime.m
//  LMChargingPoint
//
//  Created by FlameGrace on 2018/7/13.
//  Copyright © 2018年 FlameGrace. All rights reserved.
//

#import "NSDate+SyncServiceTime.h"

@implementation NSDate (SyncServiceTime)
static NSNumber *timerOffset = nil;

+ (NSDate *)serviceDate
{
    if(timerOffset)
    {
        NSTimeInterval time = timerOffset.doubleValue + [self getSystemUptime];
        NSDate *serviceDate = [NSDate dateWithTimeIntervalSince1970:time];
        return serviceDate;
    }
    return [NSDate date];
}

+ (void)updateServiceTime:(NSDate *)serviceTime
{
    if(!serviceTime)
    {
        return;
    }
    NSTimeInterval time = serviceTime.timeIntervalSince1970;
    NSTimeInterval updateTime = [self getSystemUptime];
    if(updateTime != -1)
    {
        timerOffset = [NSNumber numberWithDouble:time - updateTime];
    }
}

+ (NSTimeInterval)getSystemUptime
{
    return [self bootTime];
}

+ (NSTimeInterval)bootTime
{
    return [[NSProcessInfo processInfo] systemUptime];
}

//精度不够
//+ (time_t)bootTime2
//{
//    struct timeval boottime;
//    int mib[2] = {CTL_KERN, KERN_BOOTTIME};
//    size_t size = sizeof(boottime);
//    time_t now;
//    time_t uptime = -1;
//
//    (void)time(&now);
//
//    if (sysctl(mib, 2, &boottime, &size, NULL, 0) != -1 && boottime.tv_sec != 0)
//    {
//        uptime = now - boottime.tv_sec;
//    }
//    return uptime;
//}


@end
