//
//  SingleLineInputTableViewCell.m
//  TestFHIRPatientApp
//
//  Created by Adam Sippel on 2013-07-22.
//  Copyright (c) 2013 Adam Sippel. All rights reserved.
//

#import "SingleLineInputTableViewCell.h"

@implementation SingleLineInputTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    
    if (selected)
    {
        [self setSelected:NO animated:NO];
    }

    // Configure the view for the selected state
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    NSDictionary *tempDictionary = [[NSDictionary alloc] initWithObjectsAndKeys:self.inputTextField.text, self.titleLabel.text, nil];
    
    self.savedText = [[NSString alloc] initWithString:self.inputTextField.text];
    [self.delegate textFromTheCell:tempDictionary];
}

@end
