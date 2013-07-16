//
//  DetailsEditViewController.h
//  TestFHIRPatientApp
//
//  Created by Adam Sippel on 2013-04-23.
//  Copyright (c) 2013 Adam Sippel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FHIR.h"
#import "NameListTableViewController.h"

@class DetailsEditViewController;

@protocol ViewControllerSubEditDelegate <NSObject>

- (void)editValues:(FHIRPatient *)patientToEdit;

@end

@interface DetailsEditViewController : UIViewController <NameTableDelegate>

@property (nonatomic, weak) id<ViewControllerSubEditDelegate> delegate;
@property (nonatomic, weak) FHIRPatient *patientDetailsToEdit;

@end
