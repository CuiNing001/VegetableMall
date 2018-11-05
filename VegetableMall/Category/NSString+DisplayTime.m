//
//  NSString+DisplayTime.m
//  VegetableMall
//
//  Created by mading shouyou on 2018/11/2.
//  Copyright © 2018 madingshouyou. All rights reserved.
//

#import "NSString+DisplayTime.h"

@implementation NSString (DisplayTime)

#pragma mark - 时间戳转日期格式
+ (NSString *)conversionTimeWithTimestamp:(NSString *)timestamp
{
    NSTimeInterval second = timestamp.longLongValue/1000.0;
    NSDate *conversionDate = [NSDate dateWithTimeIntervalSince1970:second];
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *timeStr = [formatter stringFromDate:conversionDate];
    return timeStr;
}

#pragma mark - 获取当前手机时间
+ (NSString *)getLocalDate
{
    NSDate *nowDate = [NSDate date];
    NSDateFormatter *dataFormatter = [[NSDateFormatter alloc]init];
    [dataFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *nowDateString = [dataFormatter stringFromDate:nowDate];
    return nowDateString;
}

#pragma mark - 获取当前网络时间
+ (void)getNetDateWithCompletionHandler:(void(^)(NSString *timeStr))completionHandler
{
    NSString *timeString = @"http://www.ntsc.ac.cn";  // 网络时间地址
    timeString           = [timeString stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]]; //设置编码格式
    NSMutableURLRequest *timeRequest = [[NSMutableURLRequest alloc]init]; // 初始化网络请求
    [timeRequest setURL:[NSURL URLWithString:timeString]];                // 设置请求地址
    [timeRequest setCachePolicy:NSURLRequestReloadIgnoringCacheData];     // 设置网络请求忽略缓存
    [timeRequest setTimeoutInterval:5.0];                                 // 超过5秒未连接视为连接超时
    [timeRequest setHTTPShouldHandleCookies:NO];                          // 设置没有缓存
    [timeRequest setHTTPMethod:@"GET"];                                   // 设置请求方式
    NSURLSession *session = [NSURLSession sharedSession];                 // 创建请求
    NSURLSessionDataTask *task = [session dataTaskWithRequest:timeRequest completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error)
    {
        if (!error)
        {
            NSLog(@"|HOMEPAGE-VC|网络时间请求成功");
            
            NSHTTPURLResponse *timeResponse = (NSHTTPURLResponse *)response;                   // 转换请求结果格式
            NSString   *timeDate = [[timeResponse allHeaderFields]objectForKey:@"Date"];       // 接收date
            timeDate = [timeDate substringFromIndex:5];                                        // 截取时间字符串
            timeDate = [timeDate substringToIndex:[timeDate length]-4];                        // 截取时间字符串
            NSDateFormatter *dataFomatter = [[NSDateFormatter alloc]init];                     // 设置时间格式
            dataFomatter.locale  = [[NSLocale alloc]initWithLocaleIdentifier:@"en_US_POSIX"];  // 设置成zh_CN获取不到数据
            [dataFomatter setDateFormat:@"dd MMM yyyy HH:mm:ss"];                              // 设置时间格式
            NSDate      *netDate = [[dataFomatter dateFromString:timeDate]dateByAddingTimeInterval:60*60*8];  // 获取到的时间增加8小时(美国-中国时差)
            NSTimeZone *timeZone = [NSTimeZone systemTimeZone];                 // 设置时区
            NSInteger   interval = [timeZone secondsFromGMTForDate:netDate];    // 当前时间与世界标准时间的时间差
            NSDate    *localDate = [netDate dateByAddingTimeInterval:interval]; // 当前网络时间（加上与世界时间的时间差）
            NSString    *tmpDate = [NSString stringWithFormat:@"%@",localDate]; // localDate转换成字符串格式
            tmpDate = [tmpDate stringByReplacingOccurrencesOfString:@" +0000" withString:@""];  // 替换非法字符串（取消掉+0000）
            NSDateFormatter *format=[[NSDateFormatter alloc]init];        // 设置时间格式
            [format setDateFormat:@"yyyy-MM-dd HH:mm:ss"];                // 设置时间格式
            NSDate      *nowDate = [format dateFromString:tmpDate];       // 获取时间date
            NSString *nowDateStr = [format stringFromDate:nowDate];       // date格式转换成字符串（获取当前网络时间）
            completionHandler(nowDateStr);
        }
        else
        {
            [[AlertManager alertShareManager]toastWithMessage:@"时间获取失败" time:2.0];
            NSString *nowDateStr = @"";
            completionHandler(nowDateStr);
        }
    }];
    
    [task resume]; // 开始网络请求
}



@end
