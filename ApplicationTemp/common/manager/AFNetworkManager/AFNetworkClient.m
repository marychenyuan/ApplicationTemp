//
//  AFNetworkClient.m
//  ApplicationTemp
//
//  Created by 陈园 on 15/11/5.
//  Copyright © 2015年 陈园. All rights reserved.
//

#import "AFNetworkClient.h"

@implementation AFNetworkClient


+ (AFHTTPSessionManager *)sessionManager
{
    static AFNetworkClient *_sessionManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sessionManager = [[AFNetworkClient alloc] initWithBaseURL:[NSURL URLWithString:@""]];
    });
    return _sessionManager;

}

- (instancetype)initWithBaseURL:(NSURL *)url{
    self = [super initWithBaseURL:url];
    if (!self) return nil;

    AFHTTPRequestSerializer *serializer = [AFHTTPRequestSerializer serializer];
    [serializer setTimeoutInterval:15.0f];
    self.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/json",@"text/javascript",@"text/html",@"text/plain",nil];
    [self setRequestSerializer:serializer];
    
    return self;
}
    

+ (NSMutableDictionary *)defaultParameter
{
    NSMutableDictionary *dictionary = [[NSMutableDictionary alloc]init];
    [dictionary setObject:@"" forKey:@""];

    return dictionary;
}

@end
