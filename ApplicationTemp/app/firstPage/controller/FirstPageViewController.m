//
//  FirstPageViewController.m
//  ApplicationTemp
//
//  Created by 陈园 on 15/11/5.
//  Copyright © 2015年 陈园. All rights reserved.
//

#import "FirstPageViewController.h"
#import "NoticeViewController.h"

@interface FirstPageViewController ()

@end

@implementation FirstPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"提醒" style:UIBarButtonItemStyleDone target:self action:@selector(goToTwoPage)];
}

- (void)goToTwoPage{
    NoticeViewController *noticeVC = [[NoticeViewController alloc] init];
    noticeVC.title = @"提醒";
    [self.navigationController pushViewController:noticeVC animated:YES];
    
}





@end
