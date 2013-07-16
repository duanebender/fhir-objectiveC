//
//  PatientViewController.h
//  TestFHIRPatientApp
//
//  Created by Adam Sippel on 2013-04-16.
//  Copyright (c) 2013 Adam Sippel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FHIR.h"
#import "PatientEditViewController.h"

@interface PatientViewController : UIViewController <ViewControllerEditDelegate>

@property (nonatomic, retain) FHIRPatient *patient;

@end
