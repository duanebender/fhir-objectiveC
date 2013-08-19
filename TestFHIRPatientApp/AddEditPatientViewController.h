//
//  AddEditPatientViewController.h
//  TestFHIRPatientApp
//
//  Created by Adam Sippel on 2013-07-17.
//  Copyright (c) 2013 Adam Sippel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AddEditPatientTableViewController.h"
#import "FHIR.h"

@interface AddEditPatientViewController : UIViewController <passValuesBack>

@property (weak, nonatomic) IBOutlet UIImageView *editPatientImage;
@property (weak, nonatomic) IBOutlet UIPickerView *optionsToPickPickerView;
@property (strong, nonatomic) IBOutlet AddEditPatientTableViewController *containerForPatientData;

@property (strong, nonatomic) FHIRPatient *patient;
@property (strong, nonatomic) NSMutableDictionary *personalInfoContents;
@property (strong, nonatomic) NSMutableDictionary *contactInfoContents;
@property (strong, nonatomic) NSMutableDictionary *addInfoContents;
@property (strong, nonatomic) NSMutableDictionary *animalInfoContents;
@property (strong, nonatomic) NSMutableArray *contactListCells;
@property (strong, nonatomic) UIImage *imageOfPatient;

@property (strong, nonatomic) NSDictionary *dictionaryOfUpdatedPatient;

@end
