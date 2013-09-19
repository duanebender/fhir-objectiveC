//
//  DetailsEditViewController.m
//  TestFHIRPatientApp
//
//  Created by Adam Sippel on 2013-04-23.
//  Copyright (c) 2013 Adam Sippel. All rights reserved.
//

#import "DetailsEditViewController.h"

@interface DetailsEditViewController () <NameTableDelegate>

@property (weak, nonatomic) IBOutlet UITextField *genderTextField;
@property (weak, nonatomic) IBOutlet UISwitch *deceasedSwitch;
@property (weak, nonatomic) IBOutlet UITextField *givenTextField;

@end

@implementation DetailsEditViewController

- (void)updateNames:(FHIRPatient *)patientNames
{
    self.patientDetailsToEdit = patientNames;
}

- (IBAction)saveButton:(id)sender
{
    //grab new gender value
    /*
    NSString *genderTextTest = [self.genderTextField.text substringToIndex:1];
    if ([genderTextTest caseInsensitiveCompare:@"M"] == 0) self.patientDetailsToEdit.details.gender.code.value = @"M";
    else if ([genderTextTest caseInsensitiveCompare:@"F"] == 0) self.patientDetailsToEdit.details.gender.code.value = @"F";
    else self.patientDetailsToEdit.details.gender.code.value = @"?";
    
    //grab deceased switch
    if ([self.deceasedSwitch isOn]) self.patientDetailsToEdit.details.deceased.value = true;
    else self.patientDetailsToEdit.details.deceased.value = false;
     */
    
    [self.delegate editValues:self.patientDetailsToEdit];
    [[[UIAlertView alloc] initWithTitle:@"Saved" message:nil delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil] show];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.patientDetailsToEdit = [[FHIRPatient alloc] init];
    }
    return self;
}

- (void)setupDetailsView
{
    //set gender field
    /*
    self.genderTextField.text = self.patientDetailsToEdit.details.gender.code.value;
    
    //set deceased switch
    if (self.patientDetailsToEdit.details.deceased.value == true) [self.deceasedSwitch setOn:YES];
    else [self.deceasedSwitch setOn:NO];
     */
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [self setupDetailsView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Segue

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"editFamilyNameSegue"])
    {
        NameListTableViewController *target = (NameListTableViewController *)segue.destinationViewController;
        target.delegate = self;
        target.patientToListNames = self.patientDetailsToEdit;
    }
}

@end
