//
//  FolderPath.m
//  QiyuExplorer
//
//  Created by 52Ruanmei on 15/10/26.
//  Copyright © 2015年 ruanmei. All rights reserved.
//

#import "DDirectoryHelper.h"

@implementation DDirectoryHelper

// 获取沙盒主目录路径
+(NSString*)rootDirectory
{
    return NSHomeDirectory();
}

// 获取Documents目录路径
+(NSString*)documentsDirectory
{
    //[NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    //NSLog(@"app_home_doc: %@",documentsDirectory);
    return documentsDirectory;
}

// 获取Cache目录路径
+(NSString*)cacheDirectory
{
    NSArray *cacPath = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *cachePath = [cacPath objectAtIndex:0];
    //NSLog(@"app_home_lib_cache: %@",cachePath);
    return cachePath;
}

// 获取tmp目录路径
+(NSString*)tempFolder
{
    return NSTemporaryDirectory();
}

//获取Library目录
+(NSString*)libraryDirectory
{
    //[NSHomeDirectory() stringByAppendingPathComponent:@"Library"];
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
    NSString *libraryDirectory = [paths objectAtIndex:0];
    //NSLog(@"app_home_lib: %@",libraryDirectory);
    return libraryDirectory;
}

//创建文件夹
+(BOOL)createDirectoryInDocucments:(NSString*)relativePath
{
    NSString *documentsPath =[self documentsDirectory];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *testDirectory = [documentsPath stringByAppendingPathComponent:relativePath];
    
    if([self isDirectoryExist:testDirectory])
        return YES;
    
    // 创建目录
    BOOL res=[fileManager createDirectoryAtPath:testDirectory withIntermediateDirectories:YES attributes:nil error:nil];
    if (res) {
        NSLog(@"文件夹创建成功");
    }else
        NSLog(@"文件夹创建失败");
    return res;
}

//在Cache中创建文件夹
+(BOOL)createDirectoryInCache:(NSString*)relativePath
{
    NSString *cachePath =[self cacheDirectory];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *testDirectory = [cachePath stringByAppendingPathComponent:relativePath];
    
    if([self isDirectoryExist:testDirectory])
        return YES;
    
    // 创建目录
    BOOL res=[fileManager createDirectoryAtPath:testDirectory withIntermediateDirectories:YES attributes:nil error:nil];
    if (res) {
        NSLog(@"文件夹创建成功");
    }else
        NSLog(@"文件夹创建失败");
    return res;
}

//文件夹是否存在
+(BOOL)isDirectoryExist:(NSString*)path
{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    //判断文件夹是否存在
    BOOL isDir = FALSE;
    if([fileManager fileExistsAtPath:path
                         isDirectory:&isDir] && isDir)
    {
        return YES;
    }
    return  NO;
}

// 获取当前程序包中一个图片资源（apple.png）路径
+(NSString*)pathForResource:(NSString*)resourceName ofType:(NSString*)type
{
    return [[NSBundle mainBundle] pathForResource:resourceName ofType:type];
}


+(BOOL)deleteDirectory:(NSString *)path
{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    BOOL isDir = FALSE;
    if([fileManager fileExistsAtPath:path
                         isDirectory:&isDir]){
        if(isDir){
            return [fileManager removeItemAtPath:path error:nil];
        }
    }
    return YES;
}
@end
