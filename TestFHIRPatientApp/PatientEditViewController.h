//
//  PatientEditViewController.h
//  TestFHIRPatientApp
//
//  Created by Adam Sippel on 2013-04-22.
//  Copyright (c) 2013 Adam Sippel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FHIR.h"

@class PatientEditViewController;

@protocol ViewControllerEditDelegate <NSObject>

- (void)editPatientValues:(Patient *)patientToEdit;

@end

@interface PatientEditViewController : UIViewController

@property (nonatomic, weak) id<ViewControllerEditDelegate> delegate;

@end
