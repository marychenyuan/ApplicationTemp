//
//  ATCommonDefine.h
//  ApplicationTemp
//
//  Created by 陈园 on 15/11/4.
//  Copyright © 2015年 陈园. All rights reserved.
//


#ifndef ATCommonDefine_h
#define ATCommonDefine_h

/**
 *  view及样式
 */
#define ATScreenWidth     [UIScreen mainScreen].bounds.size.width
#define ATScreenHeight    [UIScreen mainScreen].bounds.size.height

// 是否高清屏
#define isRetina ([[UIScreen mainScreen] scale] > 1.0f)

// 是否iPad
#define isPad (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)

// 是否模拟器
#define isSimulator (NSNotFound != [[[UIDevice currentDevice] model] rangeOfString:@"Simulator"].location)

// 导航栏标题的字体
#define ATNavigationTitleFont [UIFont boldSystemFontOfSize:20]



/**
 *  color
 */
#define RGB(r, g, b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1]
#define RGBA(r, g, b, a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

/**
 *  path
 */
#define DOCUMENT_PATH [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0]

#define CACHES_PATH [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) objectAtIndex:0]

/**
 *  缩写
 */
#define uDefault [NSUserDefaults standardUserDefaults]
#define fileMng [NSFileManager defaultManager]
#define curVersion [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"]
#define appDelegate (GGAppDelegate*)[UIApplication sharedApplication].delegate

// 调试打印
#if DEBUG
#define NSLog(FORMAT, ...) fprintf(stderr,"[类:%s %d行]%s\n",[[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String], __LINE__, [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);
#else
#define NSLog(FORMAT, ...) nil
#endif

// 创建单例对象
// .h文件
#define SingletonH(name) + (instancetype)shared##name;

// .m文件
#if __has_feature(objc_arc)

#define SingletonM(name) \
static id _instace; \
\
+ (id)allocWithZone:(struct _NSZone *)zone \
{ \
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{ \
_instace = [super allocWithZone:zone]; \
}); \
return _instace; \
} \
\
+ (instancetype)shared##name \
{ \
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{ \
_instace = [[self alloc] init]; \
}); \
return _instace; \
} \
\
- (id)copyWithZone:(NSZone *)zone \
{ \
return _instace; \
}

#else

#define SingletonM(name) \
static id _instace; \
\
+ (id)allocWithZone:(struct _NSZone *)zone \
{ \
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{ \
_instace = [super allocWithZone:zone]; \
}); \
return _instace; \
} \
\
+ (instancetype)shared##name \
{ \
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{ \
_instace = [[self alloc] init]; \
}); \
return _instace; \
} \
\
- (id)copyWithZone:(NSZone *)zone \
{ \
return _instace; \
} \
\
- (oneway void)release { } \
- (id)retain { return self; } \
- (NSUInteger)retainCount { return 1;} \
- (id)autorelease { return self;}
#endif





/**
 *  app key
 */



/**
 *  notification message
 */





#endif
