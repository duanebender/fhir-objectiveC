//
//  AddressInputTableViewCell.h
//  TestFHIRPatientApp
//
//  Created by Adam Sippel on 2013-07-23.
//  Copyright (c) 2013 Adam Sippel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CellTextPasserDelegate.h"

@interface AddressInputTableViewCell : UITableViewCell <UITextViewDelegate>

@property (weak, nonatomic) IBOutlet UILabel *addressLabel;
@property (weak, nonatomic) IBOutlet UITextView *addressTextField;

@property (strong, nonatomic) id<CellTextPasserDelegate> delegate;

@end
