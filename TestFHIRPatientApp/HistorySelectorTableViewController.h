//
//  HistorySelectorTableViewController.h
//  TestFHIRPatientApp
//
//  Created by Adam Sippel on 2013-09-11.
//  Copyright (c) 2013 Adam Sippel. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol passSelectedIDBack <NSObject>
@required
- (void)iDSelectionToPassBack:(NSInteger *)selectedHistory;
@end

@interface HistorySelectorTableViewController : UITableViewController

@property (nonatomic, strong) NSArray *historyList;
@property (nonatomic, strong) id delegate;

@end
