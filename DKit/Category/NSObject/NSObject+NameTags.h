//
//  NSObject+NameTags.h
//  QiyuExplorer
//
//  Created by 52Ruanmei on 15/11/14.
//  Copyright © 2015年 ruanmei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject(NameTags)
-(id)nameTag;
-(void)setNameTag:(NSString*)theNameTag;
-(NSString*)objectIdentifier;
@end
