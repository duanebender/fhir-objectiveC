//
//  PatientInfoViewController.m
//  TestFHIRPatientApp
//
//  Created by Adam Sippel on 2013-07-17.
//  Copyright (c) 2013 Adam Sippel. All rights reserved.
//

#import "PatientInfoViewController.h"
#import "FHIRAttachment.h"
#import "AllPatientItemReturnMethods.h"
#import "PatientInfoViewTableViewController.h"

@interface PatientInfoViewController ()

@end

@implementation PatientInfoViewController

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
    self.patientImageView.image = [AllPatientItemReturnMethods returnPatientDefaultImage:self.patient];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - segue methods

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSString * segueName = segue.identifier;
    if ([segueName isEqualToString: @"containerViewSegue"])
    {
        PatientInfoViewTableViewController * childViewController = (PatientInfoViewTableViewController *) [segue destinationViewController];
        
        //initialize objects that need it
        childViewController.personalCellsLabels = [[NSMutableArray alloc] init];
        childViewController.personalCellsContents = [[NSMutableArray alloc] init];
        
        //sections to determine
        childViewController.sectionsTitleArray = [AllPatientItemReturnMethods generateSectionsArrayForPatientListing:self.patient];
        
        //Determine if to display name
        if (![[AllPatientItemReturnMethods returnPatientsName:self.patient] isEqualToString:@""])
        {
            [childViewController.personalCellsLabels addObject:@"Name:"];
            [childViewController.personalCellsContents addObject:[AllPatientItemReturnMethods returnPatientsName:self.patient]];
        }
        
        if (![[AllPatientItemReturnMethods returnPatientsDOB:self.patient] isEqualToString:@"N/A"])
        {
            [childViewController.personalCellsLabels addObject:@"Date of Birth:"];
            [childViewController.personalCellsContents addObject:[AllPatientItemReturnMethods returnPatientsDOB:self.patient]];
        }
        
    }
}

@end
