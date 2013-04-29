//
//  NameListTableViewController.h
//  TestFHIRPatientApp
//
//  Created by Adam Sippel on 2013-04-24.
//  Copyright (c) 2013 Adam Sippel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FHIR.h"

@class NameListTableViewController;

@protocol NameTableDelegate <NSObject>

- (void)updateNames:(Patient *)patientNames;

@end

@interface NameListTableViewController : UITableViewController

@property (nonatomic, weak) id<NameTableDelegate> delegate;
@property (nonatomic, weak) Patient *patientToListNames;

@end
