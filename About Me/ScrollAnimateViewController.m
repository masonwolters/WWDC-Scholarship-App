//
//  ScrollAnimateViewController.m
//  About Me
//
//  Created by Mason Wolters on 4/29/13.
//  Copyright (c) 2013 Big Head Apps. All rights reserved.
//

#import "ScrollAnimateViewController.h"

@interface ScrollAnimateViewController ()

@end

@implementation ScrollAnimateViewController

@synthesize scrollView;
@synthesize animateItems = _animateItems;

- (void)setAnimateItems:(NSArray *)animateItems1 {
    _animateItems = animateItems1;
    
    
    itemsOrderedByStart = [NSMutableArray arrayWithArray:[self sortedArrayBasedOnTriggerPoint:animateItems1 startPoint:YES]];
    itemsOrderedByFinish = [NSMutableArray arrayWithArray:[self sortedArrayBasedOnTriggerPoint:animateItems1 startPoint:NO]];
    
    triggerPoints = [NSMutableArray arrayWithArray:[self getArrayWithTriggers:itemsOrderedByStart startPoint:YES]];
    triggerEndPoints = [NSMutableArray arrayWithArray:[self getArrayWithTriggers:itemsOrderedByFinish startPoint:NO]];
    
    backwardIndexes = [NSMutableArray array];
    for (ScrollAnimateItem *item in itemsOrderedByFinish) {
        [backwardIndexes addObject:[NSNumber numberWithInt:[itemsOrderedByStart indexOfObject:item]]];
    }
    
    for (ScrollAnimateItem *item in animateItems1) {
        CGAffineTransform transform = item.view.transform;
        if (!isnan(item.startOpacity)) {
            NSLog(@"item opacity: %f", item.startOpacity);
            item.view.alpha = item.startOpacity;
        }
        if (!isnan(item.startScale)) {
            transform = CGAffineTransformScale(transform, item.startScale, item.startScale);
        }
        
        item.view.transform = transform;
        [originalTransforms addObject:NSStringFromCGAffineTransform(transform)];
        
        NSLog(@"view class: %@", item.view.class);
        
        [self.scrollView addSubview:item.view];

    
    }
    
    
}

- (NSArray*)sortedArrayBasedOnTriggerPoint:(NSArray*)array startPoint:(BOOL)startPoint {
    NSArray *newArray;
    
    if (startPoint) {
        newArray = [array sortedArrayUsingComparator:^NSComparisonResult(ScrollAnimateItem *first, ScrollAnimateItem *second) {
            if (first.startScrollPosition > second.startScrollPosition) {
                return NSOrderedDescending;
            } else if (first.startScrollPosition < second.startScrollPosition) {
                return NSOrderedAscending;
            } else {
                return NSOrderedSame;
            }
        }];
    } else {
        newArray = [array sortedArrayUsingComparator:^NSComparisonResult(ScrollAnimateItem *first, ScrollAnimateItem *second) {
            if (first.finishScrollPosition > second.finishScrollPosition) {
                return NSOrderedDescending;
            } else if (first.finishScrollPosition < second.finishScrollPosition) {
                return NSOrderedAscending;
            } else {
                return NSOrderedSame;
            }
        }];
    }

    
    return newArray;
}

- (NSArray*)getArrayWithTriggers:(NSArray*)array startPoint:(BOOL)startPoint {
    NSMutableArray *new = [NSMutableArray array];
    for (ScrollAnimateItem *item in array) {
        if (startPoint) {
            [new addObject:[NSNumber numberWithInt:item.startScrollPosition]];
        } else {
            [new addObject:[NSNumber numberWithInt:item.finishScrollPosition]];
        }
    }
    return new;
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView1 {
    /*
    //checks to see if it has reached any of the trigger points
    if (numberOfPointsTriggered < triggerPoints.count) {
        if (scrollView.contentOffset.y > [triggerPoints[numberOfPointsTriggered] floatValue]) {
            //point triggered, start animation
            NSLog(@"begin animating");
            [indexesAnimating addObject:[NSNumber numberWithInt:numberOfPointsTriggered]];
            
            numberOfPointsTriggered ++;
        }
    }

    
    //checks to see if it has reached any of the end trigger points
    if (numberOfPointsEndTriggered < triggerEndPoints.count) {
        if (scrollView.contentOffset.y > [triggerEndPoints[numberOfPointsEndTriggered] floatValue]) {
            //end point reached, stop animating
            NSLog(@"remove object at index: %i", [backwardIndexes[numberOfPointsEndTriggered] intValue]);
            [indexesAnimating removeObjectAtIndex:[backwardIndexes[numberOfPointsEndTriggered] intValue]];
            
            numberOfPointsEndTriggered ++;
        }
    }
    if (numberOfPointsEndTriggered - 1 > -1 && numberOfPointsEndTriggered - 1 < triggerEndPoints.count) {
        if (scrollView.contentOffset.y < [triggerEndPoints[numberOfPointsEndTriggered - 1] floatValue]) {
            [indexesAnimating addObject:[NSNumber numberWithInt:[backwardIndexes[numberOfPointsEndTriggered - 1] intValue]]];
            numberOfPointsEndTriggered -- ;
        }
    }
    

    
    for (NSNumber *index in indexesAnimating) {
        //do the actual animating
        NSLog(@"in animating index: %i", [index intValue]);
        ScrollAnimateItem *animatingItem = [itemsOrderedByStart objectAtIndex:[index intValue]];
        
        if (animatingItem.finishScrollPosition < scrollView1.contentOffset.y) {
            break;
        }
        if (animatingItem.startScrollPosition > scrollView1.contentOffset.y) {
            break;
        }
        
        float percentDone = (scrollView.contentOffset.y - animatingItem.startScrollPosition)/(animatingItem.finishScrollPosition - animatingItem.startScrollPosition);

        if (!isnan(animatingItem.startOpacity)) {
            //should animate opacity
            float opacityAnimated = (animatingItem.finishOpacity - animatingItem.startOpacity) * percentDone + animatingItem.startOpacity;
            animatingItem.view.alpha = opacityAnimated;
        }
        if (!isnan(animatingItem.startScale)) {
            //should animate scale
            float scaleAnimated = (animatingItem.finishScale - animatingItem.startScale) * percentDone + animatingItem.startScale;
            animatingItem.view.transform = CGAffineTransformMakeScale(scaleAnimated, scaleAnimated);
        }

    }*/
    
    int i = 0;
    for (ScrollAnimateItem *animatingItem in _animateItems) {
        //do the actual animating
        if (scrollView.contentOffset.y > animatingItem.startScrollPosition && scrollView.contentOffset.y < animatingItem.finishScrollPosition) {
            
            float percentDone = (scrollView.contentOffset.y - animatingItem.startScrollPosition)/(animatingItem.finishScrollPosition - animatingItem.startScrollPosition);
            
            CGAffineTransform scaleTransform;
            CGAffineTransform translateTransform;
            
            if (!isnan(animatingItem.startOpacity)) {
                //should animate opacity
                float opacityAnimated = [self animatedValueForStartValue:animatingItem.startOpacity finishValue:animatingItem.finishOpacity percentDone:percentDone];
                NSLog(@"opacity: %f", opacityAnimated);
                animatingItem.view.alpha = opacityAnimated;
            }
            if (!isnan(animatingItem.startScale)) {
                //should animate scale
                float scaleAnimated = [self animatedValueForStartValue:animatingItem.startScale finishValue:animatingItem.finishScale percentDone:percentDone];
                NSLog(@"scale: %f", scaleAnimated);
                scaleTransform = CGAffineTransformMakeScale(scaleAnimated, scaleAnimated);
            }
            if (animatingItem.pointsSet) {
                float animatedX = [self animatedValueForStartValue:animatingItem.startPoint.x finishValue:animatingItem.finishPoint.x percentDone:percentDone];
                float animatedY = [self animatedValueForStartValue:animatingItem.startPoint.y finishValue:animatingItem.finishPoint.y percentDone:percentDone];
                NSLog(@"animatedX: %f, animatedY: %f", animatedX, animatedY);
                translateTransform = CGAffineTransformMakeTranslation(animatedX, animatedY);
            }
            
            if (!isnan(animatingItem.startScale) && animatingItem.pointsSet) {
                animatingItem.view.transform = CGAffineTransformConcat(scaleTransform, translateTransform);
            } else if (!isnan(animatingItem.startScale) && animatingItem.pointsSet == NO) {
                animatingItem.view.transform = scaleTransform;
            } else if (isnan(animatingItem.startScale) && animatingItem.pointsSet == YES) {
                animatingItem.view.transform = translateTransform;
            }
            
        } else if (scrollView.contentOffset.y > animatingItem.finishScrollPosition && isnan(animatingItem.secondStartScrollPosition)) {
            
            CGAffineTransform scaleTransform;
            CGAffineTransform translateTransform;
            
            if (!isnan(animatingItem.startOpacity)) {
                animatingItem.view.alpha = animatingItem.finishOpacity;
            }
            if (!isnan(animatingItem.startScale)) {
                scaleTransform = CGAffineTransformMakeScale(animatingItem.finishScale, animatingItem.finishScale);
            }
            if (animatingItem.pointsSet) {
                translateTransform = CGAffineTransformMakeTranslation(animatingItem.finishPoint.x, animatingItem.finishPoint.y);
            }
            
            if (!isnan(animatingItem.startScale) && animatingItem.pointsSet) {
                animatingItem.view.transform = CGAffineTransformConcat(scaleTransform, translateTransform);
            } else if (!isnan(animatingItem.startScale) && animatingItem.pointsSet == NO) {
                animatingItem.view.transform = scaleTransform;
            } else if (isnan(animatingItem.startScale) && animatingItem.pointsSet == YES) {
                animatingItem.view.transform = translateTransform;
            }

        } else if (scrollView.contentOffset.y < animatingItem.startScrollPosition) {
            animatingItem.view.alpha = animatingItem.startOpacity;
            animatingItem.view.transform = CGAffineTransformFromString([originalTransforms objectAtIndex:i]);
        }
        
        i++;
        
        if (!isnan(animatingItem.secondStartScrollPosition) && !isnan(animatingItem.secondFinishScrollPosition)) {
            if (scrollView1.contentOffset.y > animatingItem.secondStartScrollPosition && scrollView1.contentOffset.y < animatingItem.secondFinishScrollPosition) {
                float percentDone = (scrollView.contentOffset.y - animatingItem.secondStartScrollPosition)/(animatingItem.secondFinishScrollPosition - animatingItem.secondStartScrollPosition);
                
                CGAffineTransform scaleTransform;
                CGAffineTransform translateTransform;
                
                if (!isnan(animatingItem.secondFinishOpacity)) {
                    //should animate opacity
                    float opacityAnimated = [self animatedValueForStartValue:animatingItem.finishOpacity finishValue:animatingItem.secondFinishOpacity percentDone:percentDone];
                    NSLog(@"opacity: %f", opacityAnimated);
                    animatingItem.view.alpha = opacityAnimated;
                }
                if (!isnan(animatingItem.secondFinishScale)) {
                    //should animate scale
                    float scaleAnimated = [self animatedValueForStartValue:animatingItem.finishScale finishValue:animatingItem.secondFinishScale percentDone:percentDone];
                    NSLog(@"scale: %f", scaleAnimated);
                    scaleTransform = CGAffineTransformMakeScale(scaleAnimated, scaleAnimated);
                }
                if (animatingItem.secondPointsSet) {
                    float animatedX = [self animatedValueForStartValue:animatingItem.finishPoint.x finishValue:animatingItem.secondFinishPoint.x percentDone:percentDone];
                    float animatedY = [self animatedValueForStartValue:animatingItem.finishPoint.y finishValue:animatingItem.secondFinishPoint.y percentDone:percentDone];
                    NSLog(@"animatedX: %f, animatedY: %f", animatedX, animatedY);
                    translateTransform = CGAffineTransformMakeTranslation(animatedX, animatedY);
                }
                
                if (!isnan(animatingItem.secondFinishScale) && animatingItem.secondPointsSet) {
                    animatingItem.view.transform = CGAffineTransformConcat(scaleTransform, translateTransform);
                } else if (!isnan(animatingItem.secondFinishScale) && animatingItem.secondPointsSet == NO) {
                    animatingItem.view.transform = scaleTransform;
                } else if (isnan(animatingItem.secondFinishScale) && animatingItem.secondPointsSet == YES) {
                    animatingItem.view.transform = translateTransform;
                }
                
                
            } else if (scrollView1.contentOffset.y > animatingItem.secondFinishScrollPosition) {
                CGAffineTransform scaleTransform;
                CGAffineTransform translateTransform;
                
                if (!isnan(animatingItem.secondFinishOpacity)) {
                    animatingItem.view.alpha = animatingItem.secondFinishOpacity;
                }
                if (!isnan(animatingItem.secondFinishScale)) {
                    scaleTransform = CGAffineTransformMakeScale(animatingItem.secondFinishScale, animatingItem.secondFinishScale);
                }
                if (animatingItem.secondPointsSet) {
                    translateTransform = CGAffineTransformMakeTranslation(animatingItem.secondFinishPoint.x, animatingItem.secondFinishPoint.y);
                }
                
                if (!isnan(animatingItem.secondFinishScale) && animatingItem.secondPointsSet) {
                    animatingItem.view.transform = CGAffineTransformConcat(scaleTransform, translateTransform);
                } else if (!isnan(animatingItem.secondFinishScale) && animatingItem.secondPointsSet == NO) {
                    animatingItem.view.transform = scaleTransform;
                } else if (isnan(animatingItem.secondFinishScale) && animatingItem.secondPointsSet == YES) {
                    animatingItem.view.transform = translateTransform;
                }
            } else if (scrollView1.contentOffset.y < animatingItem.secondStartScrollPosition && scrollView1.contentOffset.y > animatingItem.finishScrollPosition) {
                CGAffineTransform scaleTransform;
                CGAffineTransform translateTransform;
                
                if (!isnan(animatingItem.startOpacity)) {
                    animatingItem.view.alpha = animatingItem.finishOpacity;
                }
                if (!isnan(animatingItem.startScale)) {
                    scaleTransform = CGAffineTransformMakeScale(animatingItem.finishScale, animatingItem.finishScale);
                }
                if (animatingItem.pointsSet) {
                    translateTransform = CGAffineTransformMakeTranslation(animatingItem.finishPoint.x, animatingItem.finishPoint.y);
                }
                
                if (!isnan(animatingItem.startScale) && animatingItem.pointsSet) {
                    animatingItem.view.transform = CGAffineTransformConcat(scaleTransform, translateTransform);
                } else if (!isnan(animatingItem.startScale) && animatingItem.pointsSet == NO) {
                    animatingItem.view.transform = scaleTransform;
                } else if (isnan(animatingItem.startScale) && animatingItem.pointsSet == YES) {
                    animatingItem.view.transform = translateTransform;
                }
            }
    
        }
        if (!isnan(animatingItem.thirdStartScrollPosition) && !isnan(animatingItem.thirdFinishScrollPosition)) {
            if (scrollView1.contentOffset.y > animatingItem.thirdStartScrollPosition && scrollView1.contentOffset.y < animatingItem.thirdFinishScrollPosition) {
                float percentDone = (scrollView.contentOffset.y - animatingItem.thirdStartScrollPosition)/(animatingItem.thirdFinishScrollPosition - animatingItem.thirdStartScrollPosition);
                CGAffineTransform scaleTransform;
                CGAffineTransform translateTransform;
                
                if (!isnan(animatingItem.thirdFinishOpacity)) {
                    //should animate opacity
                    float opacityAnimated = [self animatedValueForStartValue:animatingItem.secondFinishOpacity finishValue:animatingItem.thirdFinishOpacity percentDone:percentDone];
                    NSLog(@"opacity: %f", opacityAnimated);
                    animatingItem.view.alpha = opacityAnimated;
                }
                if (!isnan(animatingItem.thirdFinishScale)) {
                    //should animate scale
                    float scaleAnimated = [self animatedValueForStartValue:animatingItem.secondFinishScale finishValue:animatingItem.thirdFinishScale percentDone:percentDone];
                    NSLog(@"scale: %f", scaleAnimated);
                    scaleTransform = CGAffineTransformMakeScale(scaleAnimated, scaleAnimated);
                }
                if (animatingItem.thirdPointsSet) {
                    NSLog(@"finish point: (%f, %f), secondfinishpoint: (%f, %f)", animatingItem.thirdFinishPoint.x, animatingItem.thirdFinishPoint.y, animatingItem.secondFinishPoint.x, animatingItem.secondFinishPoint.y);
                    NSLog(@"percent done: %f", percentDone);
                    float animatedX = [self animatedValueForStartValue:animatingItem.secondFinishPoint.x finishValue:animatingItem.thirdFinishPoint.x percentDone:percentDone];
                    float animatedY = [self animatedValueForStartValue:animatingItem.secondFinishPoint.y finishValue:animatingItem.thirdFinishPoint.y percentDone:percentDone];
                    NSLog(@"animatedX: %f, animatedY: %f", animatedX, animatedY);
                    translateTransform = CGAffineTransformMakeTranslation(animatedX, animatedY);
                }
                
                if (!isnan(animatingItem.thirdFinishScale) && animatingItem.thirdPointsSet) {
                    animatingItem.view.transform = CGAffineTransformConcat(scaleTransform, translateTransform);
                } else if (!isnan(animatingItem.thirdFinishScale) && animatingItem.thirdPointsSet == NO) {
                    animatingItem.view.transform = scaleTransform;
                } else if (isnan(animatingItem.thirdFinishScale) && animatingItem.thirdPointsSet == YES) {
                    animatingItem.view.transform = translateTransform;
                }
                
                
            } else if (scrollView1.contentOffset.y > animatingItem.thirdFinishScrollPosition) {
                CGAffineTransform scaleTransform;
                CGAffineTransform translateTransform;
                
                if (!isnan(animatingItem.thirdFinishOpacity)) {
                    animatingItem.view.alpha = animatingItem.thirdFinishOpacity;
                }
                if (!isnan(animatingItem.thirdFinishScale)) {
                    scaleTransform = CGAffineTransformMakeScale(animatingItem.thirdFinishScale, animatingItem.thirdFinishScale);
                }
                if (animatingItem.thirdPointsSet) {
                    translateTransform = CGAffineTransformMakeTranslation(animatingItem.thirdFinishPoint.x, animatingItem.thirdFinishPoint.y);
                }
                
                if (!isnan(animatingItem.thirdFinishScale) && animatingItem.thirdPointsSet) {
                    animatingItem.view.transform = CGAffineTransformConcat(scaleTransform, translateTransform);
                } else if (!isnan(animatingItem.thirdFinishScale) && animatingItem.thirdPointsSet == NO) {
                    animatingItem.view.transform = scaleTransform;
                } else if (isnan(animatingItem.thirdFinishScale) && animatingItem.thirdPointsSet == YES) {
                    animatingItem.view.transform = translateTransform;
                }
            } else if (scrollView1.contentOffset.y < animatingItem.thirdStartScrollPosition && scrollView1.contentOffset.y > animatingItem.secondFinishScrollPosition) {
                CGAffineTransform scaleTransform;
                CGAffineTransform translateTransform;
                
                if (!isnan(animatingItem.secondFinishOpacity)) {
                    animatingItem.view.alpha = animatingItem.secondFinishOpacity;
                }
                if (!isnan(animatingItem.secondFinishScale)) {
                    scaleTransform = CGAffineTransformMakeScale(animatingItem.secondFinishScale, animatingItem.secondFinishScale);
                }
                if (animatingItem.secondPointsSet) {
                    translateTransform = CGAffineTransformMakeTranslation(animatingItem.secondFinishPoint.x, animatingItem.secondFinishPoint.y);
                }
                
                if (!isnan(animatingItem.secondFinishScale) && animatingItem.secondPointsSet) {
                    animatingItem.view.transform = CGAffineTransformConcat(scaleTransform, translateTransform);
                } else if (!isnan(animatingItem.secondFinishScale) && animatingItem.secondPointsSet == NO) {
                    animatingItem.view.transform = scaleTransform;
                } else if (isnan(animatingItem.secondFinishScale) && animatingItem.secondPointsSet == YES) {
                    animatingItem.view.transform = translateTransform;
                }
            }
            
        }

    }

}

- (float)animatedValueForStartValue:(float)start finishValue:(float)finish percentDone:(float)percent {
    CGFloat result;
    if (start < finish) {
        result = (finish - start) * percent + start;
    } else if (start > finish) {
        result = start - ((start - finish) * percent);
    } else {
        result = start;
    }
    return result;
}

#pragma mark - UIViewControllerMethods

- (id)initWithFrame:(CGRect)frame scrollViewContentSize:(CGSize)contentSize {
    self = [super init];
    
    self.view.frame = frame;
    
    [self initializations];
    
    scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    scrollView.delegate = self;
    scrollView.contentSize = contentSize;
    [self.view addSubview:scrollView];
    
    return self;
}

- (void)initializations {
    indexesAnimating = [NSMutableArray array];
    originalTransforms = [NSMutableArray array];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
