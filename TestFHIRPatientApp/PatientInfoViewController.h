//
//  PatientInfoViewController.h
//  TestFHIRPatientApp
//
//  Created by Adam Sippel on 2013-07-17.
//  Copyright (c) 2013 Adam Sippel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FHIR.h"
#import "HistorySelectorTableViewController.h"

@interface PatientInfoViewController : UIViewController <passSelectedIDBack>

@property (weak, nonatomic) IBOutlet UIImageView *patientImageView;

@property (nonatomic, strong) FHIRPatient *patient;
@property (nonatomic, strong) NSString *currentServer;
@property (nonatomic, strong) NSString *currentPatientID;
@property (nonatomic, strong) NSArray *currentHistoryArray;

@property (nonatomic, weak) UIPopoverController *historyPopover;

@end
