//
//  DFileHelper.m
//  QiyuExplorer
//
//  Created by 52Ruanmei on 15/10/26.
//  Copyright © 2015年 ruanmei. All rights reserved.
//

#import "DFileHelper.h"
#import "DDirectoryHelper.h"
#import "LGHelper.h"
@implementation DFileHelper

+(NSString*)getFilePathInDocumentsDirectory:(NSString*)relativePath
{
    NSString *documentsPath =[DDirectoryHelper documentsDirectory];
    NSString *dstPath = [documentsPath stringByAppendingPathComponent:relativePath];
    return dstPath;
}

+(BOOL)saveFileToPath:(NSString*)path FileData:(NSData*)fileData
{
    BOOL res=[fileData writeToFile:path atomically:YES];
    if (res) {
        DLog(@"文件写入成功");
    }else
        DLog(@"文件写入失败");
    return res;
}

+(NSData*)readDataInPath:(NSString*)path
{
    NSData *data = [NSData dataWithContentsOfFile:path];
    //NSLog(@"文件读取成功: %@",[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
    return data;
}


+(NSString*)readStringInPath:(NSString*)path
{
    NSData* data = [self readDataInPath:path];
    if(data)
    {
        NSString* string = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        return string;
    }
    return nil;
}

+(NSString*)readStringFromBundle:(NSString*) bundleFullName withFileName:(NSString*)fileName
{
    NSString* fileFullPath = [self fullFilePathFromBundle:bundleFullName withFileName:fileName];
    
    if (fileFullPath && fileFullPath.length > 0)
    {
        return [self readStringInPath:fileFullPath];
    }
    return nil;
}

+(NSData*)readDataFromBundle:(NSString*) bundleFullName withFileName:(NSString*)fileName
{
    NSString* fileFullPath = [self fullFilePathFromBundle:bundleFullName withFileName:fileName];
    
    if (fileFullPath && fileFullPath.length > 0)
    {
        return [self readDataInPath:fileFullPath];
    }
    return nil;
}

//获取bundle中的资源路径
+(NSString*) fullFilePathFromBundle:(NSString*) bundleFullName withFileName:(NSString*)fileName
{
    NSString *bundlePath=[[NSBundle mainBundle]pathForResource:[bundleFullName stringByDeletingPathExtension] ofType:[bundleFullName pathExtension]];//获取bundle路径，我的bundle包名为image.bundle
    if ([bundlePath length]>0)//判断路径是否获取成功
    {
        //定义bundle,获取自定义包
        NSBundle *bundle = [NSBundle bundleWithPath:bundlePath];
        
        if (bundle != nil)
        {
            NSString* fileFullPath = [bundle pathForResource:[fileName stringByDeletingPathExtension]ofType:[fileName pathExtension]];
            
            if ([fileFullPath length]>0)
            {
                return fileFullPath;
            }
        }
    }
    return nil;
}
//文件属性
+(NSDictionary *)getFileAttriutesInPath:(NSString*)path
{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    NSDictionary *fileAttributes = [fileManager attributesOfItemAtPath:path error:nil];
    
    //id key, value;
    
    return fileAttributes;
//    NSInteger count = keys.count;
//    
//    for (NSInteger i = 0; i < count; i++)
//    {
//        key = [keys objectAtIndex: i];
//        value = [fileAttributes objectForKey: key];
//        NSLog (@"Key: %@ for value: %@", key, value);
//    }
}

+(unsigned long long) getFileSizeInPath:(NSString *)filePath
{
    NSDictionary *fileAttributes = [self getFileAttriutesInPath:filePath];
    NSNumber *fileSize = fileAttributes[@"NSFileSize"];
    if(fileSize)
    {
        return fileSize.unsignedLongLongValue;
    }
    return 0;
}

//删除文件
+(BOOL)deleteFileInPath:(NSString*)path
{
    NSFileManager *fileManager = [NSFileManager defaultManager];
  
    //文件是否存在
    if([self isFileExistInPath:path])
    {
        return [fileManager removeItemAtPath:path error:nil];
    }
    
    return NO;
}


//重命名
+(BOOL)renameFile:(NSString*)oldFilePath to:(NSString*)newFilePath
{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if([self isFileExistInPath:oldFilePath])
    {
        if([self isFileExistInPath:newFilePath])
           [self deleteFileInPath:newFilePath];
        //判断是否移动
        NSError* error = nil;
        return [fileManager moveItemAtPath:oldFilePath toPath:newFilePath error:&error];
    }
    return NO;
}

+(BOOL)isFileExistInPath:(NSString*)path
{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    return [fileManager fileExistsAtPath:path];
}

+(NSArray *)enumerateFileInPath:(NSString *)path
{
    NSMutableArray *paths = [[NSMutableArray alloc] init];

    NSFileManager *fm = [NSFileManager defaultManager];
    //（深度遍历，会递归枚举它的内容）
    NSDirectoryEnumerator<NSString *> *dirEnum = [fm enumeratorAtPath:path];
    
    while ((path = [dirEnum nextObject]) != nil)
    {
        NSDictionary *pathObj = nil;
        NSLog(@"%@",path);
        
        BOOL isDirectory;
        [fm fileExistsAtPath:path isDirectory:&isDirectory];
        if(isDirectory == YES)
        {
            pathObj = [NSDictionary dictionaryWithObjectsAndKeys:@1, path, nil];
        }
        else
        {
            pathObj = [NSDictionary dictionaryWithObjectsAndKeys:@0, path, nil];
        }
        [paths addObject:pathObj];
    }
    return paths;
}
@end
