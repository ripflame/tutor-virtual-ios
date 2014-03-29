//
//  GLLoginViewController.m
//  Tutor Virtual
//
//  Created by Gilberto Leon Enriquez on 29/3/14.
//  Copyright (c) 2014 La Startup. All rights reserved.
//

#import "GLLoginViewController.h"
#import "GLAPIConsumer.h"

@interface GLLoginViewController ()
@property (weak, nonatomic) IBOutlet UITextField *matriculaField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;

- (IBAction)enterButtonTouched:(UIButton *)sender;
@end

@implementation GLLoginViewController

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
    [self.navigationItem setTitle:@"Login"];
    
    NSNotificationCenter *notificationCenter = [NSNotificationCenter defaultCenter];
    [notificationCenter addObserver:self selector:@selector(loginSuccess:) name:@"LoginSuccess" object:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)loginSuccess:(NSNotification *)notification {
    [self performSegueWithIdentifier:@"subjectsViewSegue" sender:self];
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

- (IBAction)enterButtonTouched:(UIButton *)sender {
    
    GLAPIConsumer *consumer = [GLAPIConsumer sharedInstance];
    
    [consumer authenticateWithMatricula:self.matriculaField.text andPassword:self.passwordField.text];
}
@end
