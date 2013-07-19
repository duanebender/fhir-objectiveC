//
//  PatientInfoViewController.m
//  TestFHIRPatientApp
//
//  Created by Adam Sippel on 2013-07-17.
//  Copyright (c) 2013 Adam Sippel. All rights reserved.
//

#import "PatientInfoViewController.h"
#import "FHIRAttachment.h"

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
    self.defaultImage = [[UIImage alloc] initWithContentsOfFile:@"/images/defaultImage.gif"];
    self.personalInfo = [[NSMutableDictionary alloc] init];
    self.contactInfo = [[NSMutableDictionary alloc] init];
    self.additionalInfo = [[NSMutableDictionary alloc] init];
    self.contactList = [[NSMutableDictionary alloc] init];
    self.animalInfo = [[NSMutableDictionary alloc] init];
    [self loadImageViewForPatient];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)loadImageViewForPatient
{
    BOOL isDone = false;
    NSArray *patientImage = self.patient.photo;
    
    for (int i = 0; i < [patientImage count]; i++)
    {
        FHIRAttachment *attachmentToCheck = [patientImage objectAtIndex:i];
        if (attachmentToCheck.hash)
        {
            UIImage *patientProfileImage = [[UIImage alloc] initWithData:attachmentToCheck.hash.data];
            self.patientImageView.image = patientProfileImage;
            isDone = true;
        }
        
        if (isDone) break;
    }
    
    if (self.patientImageView.image == nil)
    {
        self.patientImageView.image = self.defaultImage;
    }
}

@end
