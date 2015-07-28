//
//  UIButton+K.h
//  Login
//
//  Created by apple on 14/11/18.
//  Copyright (c) 2014年 TJF. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (K)
/**
 *  初始化通话界面按钮
 */
- (void)initWithCallButtonBackgroundWithNormalImage:(NSString *)normal highlightedImage:(NSString *)highlighted selectedImage:(NSString *)selected disabledImage:(NSString *)disabled;

@end
