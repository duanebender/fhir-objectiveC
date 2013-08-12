//
//  InitialSearchTableViewController.h
//  TestFHIRPatientApp
//
//  Created by Adam Sippel on 2013-07-15.
//  Copyright (c) 2013 Adam Sippel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ServerPopoverView.h"

@interface InitialSearchTableViewController : UITableViewController <UISearchBarDelegate, UITextFieldDelegate, PopupPassData>

@property (weak, nonatomic) UISearchBar *searchBarMain;

@property (nonatomic, strong) NSMutableArray *patientArray;
@property (nonatomic, strong) NSString *currentServerAddress;

@property (nonatomic, weak) UIPopoverController *serverPopover;

@end
