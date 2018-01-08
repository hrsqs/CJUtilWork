//
//  CJMacro.h
//  CJUtilWork
//
//  Created by 陈敬 on 2018/1/8.
//  Copyright © 2018年 陈敬. All rights reserved.
//

// 字符串是否为空
#define kStringIsEmpty(str) ([str isKindOfClass:[NSNull class]] || str == nil || [str length] < 1 ? YES : NO )

// 数组是否为空
#define kArrayIsEmpty(array) (array == nil || [array isKindOfClass:[NSNull class]] || array.count == 0)

// 字典是否为空
#define kDictIsEmpty(dic) (dic == nil || [dic isKindOfClass:[NSNull class]] || dic.allKeys == 0)

// 是否是空对象
#define kObjectIsEmpty(_object) (_object == nil \
|| [_object isKindOfClass:[NSNull class]] \
|| ([_object respondsToSelector:@selector(length)] && [(NSData *)_object length] == 0) \
|| ([_object respondsToSelector:@selector(count)] && [(NSArray *)_object count] == 0))

// 屏宽
#define kScreenWidth \
([[UIScreen mainScreen] respondsToSelector:@selector(nativeBounds)] ? [UIScreen mainScreen].nativeBounds.size.width/[UIScreen mainScreen].nativeScale : [UIScreen mainScreen].bounds.size.width)
// 屏高
#define kScreenHeight \
([[UIScreen mainScreen] respondsToSelector:@selector(nativeBounds)] ? [UIScreen mainScreen].nativeBounds.size.height/[UIScreen mainScreen].nativeScale : [UIScreen mainScreen].bounds.size.height)
// 屏的size(宽、高)
#define kScreenSize \
([[UIScreen mainScreen] respondsToSelector:@selector(nativeBounds)] ? CGSizeMake([UIScreen mainScreen].nativeBounds.size.width/[UIScreen mainScreen].nativeScale,[UIScreen mainScreen].nativeBounds.size.height/[UIScreen mainScreen].nativeScale) : [UIScreen mainScreen].bounds.size)

// APP对象 （单例对象）
#define kApplication [UIApplication sharedApplication]
// 主窗口 （keyWindow）
#define kKeyWindow [UIApplication sharedApplication].keyWindow
// APP对象的delegate
#define kAppDelegate [UIApplication sharedApplication].delegate
// NSUserDefaults实例化
#define kUserDefaults [NSUserDefaults standardUserDefaults]
// 通知中心 （单例对象）
#define kNotificationCenter [NSNotificationCenter defaultCenter]

// APP版本号
#define kAppVersion [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]

// 设备iOS系统版本号
#define kSystemVersion [[UIDevice currentDevice] systemVersion]

// 获取当前语言
#define kCurrentLanguage ([[NSLocale preferredLanguages] objectAtIndex:0])

// 判断是否为iPhone
#define kISiPhone (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
// 判断是否为iPad
#define kISiPad (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)


// 获取沙盒的Document路径
#define kDocumentPath [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject]
// 获取沙盒的temp路径
#define kTempPath NSTemporaryDirectory()
// 获取沙盒的Cache路径
#define kCachePath [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject]

// 开发的时候打印，但是发布的时候不打印的NSLog
#ifdef DEBUG
#define NSLog(...) NSLog(@"%s 第%d行 \n %@\n\n",__func__,__LINE__,[NSString stringWithFormat:__VA_ARGS__])
#else
#define NSLog(...)
#endif

// RGB格式
#define kRGBColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
// RGBA格式 （A：alpha）
#define kRGBAColor(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(r)/255.0 blue:(r)/255.0 alpha:a]
// 随机色生成
#define kRandomColor KRGBColor(arc4random_uniform(256)/255.0,arc4random_uniform(256)/255.0,arc4random_uniform(256)/255.0)
// rgb颜色转换（16进制 --> 10进制）
#define kUIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

// 弱引用/强引用
#define kWeakSelf(type)  __weak typeof(type) weak##type = type;
#define kStrongSelf(type) __strong typeof(type) type = weak##type;

// 获取一段时间间隔
#define kStartTime CFAbsoluteTime start = CFAbsoluteTimeGetCurrent();
#define kEndTime  NSLog(@"Time: %f", CFAbsoluteTimeGetCurrent() - start)

// NavigationBar高度 （44）
#define TopStatus_NavigationHeight(x) ([[UIApplication sharedApplication] statusBarFrame].size.height + x.navigationController.navigationBar.frame.size.height)
// tabBar高度 （49）
#define TabBar_HEIGHT 49

// 读取 本地图片
#define LOADIMAGE(file,ext) [UIImage imageWithContentsOfFile:[NSBundle mainBundle] pathForResource:file ofType:ext］
// 定义UIImage对象 （路径）
#define IMAGE(A) [UIImage imageWithContentsOfFile:[NSBundle mainBundle] pathForResource:A ofType:nil］

// 单例化一个类
#define SYNTHESIZE_SINGLETON_FOR_CLASS(classname) \
\
static classname *shared##classname = nil; \
\
+ (classname *)shared##classname \
{ \
    @synchronized(self) \
    { \
        if (shared##classname == nil) \
        { \
            shared##classname = ［self alloc] init]; \
        } \
    } \
    \
    return shared##classname; \
} \
\
+ (id)allocWithZone:(NSZone *)zone \
{ \
    @synchronized(self) \
    { \
        if (shared##classname == nil) \
        { \
            shared##classname = [super allocWithZone:zone]; \
            return shared##classname; \
        } \
    } \
    \
    return nil; \
} \
\
- (id)copyWithZone:(NSZone *)zone \
{ \
    return self; \
}

