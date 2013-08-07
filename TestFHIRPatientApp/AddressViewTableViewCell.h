//
//  AddressViewTableViewCell.h
//  TestFHIRPatientApp
//
//  Created by Adam Sippel on 2013-07-29.
//  Copyright (c) 2013 Adam Sippel. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddressViewTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *streetLabel;
@property (weak, nonatomic) IBOutlet UILabel *apptLabel;
@property (weak, nonatomic) IBOutlet UILabel *cityProvStateLabel;
@property (weak, nonatomic) IBOutlet UILabel *countryLabel;
@property (weak, nonatomic) IBOutlet UILabel *zipPostalCodeLabel;

@end
