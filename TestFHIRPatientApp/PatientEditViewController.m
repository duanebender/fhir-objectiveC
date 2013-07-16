//
//  PatientEditViewController.m
//  TestFHIRPatientApp
//
//  Created by Adam Sippel on 2013-04-22.
//  Copyright (c) 2013 Adam Sippel. All rights reserved.
//

#import "PatientEditViewController.h"
#import "PatientViewController.h"
#import "DetailsEditViewController.h"

@interface PatientEditViewController () <ViewControllerSubEditDelegate>

@property (weak, nonatomic) IBOutlet UISwitch *activeSwitch;

@end

@implementation PatientEditViewController

- (void)editValues:(FHIRPatient *)patientToEdit
{
    self.patientToEdit = [[FHIRPatient alloc] init];
    self.patientToEdit = patientToEdit;
    [self.delegate editPatientValues:self.patientToEdit];
}

- (IBAction)saveButton:(id)sender
{
    //grab new active value
    if ([self.activeSwitch isOn]) self.patientToEdit.active.value = true;
    else self.patientToEdit.active.value = false;
    
    [self.delegate editPatientValues:self.patientToEdit];
    [[[UIAlertView alloc] initWithTitle:@"Saved" message:nil delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil] show];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.patientToEdit = [[FHIRPatient alloc] init];
    }
    return self;
}

//patient initilizer method
- (void)setupPatientView
{
    //set switch active
    if (self.patientToEdit.active.value == true) [self.activeSwitch setOn:YES];
    else [self.activeSwitch setOn:NO];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [self setupPatientView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Segue

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"detailsSegue"])
    {
        DetailsEditViewController *target = (DetailsEditViewController *)segue.destinationViewController;
        target.delegate = self;
        target.patientDetailsToEdit = self.patientToEdit;
    }
}

@end
