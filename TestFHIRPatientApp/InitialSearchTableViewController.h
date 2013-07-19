//
//  InitialSearchTableViewController.h
//  TestFHIRPatientApp
//
//  Created by Adam Sippel on 2013-07-15.
//  Copyright (c) 2013 Adam Sippel. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InitialSearchTableViewController : UITableViewController <UISearchBarDelegate>

@property (weak, nonatomic) UISearchBar *searchBarMain;

@property (nonatomic, strong) NSMutableArray *patientArray;

@end
