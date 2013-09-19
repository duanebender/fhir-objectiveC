//
//  ContactListItemTableViewCell.m
//  TestFHIRPatientApp
//
//  Created by Adam Sippel on 2013-07-24.
//  Copyright (c) 2013 Adam Sippel. All rights reserved.
//

#import "ContactListItemTableViewCell.h"

@implementation ContactListItemTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    NSDictionary *tempDictionary = [[NSDictionary alloc] initWithObjectsAndKeys:
                                    self.nameTextField.text, @"Contact Name:",
                                    self.genderTextField.text, @"Contact Gender:",
                                    self.relationshipTextField.text, @"Contact Relationship:",
                                    self.phoneHomeTextField.text, @"Contact Home Phone:",
                                    self.phoneWorkTextField.text, @"Contact Work Phone:",
                                    self.phoneCellTextField.text, @"Contact Cell Phone:",
                                    self.faxTextField.text, @"Contact Fax:",
                                    self.emailTextField.text, @"Contact Email:",
                                    self.organizationTextField.text, @"Contact Organization:",
                                    nil];
    
    [self.delegate textFromTheCell:tempDictionary];
}

- (void)textViewDidEndEditing:(UITextView *)textView //address is a text view instead of a text field
{
    NSDictionary *tempDictionary = [NSDictionary dictionaryWithObject:self.addressTextView.text forKey:@"Contact Address:"];
    
    [self.delegate textFromTheCell:tempDictionary];
}

@end
