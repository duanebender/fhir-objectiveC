//
//  RootViewController.h
//  Untitled
//
//  Created by Geoffrey Pamerleau on 4/16/11.
//  Copyright 2011 US Air Force Academy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XMLParser.h"
#import "person.h"

@interface RootViewController : UITableViewController {
	NSMutableArray *personArray;
}

@property(nonatomic, retain) NSMutableArray *personArray;
@end
