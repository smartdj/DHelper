//
//  ClassThreadSafe.h
//  pangxie
//
//  Created by arthur on 17/1/10.
//  Copyright © 2017年 yuntongda. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JRSwizzle.h"

@interface NSObject(PropertyThreadSafe)
- (void)startThreadSafeProtect;
@end
