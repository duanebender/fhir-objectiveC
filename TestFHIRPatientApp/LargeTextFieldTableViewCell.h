//
//  LargeTextFieldTableViewCell.h
//  TestFHIRPatientApp
//
//  Created by Adam Sippel on 2013-07-24.
//  Copyright (c) 2013 Adam Sippel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CellTextPasserDelegate.h"

@interface LargeTextFieldTableViewCell : UITableViewCell <UITextViewDelegate>

@property (weak, nonatomic) IBOutlet UILabel *largeTextLabel;
@property (weak, nonatomic) IBOutlet UITextView *largeTextView;

@property (strong, nonatomic) id<CellTextPasserDelegate> delegate;

@end
