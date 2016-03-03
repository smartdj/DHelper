//
//  UIWebView+screenshot.m
//  QiyuExplorer
//
//  Created by DJ on 15/11/27.
//  Copyright © 2015年 ruanmei. All rights reserved.
//

#import "UIWebView+ScreenShot.h"

@implementation UIWebView (ScreenShot)
- (UIImage *)screenShotWithHeigh:(CGFloat)screenShotHeight
{
    CGSize boundsSize = self.bounds.size;
    CGFloat boundsWidth = self.bounds.size.width;
    CGFloat boundsHeight = self.bounds.size.height;
    
    CGPoint offset = self.scrollView.contentOffset;
    [self.scrollView setContentOffset:CGPointMake(0, 0)];
    
    CGFloat contentHeight ;
    
    if(screenShotHeight <= 0)
    {
        contentHeight = self.scrollView.contentSize.height;
    }
    else
        contentHeight = screenShotHeight;
    
    
    NSMutableArray *images = [NSMutableArray array];
    
    while (contentHeight > 0)
    {
        if(&UIGraphicsBeginImageContextWithOptions != NULL)
        {
            UIGraphicsBeginImageContextWithOptions(boundsSize, NO, 0.0);
        }
        else
        {
            UIGraphicsBeginImageContext(boundsSize);
        }
        
        [self.layer renderInContext:UIGraphicsGetCurrentContext()];
        UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        [images addObject:image];
        
        CGFloat offsetY = self.scrollView.contentOffset.y;
        [self.scrollView setContentOffset:CGPointMake(0, offsetY + boundsHeight)];
        contentHeight -= boundsHeight;
    }
    [self.scrollView setContentOffset:offset];
    
    if(&UIGraphicsBeginImageContextWithOptions != NULL)
    {
        UIGraphicsBeginImageContextWithOptions(self.scrollView.contentSize, NO, 0.0);
    }
    else
    {
        UIGraphicsBeginImageContext(self.scrollView.contentSize);
    }
    
    [images enumerateObjectsUsingBlock:^(UIImage *image, NSUInteger idx, BOOL *stop) {
        [image drawInRect:CGRectMake(0, boundsHeight * idx, boundsWidth, boundsHeight)];
    }];
    UIImage *fullImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return fullImage;
}

- (NSData *)PDFData{
    UIViewPrintFormatter *fmt = [self viewPrintFormatter];
    UIPrintPageRenderer *render = [[UIPrintPageRenderer alloc] init];
    [render addPrintFormatter:fmt startingAtPageAtIndex:0];
    CGRect page;
    page.origin.x=0;
    page.origin.y=0;
    page.size.width=600;
    page.size.height=768;
    
    CGRect printable=CGRectInset( page, 50, 50 );
    [render setValue:[NSValue valueWithCGRect:page] forKey:@"paperRect"];
    [render setValue:[NSValue valueWithCGRect:printable] forKey:@"printableRect"];
    
    NSMutableData * pdfData = [NSMutableData data];
    UIGraphicsBeginPDFContextToData( pdfData, CGRectZero, nil );
    
    for (NSInteger i=0; i < [render numberOfPages]; i++)
    {
        UIGraphicsBeginPDFPage();
        CGRect bounds = UIGraphicsGetPDFContextBounds();
        [render drawPageAtIndex:i inRect:bounds];
        
    }
    UIGraphicsEndPDFContext();
    return pdfData;
}
@end
