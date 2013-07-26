//
//  LargeTextFieldTableViewCell.h
//  TestFHIRPatientApp
//
//  Created by Adam Sippel on 2013-07-24.
//  Copyright (c) 2013 Adam Sippel. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LargeTextFieldTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *largeTextLabel;
@property (weak, nonatomic) IBOutlet UITextView *largeTextView;

@end
