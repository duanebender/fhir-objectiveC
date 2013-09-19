//
//  LargeTextFieldTableViewCell.m
//  TestFHIRPatientApp
//
//  Created by Adam Sippel on 2013-07-24.
//  Copyright (c) 2013 Adam Sippel. All rights reserved.
//

#import "LargeTextFieldTableViewCell.h"

@implementation LargeTextFieldTableViewCell

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

- (void)textViewDidEndEditing:(UITextField *)textView
{
    NSDictionary *tempDictionary = [[NSDictionary alloc] initWithObjectsAndKeys:self.largeTextView.text, self.largeTextLabel.text, nil];
    
    [self.delegate textFromTheCell:tempDictionary];
}

@end
