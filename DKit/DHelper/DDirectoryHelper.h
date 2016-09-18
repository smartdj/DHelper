//
//  FolderPath.h
//  QiyuExplorer
//
//  Created by 52Ruanmei on 15/10/26.
//  Copyright © 2015年 ruanmei. All rights reserved.
//

#import <Foundation/Foundation.h>

//1、Documents 目录：您应该将所有de应用程序数据文件写入到这个目录下。这个目录用于存储用户数据或其它应该定期备份的信息。
//
//2、AppName.app 目录：这是应用程序的程序包目录，包含应用程序的本身。由于应用程序必须经过签名，所以您在运行时不能对这个目录中的内容进行修改，否则可能会使应用程序无法启动。
//
//3、Library 目录：这个目录下有两个子目录：Caches 和 Preferences
//Preferences 目录：包含应用程序的偏好设置文件。您不应该直接创建偏好设置文件，而是应该使用NSUserDefaults类来取得和设置应用程序的偏好.
//Caches 目录：用于存放应用程序专用的支持文件，保存应用程序再次启动过程中需要的信息。
//
//4、tmp 目录：这个目录用于存放临时文件，保存应用程序再次启动过程中不需要的信息。
@interface DDirectoryHelper : NSObject
// 获取沙盒主目录路径
+(NSString*)rootDirectory;
// 获取Documents目录路径
+(NSString*)documentsDirectory;
// 获取Cache目录路径
+(NSString*)cacheDirectory;
// 获取tmp目录路径
+(NSString*)tempFolder;
//获取Library目录
+(NSString*)libraryDirectory;

//创建文件夹
+(BOOL)createDirectoryInDocucments:(NSString*)relativePath;
//在Cache中创建文件夹
+(BOOL)createDirectoryInCache:(NSString*)relativePath;

// 获取当前程序包中一个图片资源（apple.png）路径
+(NSString*)pathForResource:(NSString*)resourceName ofType:(NSString*)type;

+(BOOL)isDirectoryExist:(NSString*)path;
//删除文件夹
+(BOOL)deleteDirectory:(NSString *)path;


@end
