//
//  GLPageContentViewController.m
//  Tutor Virtual
//
//  Created by Gilberto Leon Enriquez on 29/3/14.
//  Copyright (c) 2014 La Startup. All rights reserved.
//

#import "GLPageContentViewController.h"

@interface GLPageContentViewController ()
@property (weak, nonatomic) IBOutlet UILabel *materiaLabel;
@property (weak, nonatomic) IBOutlet UILabel *mondayLabel;
@property (weak, nonatomic) IBOutlet UILabel *tuesdayLabel;
@property (weak, nonatomic) IBOutlet UILabel *wednesdayLabel;
@property (weak, nonatomic) IBOutlet UILabel *thursdayLabel;
@property (weak, nonatomic) IBOutlet UILabel *fridayLabel;

@end

@implementation GLPageContentViewController

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
    self.materiaLabel.text = self.subject;
    self.mondayLabel.text = self.monday;
    self.tuesdayLabel.text = self.tuesday;
    self.wednesdayLabel.text = self.wednesday;
    self.thursdayLabel.text = self.thursday;
    self.fridayLabel.text = self.friday;
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

@end
