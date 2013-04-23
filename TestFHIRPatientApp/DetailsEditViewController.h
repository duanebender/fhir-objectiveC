//
//  DetailsEditViewController.h
//  TestFHIRPatientApp
//
//  Created by Adam Sippel on 2013-04-23.
//  Copyright (c) 2013 Adam Sippel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FHIR.h"

@class DetailsEditViewController;

@protocol ViewControllerSubEditDelegate <NSObject>

- (void)editValues:(Patient *)patientToEdit;

@end

@interface DetailsEditViewController : UIViewController

@property (nonatomic, weak) id<ViewControllerSubEditDelegate> delegate;
@property (nonatomic, weak) Patient *patientDetailsToEdit;

@end
