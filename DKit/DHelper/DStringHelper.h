//
//  DJStrings.h
//  QiyuExplorer
//
//  Created by 52Ruanmei on 15/10/30.
//  Copyright © 2015年 ruanmei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DStringHelper : NSObject
+(NSString*)removeLastCharacter:(NSMutableString*)str;

+(NSString*)remove:(NSMutableString*)string prefix:(NSString*)prefix;
@end
