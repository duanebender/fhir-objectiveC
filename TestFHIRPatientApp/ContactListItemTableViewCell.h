//
//  ContactListItemTableViewCell.h
//  TestFHIRPatientApp
//
//  Created by Adam Sippel on 2013-07-24.
//  Copyright (c) 2013 Adam Sippel. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ContactListItemTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *genderTextField;
@property (weak, nonatomic) IBOutlet UITextField *relationshipTextField;
@property (weak, nonatomic) IBOutlet UITextField *addressStreetTextField;
@property (weak, nonatomic) IBOutlet UITextField *addressApptTextField;
@property (weak, nonatomic) IBOutlet UITextField *addressCityStateTextField;
@property (weak, nonatomic) IBOutlet UITextField *addressCountryTextField;
@property (weak, nonatomic) IBOutlet UITextField *addressZipTextField;
@property (weak, nonatomic) IBOutlet UITextField *phoneHomeTextField;
@property (weak, nonatomic) IBOutlet UITextField *phoneCellTextField;
@property (weak, nonatomic) IBOutlet UITextField *phoneWorkTextField;
@property (weak, nonatomic) IBOutlet UITextField *faxTextField;
@property (weak, nonatomic) IBOutlet UITextField *emailTextField;
@property (weak, nonatomic) IBOutlet UITextField *organizationTextField;

@end
