//
//  PatientInfoViewController.h
//  TestFHIRPatientApp
//
//  Created by Adam Sippel on 2013-07-17.
//  Copyright (c) 2013 Adam Sippel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FHIR.h"

@interface PatientInfoViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *patientImageView;
@property (strong, nonatomic) UIImage *defaultImage;

@property (nonatomic, strong) FHIRPatient *patient;
@property (nonatomic, strong) NSMutableDictionary *personalInfo;
@property (nonatomic, strong) NSMutableDictionary *contactInfo;
@property (nonatomic, strong) NSMutableDictionary *additionalInfo;
@property (nonatomic, strong) NSMutableDictionary *contactList;
@property (nonatomic, strong) NSMutableDictionary *animalInfo;


@end
