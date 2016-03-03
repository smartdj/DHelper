//
//  DPathHelper.m
//  QiyuExplorer
//
//  Created by DJ on 15/12/15.
//  Copyright © 2015年 ruanmei. All rights reserved.
//

#import "DPathHelper.h"
#import "DDirectoryHelper.h"
@implementation DPathHelper
//替换图标的网址，并把网址和准备下载后保存的路径放到字典里
//+(NSString*)getIconLocalSavePath:(NSString*)iconUrl
//{
//    NSString* md5Name = [DEncryptHelper md5_16:iconUrl];
//    
//    if([DDirectoryHelper createDirectoryInDocucments:CLOUD_FILES_ICONS_DIRECTORY])
//    {
//        NSString* filePath = [NSString stringWithFormat:@"%@%@.jpg", CLOUD_FILES_ICONS_DIRECTORY, md5Name];
//        return filePath;
//    }
//    return nil;
//}

//+(NSString*)favIconPath:(NSString*)favIconFileName
//{
//    NSString* documentsPath = [DDirectoryHelper documentsDirectory];
//    NSString* filePath = [documentsPath stringByAppendingPathComponent:FAV_ICON_DIRECTORY];
//    
//    if([DDirectoryHelper isDirectoryExist:filePath] == NO)
//        [DDirectoryHelper createDirectoryInDocucments:FAV_ICON_DIRECTORY];
//    
//    filePath = [filePath stringByAppendingPathComponent:favIconFileName];
//
//    return filePath;
//}

@end
