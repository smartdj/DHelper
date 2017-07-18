//
//  DFileHelper.h
//  QiyuExplorer
//
//  Created by 52Ruanmei on 15/10/26.
//  Copyright © 2015年 ruanmei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DFileHelper : NSObject

+(NSString*)getFilePathInDocumentsDirectory:(NSString*)relativePath;
+(BOOL)saveFileToPath:(NSString*)path FileData:(NSData*)fileData;
+(NSData*)readDataInPath:(NSString*)path;
+(NSString*)readStringInPath:(NSString*)path;
+(NSString*)readStringFromBundle:(NSString*) bundleFullName withFileName:(NSString*)fileName;
+(NSData*)readDataFromBundle:(NSString*) bundleFullName withFileName:(NSString*)fileName;

//文件属性
+(NSDictionary *)getFileAttriutesInPath:(NSString*)path;
+(unsigned long long) getFileSizeInPath:(NSString *)filePath;

//删除文件
+(BOOL)deleteFileInPath:(NSString*)path;
+(BOOL)isFileExistInPath:(NSString*)path;
+(BOOL)renameFile:(NSString*)oldFilePath to:(NSString*)newFilePath;
+(BOOL)moveFileFrom:(NSString *)originalPath to:(NSString *)destPath;

+(NSString*) fullFilePathFromBundle:(NSString*) bundleFullName withFileName:(NSString*)fileName;

//枚举目录，返回的ARRAY中存放的是路径，使用NSDictionary,value为1表示当前路径为目录，value为0表示当前路径为文件。
+(NSArray *)enumerateFileInPath:(NSString *)path;
@end
