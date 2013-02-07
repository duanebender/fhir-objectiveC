//
//  RootViewController.h
//  Untitled
//
//  Created by Geoffrey Pamerleau on 4/16/11.
//  Copyright 2011 US Air Force Academy. All rights reserved.
//

#warning - update for GUI Later

#import <UIKit/UIKit.h>
#import "XMLParser.h"
#import "Patient.h"

@interface RootViewController : UITableViewController {
	NSMutableArray *patientArray;
}

@property(nonatomic, retain) NSMutableArray *patientArray;
@end
