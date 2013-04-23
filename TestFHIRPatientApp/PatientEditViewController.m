//
//  PatientEditViewController.m
//  TestFHIRPatientApp
//
//  Created by Adam Sippel on 2013-04-22.
//  Copyright (c) 2013 Adam Sippel. All rights reserved.
//

#import "PatientEditViewController.h"
#import "PatientViewController.h"

@interface PatientEditViewController ()

@property (weak, nonatomic) IBOutlet UISwitch *activeSwitch;
@property (nonatomic) BOOL activeState;

@end

@implementation PatientEditViewController

- (IBAction)saveButton:(id)sender
{
    if (self.activeSwitch) self.activeState = true;
    else self.activeState = false;
    
    [self editCurrentPatientValues];
    [[[UIAlertView alloc] initWithTitle:@"Saved" message:nil delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil] show];
}

- (void)editCurrentPatientValues
{
    NSArray *views = self.navigationController.viewControllers;
    PatientViewController *target = [views objectAtIndex:([views count] -1)];
    target.patient.active.value = self.activeState;
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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
