//
//  Z-Order.h
//  ITHomeClient
//
//  Created by dj wang on 12-5-15.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UIView (Z_Order)
{
    
}
-(NSUInteger)getSubviewIndex;
-(void)bringToFront; 
-(void)sendToBack;
-(void)bringOneLevelUp; 
-(void)sendOneLevelDown;
-(BOOL)isInFront; 
-(BOOL)isAtBack;
-(void)swapDepthsWithView:(UIView*)swapView;
@end