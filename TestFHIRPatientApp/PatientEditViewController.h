//
//  PatientEditViewController.h
//  TestFHIRPatientApp
//
//  Created by Adam Sippel on 2013-04-22.
//  Copyright (c) 2013 Adam Sippel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FHIR.h"
#import "DetailsEditViewController.h"

@class PatientEditViewController;

@protocol ViewControllerEditDelegate <NSObject>

- (void)editPatientValues:(Patient *)patientToEdit;

@end

@interface PatientEditViewController : UIViewController <ViewControllerSubEditDelegate>

@property (nonatomic, weak) id<ViewControllerEditDelegate> delegate;
@property (nonatomic, weak) Patient *patientToEdit;

@end
