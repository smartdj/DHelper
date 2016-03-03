//
//  Z-Order.m
//  ITHomeClient
//
//  Created by dj wang on 12-5-15.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "Z-Order.h"

@implementation UIView(Z_Order)
-(NSUInteger)getSubviewIndex
{ 
    return [self.superview.subviews indexOfObject:self]; 
}
-(void)bringToFront 
{ 
    [self.superview bringSubviewToFront:self]; 
}
-(void)sendToBack 
{ 
    [self.superview sendSubviewToBack:self]; 
}
-(void)bringOneLevelUp 
{ 
    NSUInteger currentIndex = [self getSubviewIndex];
    [self.superview exchangeSubviewAtIndex:currentIndex withSubviewAtIndex:currentIndex+1]; 
}
-(void)sendOneLevelDown 
{ 
    NSUInteger currentIndex = [self getSubviewIndex]; 
    [self.superview exchangeSubviewAtIndex:currentIndex withSubviewAtIndex:currentIndex-1]; 
}
-(BOOL)isInFront 
{ 
    return ([self.superview.subviews lastObject]==self); 
}
-(BOOL)isAtBack 
{ 
    return ([self.superview.subviews objectAtIndex:0]==self); 
}
-(void)swapDepthsWithView:(UIView*)swapView 
{ 
    [self.superview exchangeSubviewAtIndex:[self getSubviewIndex] withSubviewAtIndex:[swapView getSubviewIndex]]; 
}

@end

