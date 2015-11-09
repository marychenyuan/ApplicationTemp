//
//  AFNetworkManager.m
//  ApplicationTemp
//
//  Created by 陈园 on 15/11/5.
//  Copyright © 2015年 陈园. All rights reserved.
//

#import "AFNetworkManager.h"
#import "AFNetworkReachabilityManager.h"
#import "SVProgressHUD.h"

@implementation AFNetworkManager

/**
 *  get请求
 *
 *  @param url             访问路径
 *  @param completionBlock 完成
 *  @param errorBlock      失败
 */
+ (void)getPath:(NSString *)url
   onCompletion:(DictBlock)completionBlock
        onError:(ErrorBlock)errorBlock{
    //检测网络是否可用
    if (![AFNetworkReachabilityManager sharedManager].isReachable) {
        [SVProgressHUD showErrorWithStatus:@"网络无法连接"];
        return;
    }
    
    //发起请求
    [[AFNetworkClient sessionManager] GET:url parameters:[AFNetworkClient defaultParameter] success:^(NSURLSessionDataTask *task, id responseObject) {
        if(completionBlock){
            completionBlock(responseObject);
        }
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        [SVProgressHUD showErrorWithStatus:@"网络错误，请稍后再试"];
        NSLog(@"-----url:%@ \n -----error:%@",url,error);
        if (errorBlock) {
            errorBlock(error);
        }
    }];
}

/**
 *  post请求
 *
 *  @param url             访问路径
 *  @param parameters      参数
 *  @param completionBlock 完成
 *  @param errorBlock      失败
 */
+ (void)postPath:(NSString *)url
      parameters:(NSMutableDictionary*)parameters
    onCompletion:(DictBlock)completionBlock
         onError:(ErrorBlock)errorBlock{
    //检测网络是否可用
    if (![AFNetworkReachabilityManager sharedManager].isReachable) {
        [SVProgressHUD showErrorWithStatus:@"网络无法连接"];
        return;
    }
    
    //发起请求
    [[AFNetworkClient sessionManager] POST:url parameters:parameters success:^(NSURLSessionDataTask * _Nonnull task, id responseObject) {
        if(completionBlock){
            completionBlock(responseObject);
        }
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        [SVProgressHUD showErrorWithStatus:@"网络错误，请稍后再试"];
        NSLog(@"-----url:%@ \n -----error:%@",url,error);
        if (errorBlock) {
            errorBlock(error);
        }
        
    }];
    
}

/**
 *  上传图片
 *
 *  @param url               访问路径
 *  @param parameters        参数
 *  @param imageData         要上传的图片
 *  @param completionBlock   完成
 *  @param errorBlock        失败
 */
+ (void)postImage:(NSString *)url
       parameters:(NSMutableDictionary*)parameters
      imageUpload:(UIImage*)selectedImage
     onCompletion:(DictBlock)completionBlock
          onError:(ErrorBlock)errorBlock{
    //检测网络是否可用
    if (![AFNetworkReachabilityManager sharedManager].isReachable) {
        [SVProgressHUD showErrorWithStatus:@"网络无法连接"];
        return;
    }
    
    //发起请求
    [[AFNetworkClient sessionManager] POST:url parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        //压缩图片
        NSData *imageData = UIImageJPEGRepresentation(selectedImage,1.0);
        if (imageData.length > 4 * 1024) {
            imageData = UIImageJPEGRepresentation(selectedImage,(4.0f * 1024.0f)/imageData.length);
        }
        
        //拼接图片数据
        if (imageData) {
            [formData appendPartWithFileData:imageData
                                        name:@"Stream"
                                    fileName:@"picture.jpg"
                                    mimeType:@"image/jpeg"];
        }
        
    } success:^(NSURLSessionDataTask *task, id responseObject) {
        if(completionBlock){
            completionBlock(responseObject);
        }
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        [SVProgressHUD showErrorWithStatus:@"网络错误，请稍后再试"];
        NSLog(@"-----url:%@ \n -----error:%@",url,error);
        if (errorBlock) {
            errorBlock(error);
        }
        
    }];
}

/**
 *  put请求
 *
 *  @param url             访问路径
 *  @param parameters      参数
 *  @param completionBlock 完成
 *  @param errorBlock      失败
 */
+ (void)putPath:(NSString *)url
     parameters:(NSMutableDictionary*)parameters
   onCompletion:(DictBlock)completionBlock
        onError:(ErrorBlock)errorBlock{
    //检测网络是否可用
    if (![AFNetworkReachabilityManager sharedManager].isReachable) {
        [SVProgressHUD showErrorWithStatus:@"网络无法连接"];
        return;
    }

    //发起请求
    [[AFNetworkClient sessionManager] PUT:url parameters:parameters success:^(NSURLSessionDataTask * task, id responseObject) {
        if(completionBlock){
            completionBlock(responseObject);
        }

    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        [SVProgressHUD showErrorWithStatus:@"网络错误，请稍后再试"];
        NSLog(@"-----url:%@ \n -----error:%@",url,error);
        if (errorBlock) {
            errorBlock(error);
        }

    }];
    
}

/**
 *  delete请求
 *
 *  @param url             访问路径
 *  @param parameters      参数
 *  @param completionBlock 完成
 *  @param errorBlock      失败
 */
+ (void)deletePath:(NSString *)url
        parameters:(NSMutableDictionary*)parameters
      onCompletion:(DictBlock)completionBlock
           onError:(ErrorBlock)errorBlock{
    //检测网络是否可用
    if (![AFNetworkReachabilityManager sharedManager].isReachable) {
        [SVProgressHUD showErrorWithStatus:@"网络无法连接"];
        return;
    }

    //发起请求
    [[AFNetworkClient sessionManager] DELETE:url parameters:parameters success:^(NSURLSessionDataTask *task, id responseObject) {
        if(completionBlock){
            completionBlock(responseObject);
        }
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        [SVProgressHUD showErrorWithStatus:@"网络错误，请稍后再试"];
        NSLog(@"-----url:%@ \n -----error:%@",url,error);
        if (errorBlock) {
            errorBlock(error);
        }
        
    }];
    
}

@end
