//
//  DetailsEditViewController.m
//  TestFHIRPatientApp
//
//  Created by Adam Sippel on 2013-04-23.
//  Copyright (c) 2013 Adam Sippel. All rights reserved.
//

#import "DetailsEditViewController.h"

@interface DetailsEditViewController ()

@property (weak, nonatomic) IBOutlet UITextField *genderTextField;

@end

@implementation DetailsEditViewController

- (IBAction)saveButton:(id)sender
{
    //grab new gender value
    NSString *genderTextTest = [self.genderTextField.text substringToIndex:1];
    if ([genderTextTest caseInsensitiveCompare:@"M"] == 0) self.patientDetailsToEdit.details.gender.code.value = @"M";
    else if ([genderTextTest caseInsensitiveCompare:@"F"] == 0) self.patientDetailsToEdit.details.gender.code.value = @"F";
    else self.patientDetailsToEdit.details.gender.code.value = @"?";
    
    [self.delegate editValues:self.patientDetailsToEdit];
    [[[UIAlertView alloc] initWithTitle:@"Saved" message:nil delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil] show];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.patientDetailsToEdit = [[Patient alloc] init];
    }
    return self;
}

- (void)setupDetailsView
{
    //set gender field
    self.genderTextField.text = self.patientDetailsToEdit.details.gender.code.value;
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

@end
