//
//  GLPageContentRootViewController.m
//  Tutor Virtual
//
//  Created by Gilberto Leon Enriquez on 29/3/14.
//  Copyright (c) 2014 La Startup. All rights reserved.
//

#import "GLPageContentRootViewController.h"
#import "GLPageContentViewController.h"

@interface GLPageContentRootViewController ()

@end

@implementation GLPageContentRootViewController

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
    _subjects = @[@{@"nombre": @"Algebra I", @"lunes": @"1:00-2:00", @"martes": @"2:00-3:00", @"miercoles": @"4:00-5:00", @"jueves": @"6:00-7:00", @"viernes": @"8:00-9:00"},
                  @{@"nombre": @"Algebra II", @"lunes": @"1:00-2:00", @"martes": @"2:00-3:00", @"miercoles": @"4:00-5:00", @"jueves": @"6:00-7:00", @"viernes": @"8:00-9:00"},
                  @{@"nombre": @"Algebra III", @"lunes": @"1:00-2:00", @"martes": @"2:00-3:00", @"miercoles": @"4:00-5:00", @"jueves": @"6:00-7:00", @"viernes": @"8:00-9:00"}];
    
    // Create page view controller
    self.pageViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"PageViewController"];
    self.pageViewController.dataSource = self;
    
    GLPageContentViewController *startingViewController = [self viewControllerAtIndex:0];
    NSArray *viewControllers = @[startingViewController];
    [self.pageViewController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
    
    // Change the size of page view controller
    self.pageViewController.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - 30);
    
    [self addChildViewController:_pageViewController];
    [self.view addSubview:_pageViewController.view];
    [self.pageViewController didMoveToParentViewController:self];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (GLPageContentViewController *)viewControllerAtIndex:(NSUInteger)index
{
    if (([self.subjects count] == 0) || (index >= [self.subjects count])) {
        return nil;
    }
    
    // Create a new view controller and pass suitable data.
    GLPageContentViewController *pageContentViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"PageContentViewController"];
    pageContentViewController.pageIndex = index;
    pageContentViewController.subject = self.subjects[index][@"nombre"];
    pageContentViewController.monday = self.subjects[index][@"lunes"];
    pageContentViewController.tuesday = self.subjects[index][@"martes"];
    pageContentViewController.wednesday = self.subjects[index][@"miercoles"];
    pageContentViewController.thursday = self.subjects[index][@"jueves"];
    pageContentViewController.friday = self.subjects[index][@"viernes"];
    
    return pageContentViewController;
}

#pragma mark - Page View Controller Data Source

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    NSUInteger index = ((GLPageContentViewController*) viewController).pageIndex;
    
    if ((index == 0) || (index == NSNotFound)) {
        return nil;
    }
    
    index--;
    return [self viewControllerAtIndex:index];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    NSUInteger index = ((GLPageContentViewController*) viewController).pageIndex;
    
    if (index == NSNotFound) {
        return nil;
    }
    
    index++;
    if (index == [self.subjects count]) {
        return nil;
    }
    return [self viewControllerAtIndex:index];
}

- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController
{
    return [self.subjects count];
}

- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController
{
    return 0;
}


@end
