//
//  Constants.h
//  About Me
//
//  Created by Mason Wolters on 5/1/13.
//  Copyright (c) 2013 Big Head Apps. All rights reserved.
//

#import <Foundation/Foundation.h>

#define UIColorFromRGB(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#define backgroundColorHEX 0xeeeeee

@interface Constants : NSObject

@end
