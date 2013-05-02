//
//  ImageAnimateItem.m
//  About Me
//
//  Created by Mason Wolters on 5/1/13.
//  Copyright (c) 2013 Big Head Apps. All rights reserved.
//

#import "ImageAnimateItem.h"

@implementation ImageAnimateItem

@synthesize yPosition;
@synthesize delegate;

- (id)initWithImageName:(NSString *)imageName yPosition:(float)yPos width:(float)width {
    self = [super init];
    
    self.yPosition = yPos;
    
    UIImage *image = [UIImage imageNamed:imageName];
    
    float heightOfImage = (width/image.size.width) * image.size.height;
    NSLog(@"heigh of image: %f", heightOfImage);
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake((320 - width)/2, yPos, width, heightOfImage)];
    imageView.image = image;
    imageView.layer.cornerRadius = 10.0f;
    imageView.layer.masksToBounds = YES;
    imageView.userInteractionEnabled = YES;

    
    self.view = imageView;
    
    return self;
}

- (void)addGestureRecognizerForSailingVideo {
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(sailingVideoTap)];
    [self.view addGestureRecognizer:tap];
}

- (void)addGestureRecognizerForWhirlygigVideo {
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(whirlygigVideoTap)];
    [self.view addGestureRecognizer:tap];
}

- (void)addGestureRecognizerForTimelapseVideo {
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(timelapseVideoTap)];
    [self.view addGestureRecognizer:tap];
}

- (void)addGestureRecognizerForTypographyVideo {
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(typographyVideoTap)];
    [self.view addGestureRecognizer:tap];
}

- (void)addGestureRecognizerForTempleRunVideo {
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(templeRunVideoTap)];
    [self.view addGestureRecognizer:tap];
}

- (void)sailingVideoTap {
    [delegate tapSailingVideo];
}

- (void)whirlygigVideoTap {
    [delegate tapWhirlygigVideo];
}

- (void)timelapseVideoTap {
    [delegate tapTimelapseVideo];
}

- (void)typographyVideoTap {
    [delegate tapTypographyVideo];
}

- (void)templeRunVideoTap {
    [delegate tapTempleRunVideo];
}

@end
