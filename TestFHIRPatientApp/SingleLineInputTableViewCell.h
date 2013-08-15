//
//  SingleLineInputTableViewCell.h
//  TestFHIRPatientApp
//
//  Created by Adam Sippel on 2013-07-22.
//  Copyright (c) 2013 Adam Sippel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CellTextPasserDelegate.h"

@interface SingleLineInputTableViewCell : UITableViewCell <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UITextField *inputTextField;

@property (strong, nonatomic) NSString *savedText;
@property (strong, nonatomic) id<CellTextPasserDelegate> delegate;



@end
