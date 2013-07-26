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

@property (nonatomic, strong) FHIRPatient *patient;

@end
