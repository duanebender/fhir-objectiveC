//
//  ContactListItemTableViewCell.h
//  TestFHIRPatientApp
//
//  Created by Adam Sippel on 2013-07-24.
//  Copyright (c) 2013 Adam Sippel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CellTextPasserDelegate.h"

@interface ContactListItemTableViewCell : UITableViewCell <UITextFieldDelegate, UITextViewDelegate>

@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *genderTextField;
@property (weak, nonatomic) IBOutlet UITextField *relationshipTextField;
@property (weak, nonatomic) IBOutlet UITextField *phoneHomeTextField;
@property (weak, nonatomic) IBOutlet UITextField *phoneCellTextField;
@property (weak, nonatomic) IBOutlet UITextField *phoneWorkTextField;
@property (weak, nonatomic) IBOutlet UITextField *faxTextField;
@property (weak, nonatomic) IBOutlet UITextField *emailTextField;
@property (weak, nonatomic) IBOutlet UITextField *organizationTextField;
@property (weak, nonatomic) IBOutlet UITextView *addressTextView;

@property (strong, nonatomic) id<CellTextPasserDelegate> delegate;

@end
