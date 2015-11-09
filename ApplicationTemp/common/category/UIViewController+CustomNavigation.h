//
//  UIViewController+CustomNavigation.h
//  ApplicationTemp
//
//  Created by 陈园 on 15/11/5.
//  Copyright © 2015年 陈园. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (CustomNavigation)

@property (nonatomic, strong) NSDictionary *inputParameter;
@property (nonatomic, copy) void (^outputTransmitter)(NSDictionary *parameter);

+ (UIViewController *)getRootViewControllerFromNavigationController:(UINavigationController *)navigationController;

@end