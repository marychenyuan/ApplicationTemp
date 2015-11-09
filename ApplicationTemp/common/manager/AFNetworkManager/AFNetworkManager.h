//
//  AFNetworkManager.h
//  ApplicationTemp
//
//  Created by 陈园 on 15/11/5.
//  Copyright © 2015年 陈园. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworkClient.h"

typedef void (^ErrorBlock)(NSError* error);
typedef void (^DictBlock)(NSDictionary *record);

@interface AFNetworkManager : NSObject

+ (void)getPath:(NSString *)url
   onCompletion:(DictBlock)completionBlock
        onError:(ErrorBlock)errorBlock;

+ (void)postPath:(NSString *)url
      parameters:(NSMutableDictionary*)parameters
    onCompletion:(DictBlock)completionBlock
         onError:(ErrorBlock)errorBlock;

+ (void)postImage:(NSString *)url
       parameters:(NSMutableDictionary*)parameters
      imageUpload:(UIImage*)selectedImage
     onCompletion:(DictBlock)completionBlock
          onError:(ErrorBlock)errorBlock;

+ (void)putPath:(NSString *)url
     parameters:(NSMutableDictionary*)parameters
   onCompletion:(DictBlock)completionBlock
        onError:(ErrorBlock)errorBlock;

+ (void)deletePath:(NSString *)url
        parameters:(NSMutableDictionary*)parameters
      onCompletion:(DictBlock)completionBlock
           onError:(ErrorBlock)errorBlock;


@end
