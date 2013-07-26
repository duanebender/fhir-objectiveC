//
//  PhoneTableViewCell.h
//  TestFHIRPatientApp
//
//  Created by Adam Sippel on 2013-07-23.
//  Copyright (c) 2013 Adam Sippel. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PhoneTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UITextField *homePhoneTextField;
@property (weak, nonatomic) IBOutlet UITextField *cellPhoneTextField;
@property (weak, nonatomic) IBOutlet UITextField *workPhoneTextField;

@end
