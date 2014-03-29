//
//  GLPageContentRootViewController.h
//  Tutor Virtual
//
//  Created by Gilberto Leon Enriquez on 29/3/14.
//  Copyright (c) 2014 La Startup. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GLPageContentRootViewController : UIViewController <UIPageViewControllerDataSource>
@property (strong, nonatomic) UIPageViewController *pageViewController;
@property (strong, nonatomic) NSArray *subjects;
@end
