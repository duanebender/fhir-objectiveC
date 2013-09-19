//
//  PatientLoaderTableViewController.h
//  TestFHIRPatientApp
//
//  Created by Adam Sippel on 2013-04-16.
//  Copyright (c) 2013 Adam Sippel. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PatientLoaderTableViewController : UITableViewController <UISearchBarDelegate>

@property (nonatomic, retain) NSMutableArray *patientArray;
@property (retain, nonatomic) IBOutlet UISearchBar *patientSearchBar;

@end
