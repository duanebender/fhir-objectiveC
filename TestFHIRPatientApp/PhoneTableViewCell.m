//
//  PhoneTableViewCell.m
//  TestFHIRPatientApp
//
//  Created by Adam Sippel on 2013-07-23.
//  Copyright (c) 2013 Adam Sippel. All rights reserved.
//

#import "PhoneTableViewCell.h"

@implementation PhoneTableViewCell

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
                                    self.homePhoneTextField.text, @"Home Phone:",
                                    self.workPhoneTextField.text, @"Work Phone:",
                                    self.cellPhoneTextField.text, @"Cell Phone:",
                                    nil];
    
    [self.delegate textFromTheCell:tempDictionary];
}

@end
