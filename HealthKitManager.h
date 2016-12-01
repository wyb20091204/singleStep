//
//  HealthKitManager.h
//  SingleStep
//
//  Created by 一波 on 2016/11/17.
//  Copyright © 2016年 一波. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HealthKitManager : NSObject

+ (instancetype)shareHealthManager;

/*
 *  @brief  检查是否支持获取健康数据
 */
- (void)authorizeHealthKit:(void(^)(BOOL success, NSError *error))compltion;


- (void)getStepCount:(void(^)(double value, NSError *error))completion;
//获取公里数
- (void)getDistance:(void(^)(double value, NSError *error))completion;


@end
