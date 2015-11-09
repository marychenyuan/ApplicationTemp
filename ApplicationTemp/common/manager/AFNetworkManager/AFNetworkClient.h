//
//  AFNetworkClient.h
//  ApplicationTemp
//
//  Created by 陈园 on 15/11/5.
//  Copyright © 2015年 陈园. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

@interface AFNetworkClient : AFHTTPSessionManager

+ (AFHTTPSessionManager *)sessionManager;
+ (NSMutableDictionary *)defaultParameter;

@end
