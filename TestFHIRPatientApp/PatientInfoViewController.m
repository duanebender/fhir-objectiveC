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
#import "AddEditPatientViewController.h"

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
        
        //sections to determine
        childViewController.sectionsTitleArray = [AllPatientItemReturnMethods generateSectionsArrayForPatientListing:self.patient];
        
        //PersonalInfo section cells
        childViewController.personalCellsLabels = [[NSMutableArray alloc] init];
        childViewController.personalCellsContents = [[NSMutableArray alloc] init];
        
        //Determine if to display name
        if (![[AllPatientItemReturnMethods returnPatientsName:self.patient] isEqualToString:@""])
        {
            [childViewController.personalCellsLabels addObject:@"Name:"];
            [childViewController.personalCellsContents addObject:[AllPatientItemReturnMethods returnPatientsName:self.patient]];
        }
        
        //Determine to return date of birth
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
        childViewController.addressContentsString = [[NSMutableString alloc] init];
        
        //determine to return address
        if ([self.patient.address count] != 0)
        {
            [childViewController.contactCellLabels addObject:@"Address:"];
            childViewController.addressContentsString = [AllPatientItemReturnMethods returnPatientsAddressInfo:self.patient];
            [childViewController.contactCellContents addObject:@""];
        }
        
        //determine to return phone, fax, or email
        if ([self.patient.telecom count] != 0)
        {
            NSDictionary *telecomDict = [[NSDictionary alloc] initWithDictionary:[AllPatientItemReturnMethods returnPatientsTelecom:self.patient]];
            NSLog(@"telecomDict:%@",telecomDict);
            for (NSString *key in telecomDict)
            {
                if ([key isEqualToString:@"Phone:"])
                {
                    NSDictionary *checking = [telecomDict objectForKey:@"Phone:"];
                    
                    if (![[checking objectForKey:@"cellPhoneText"] isEqualToString:@"N/A"] || ![[checking objectForKey:@"phoneHomeText"] isEqualToString:@"N/A"] || ![[checking objectForKey:@"phoneWorkText"] isEqualToString:@"N/A"])
                    {
                        [childViewController.contactCellLabels addObject:@"Phone:"];
                        childViewController.phoneContentsDict = [[NSMutableDictionary alloc] initWithDictionary:[telecomDict objectForKey:@"Phone:"]];
                        [childViewController.contactCellContents addObject:@""];
                    }
                }
                else
                {
                    if (![[telecomDict objectForKey:key] isEqualToString:@"N/A"])
                    {
                        [childViewController.contactCellLabels addObject:key];
                        [childViewController.contactCellContents addObject:[telecomDict objectForKey:key]];
                    }
                }
            }
            NSLog(@"tele:%@",childViewController.contactCellLabels);
        }
            
        //Additional Info section cells
        childViewController.addCellLabels = [[NSMutableArray alloc] init];
        childViewController.addCellContents = [[NSMutableArray alloc] init];
        
        //determine to return siblings
        if ([self.patient.multipleBirthX count] != 0)
        {
            [childViewController.addCellLabels addObject:@"Siblings:"];
            [childViewController.addCellContents addObject:[AllPatientItemReturnMethods returnPatientsMultipleBirth:self.patient]];
        }
        
        //determine to return active status
        if ([self.patient.active class] != [NSNull class])
        {
            [childViewController.addCellLabels addObject:@"Active Status:"];
            [childViewController.addCellContents addObject:[AllPatientItemReturnMethods returnPatientsActiveStatus:self.patient]];
        }
        
        //determine to return provider
#warning -fix this
        /*
        if ([self.patient.provider.display class] != [NSNull class])
        {
            [childViewController.addCellLabels addObject:@"Provider:"];
            [childViewController.addCellContents addObject:[AllPatientItemReturnMethods returnPatientsProvider:self.patient]];
        }
         */
        
        //determine to return patient links
        if ([self.patient.link count] != 0)
        {
            [childViewController.addCellLabels addObject:@"Linked Patients:"];
            [childViewController.addCellContents addObject:[AllPatientItemReturnMethods returnPatientsLinkedToThisPatient:self.patient]];
        }
        //end additional info cells
        
        //animal info cells
        childViewController.animalCellLabels = [[NSMutableArray alloc] init];
        childViewController.animalCellContents = [[NSMutableArray alloc] init];
        
        //determine to return species
        if ([self.patient.animal.species.coding count] != 0)
        {
            [childViewController.animalCellLabels addObject:@"Species:"];
            [childViewController.animalCellContents addObject:[AllPatientItemReturnMethods returnPatientAnimalSpecies:self.patient]];
        }
        
        //determine to return breed
        if ([self.patient.animal.breed.coding count] != 0)
        {
            [childViewController.animalCellLabels addObject:@"Breed:"];
            [childViewController.animalCellContents addObject:[AllPatientItemReturnMethods returnPatientAnimalBreed:self.patient]];
        }
        
        //determine to return gender status
        if ([self.patient.animal.genderStatus.coding count] != 0)
        {
            [childViewController.animalCellLabels addObject:@"Gender Status:"];
            [childViewController.animalCellContents addObject:[AllPatientItemReturnMethods returnPatientAnimalGenderStatus:self.patient]];
        }
        //end animal info section cells
        
        //Contact List section cells
        childViewController.contactListCells = [[NSMutableArray alloc] init];
        
        //determine to return contact list
        if ([self.patient.contact count] != 0)
        {
            childViewController.contactListCells = [[NSMutableArray alloc] initWithArray:[AllPatientItemReturnMethods returnPatientsContactListItemsInAnArray:self.patient]];
        }
    }
    //end container view segue
    
    //edit view button segue
    if ([segueName isEqualToString: @"editPatientViewSegue"])
    {
        AddEditPatientViewController *editChildViewController = (AddEditPatientViewController *) [segue destinationViewController];
        
        editChildViewController.title = @"Edit Patient";
        
        //PersonalInfo section cells
        editChildViewController.personalInfoContents = [[NSMutableDictionary alloc] init];
        
        //Determine if to display name
        if (![[AllPatientItemReturnMethods returnPatientsName:self.patient] isEqualToString:@""])
        {
            [editChildViewController.personalInfoContents setObject:[AllPatientItemReturnMethods returnPatientsName:self.patient] forKey:@"Name:"];
        }
        
        //Determine if to display date of birth
        if (![[AllPatientItemReturnMethods returnPatientsDOB:self.patient] isEqualToString:@"N/A"])
        {
            [editChildViewController.personalInfoContents setObject:[AllPatientItemReturnMethods returnPatientsDOB:self.patient] forKey:@"Date of Birth:"];
        }
        
        //determine to return patients gender
        if ([self.patient.gender.coding count] != 0)
        {
            [editChildViewController.personalInfoContents setObject:[AllPatientItemReturnMethods returnPatientsGender:self.patient] forKey:@"Gender:"];
        }
        
        //determine to return patient maritalStatus
        if ([self.patient.maritalStatus.coding count] != 0)
        {
            [editChildViewController.personalInfoContents setObject:[AllPatientItemReturnMethods returnPatientsMaritalStatus:self.patient] forKey:@"Marital Status:"];
        }
        
        //determine to return deceased
        if ([self.patient.deceasedX class] != [NSNull class] && [self.patient.deceasedX count] != 0)
        {
            [editChildViewController.personalInfoContents setObject:[AllPatientItemReturnMethods returnPatientsDeceasedStatus:self.patient] forKey:@"Deceased:"];
        }
        
        //determine to return language
        if ([self.patient.communication count] != 0)
        {
            [editChildViewController.personalInfoContents setObject:[AllPatientItemReturnMethods returnPatientsLanguage:self.patient] forKey:@"Language:"];
        }
        //end personal info cells
        
        //Contact Info section cells
        editChildViewController.contactInfoContents = [[NSMutableDictionary alloc] init];
        
        //determine to return address
        if ([self.patient.address count] != 0)
        {
            [editChildViewController.contactInfoContents setObject:[AllPatientItemReturnMethods returnPatientsAddressInfo:self.patient] forKey:@"Address:"];
        }
        
        //determine to return phone, fax, or email
        if ([self.patient.telecom count] != 0)
        {
            NSDictionary *telecomDict = [[NSDictionary alloc] initWithDictionary:[AllPatientItemReturnMethods returnPatientsTelecom:self.patient]];
            for (NSString *key in telecomDict)
            {
                if ([telecomDict objectForKey:@"phone"])
                {
                    [editChildViewController.contactInfoContents setObject:[telecomDict objectForKey:@"phone"] forKey:@"Phone:"];
                }
                else
                {
                    [editChildViewController.contactInfoContents setObject:[telecomDict objectForKey:key] forKey:key];
                }
            }
        }
        //end contact into cells
        
        //Additional Info section cells
        editChildViewController.addInfoContents = [[NSMutableDictionary alloc] init];
        
        //determine to return siblings
        if ([self.patient.multipleBirthX count] != 0)
        {
            [editChildViewController.addInfoContents setObject:[AllPatientItemReturnMethods returnPatientsMultipleBirth:self.patient] forKey:@"Siblings:"];
        }
        
        //determine to return active status
        if ([self.patient.active class] != [NSNull class])
        {
            [editChildViewController.addInfoContents setObject:[AllPatientItemReturnMethods returnPatientsActiveStatus:self.patient] forKey:@"Active Status:"];
        }
        
#warning - fix this
        /*
        //determine to return provider
        if ([self.patient.provider.display class] != [NSNull class])
        {
            [editChildViewController.addInfoContents setObject:[AllPatientItemReturnMethods returnPatientsProvider:self.patient] forKey:@"Provider:"];
        }
         */
        
        //determine to return patient links
        if ([self.patient.link count] != 0)
        {
            [editChildViewController.addInfoContents setObject:[AllPatientItemReturnMethods returnPatientsLinkedToThisPatient:self.patient] forKey:@"Linked Patients:"];
        }
        //end additional info cells section
        
        //animal info cells
        editChildViewController.animalInfoContents = [[NSMutableDictionary alloc] init];
        
        //determine to return species
        if ([self.patient.animal.species.coding count] != 0)
        {
            [editChildViewController.animalInfoContents setObject:[AllPatientItemReturnMethods returnPatientAnimalSpecies:self.patient] forKey:@"Species:"];
        }
        
        //determine to return breed
        if ([self.patient.animal.breed.coding count] != 0)
        {
            [editChildViewController.animalInfoContents setObject:[AllPatientItemReturnMethods returnPatientAnimalBreed:self.patient] forKey:@"Breed:"];
        }
        
        //determine to return gender status
        if ([self.patient.animal.genderStatus.coding count] != 0)
        {
            [editChildViewController.animalInfoContents setObject:[AllPatientItemReturnMethods returnPatientAnimalGenderStatus:self.patient] forKey:@"Gender Status:"];
        }
        //end animal info section cells
        
        //return default image to be displayed in editing
        editChildViewController.imageOfPatient = [[UIImage alloc] init];
        editChildViewController.imageOfPatient = [AllPatientItemReturnMethods returnPatientDefaultImage:self.patient];
        NSLog(@"%@",[AllPatientItemReturnMethods returnPatientDefaultImage:self.patient]);
        
    }
    //end edit button segue
}

@end
