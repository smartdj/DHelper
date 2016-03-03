//
//  DOCRuntimeHelper.h
//  QiyuExplorer
//
//  Created by DJ on 16/1/14.
//  Copyright © 2016年 ruanmei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DOCRuntimeHelper : NSObject
+(void)printClassAllMethod:(Class)needPrintClass;
+(void)printClassAllProperty:(Class)needPrintClass;
@end
