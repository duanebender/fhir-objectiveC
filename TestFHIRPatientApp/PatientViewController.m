//
//  PatientViewController.m
//  TestFHIRPatientApp
//
//  Created by Adam Sippel on 2013-04-16.
//  Copyright (c) 2013 Adam Sippel. All rights reserved.
//

#import "PatientViewController.h"
#import "PatientViewWriter.h"

@interface PatientViewController () <ViewControllerEditDelegate>

@property (weak, nonatomic) IBOutlet UILabel *patientLabel;

@end

@implementation PatientViewController

- (void)editPatientValues:(FHIRPatient *)patientToEdit
{
    self.patient = [[FHIRPatient alloc] init];
    self.patient = patientToEdit;
    [self initPatientLabel];
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)initPatientLabel
{
    self.patientLabel.text = [PatientViewWriter writePatientAsStringForView:[[[self.patient generateAndReturnResourceDictionary] dataForResource] mutableCopy]];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [self initPatientLabel];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Segue

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"editPatientSegue"])
    {
        PatientEditViewController *target = (PatientEditViewController *)segue.destinationViewController;
        target.delegate = self;
        target.patientToEdit = self.patient;
    }
}

@end
