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
        
        //PersonalInfo section cells
        
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
        
        //determine to return patients gender
        if ([self.patient.gender.coding count] != 0)
        {
            [childViewController.personalCellsLabels addObject:@"Gender:"];
            [childViewController.personalCellsContents addObject:[AllPatientItemReturnMethods returnPatientsGender:self.patient]];
        }
    
        //determine to return patient maritalStatus
        if ([self.patient.maritalStatus.coding count] != 0)
        {
            [childViewController.personalCellsLabels addObject:@"Marital Status:"];
            [childViewController.personalCellsContents addObject:[AllPatientItemReturnMethods returnPatientsMaritalStatus:self.patient]];
        }
    
        //determine to return deceased
        if ([self.patient.deceasedX class] != [NSNull class] && [self.patient.deceasedX count] != 0)
        {
            [childViewController.personalCellsLabels addObject:@"Deceased:"];
            [childViewController.personalCellsContents addObject:[AllPatientItemReturnMethods returnPatientsDeceasedStatus:self.patient]];
        }
    
        //determine to return language
        if ([self.patient.communication count] != 0)
        {
            [childViewController.personalCellsLabels addObject:@"Language:"];
            [childViewController.personalCellsContents addObject:[AllPatientItemReturnMethods returnPatientsDeceasedStatus:self.patient]];
        }
        
        //Contact Info section cells
        childViewController.contactCellLabels = [[NSMutableArray alloc] init];
        childViewController.contactCellContents = [[NSMutableArray alloc] init];
        childViewController.addressContentsDict = [[NSMutableDictionary alloc] init];
        
        //determine to return address
        if ([self.patient.address count] != 0)
        {
            [childViewController.contactCellLabels addObject:@"Address"];
            childViewController.addressContentsDict = [[NSMutableDictionary alloc] initWithDictionary:[AllPatientItemReturnMethods returnPatientsAddressInfo:self.patient]];
        }
        
        //determine to return phone
        
        //determine to return fax
        
        //determine to return email
        
        //Additional Info section cells
        childViewController.addCellLabels = [[NSMutableArray alloc] init];
        childViewController.addCellContents = [[NSMutableArray alloc] init];
        
        //determine to return siblings
        if ([self.patient.multipleBirthX count] != 0)
        {
            [childViewController.addCellLabels addObject:@"Siblings:"];
            [childViewController.addCellContents addObject:[AllPatientItemReturnMethods returnPatientsMultipleBirth:self.patient]];
        }
        
        //determine to return siblings
        if ([self.patient.active class] != [NSNull class])
        {
            [childViewController.addCellLabels addObject:@"Active Status:"];
            [childViewController.addCellContents addObject:[AllPatientItemReturnMethods returnPatientsActiveStatus:self.patient]];
        }
        
        //determine to return provider
        if ([self.patient.provider.display class] != [NSNull class])
        {
            [childViewController.addCellLabels addObject:@"Provider:"];
            [childViewController.addCellContents addObject:[AllPatientItemReturnMethods returnPatientsProvider:self.patient]];
        }
        
        //determine to return patient links
        if ([self.patient.link count] != 0)
        {
            [childViewController.addCellLabels addObject:@"Linked Patients:"];
            [childViewController.addCellContents addObject:[AllPatientItemReturnMethods returnPatientsLinkedToThisPatient:self.patient]];
        }
        
        //Contact List section cells
        childViewController.contactListCells = [[NSMutableArray alloc] init];
        
        //determine to return contact list
        if ([self.patient.contact count] != 0)
        {
            childViewController.contactListCells = [[NSMutableArray alloc] initWithArray:[AllPatientItemReturnMethods returnPatientsContactListItemsInAnArray:self.patient]];
        }
    }
}

@end
