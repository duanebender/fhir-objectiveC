//
//  AddressInputTableViewCell.h
//  TestFHIRPatientApp
//
//  Created by Adam Sippel on 2013-07-23.
//  Copyright (c) 2013 Adam Sippel. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddressInputTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *addressLabel;
@property (weak, nonatomic) IBOutlet UITextField *streetNumberTextField;
@property (weak, nonatomic) IBOutlet UITextField *apptNumberTextField;
@property (weak, nonatomic) IBOutlet UITextField *cityStateTextField;
@property (weak, nonatomic) IBOutlet UITextField *countryTextField;
@property (weak, nonatomic) IBOutlet UITextField *postalZipCodeTextField;


@end
