//
//  SingletonUIViewController.h
//  QiyuExplorer
//
//  Created by DJ on 16/1/20.
//  Copyright © 2016年 ruanmei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SingletonUIViewController : UIViewController
+(instancetype) sharedInstance;
+ (void)destroyInstance;
@property (assign, readonly) BOOL isInitialized;
@end
