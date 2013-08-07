//
//  ContactListTableViewCell.h
//  TestFHIRPatientApp
//
//  Created by Adam Sippel on 2013-08-01.
//  Copyright (c) 2013 Adam Sippel. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ContactListTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *contactInfoLabel;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *nameText;
@property (weak, nonatomic) IBOutlet UILabel *genderLabel;
@property (weak, nonatomic) IBOutlet UILabel *genderText;
@property (weak, nonatomic) IBOutlet UILabel *relationshipLabel;
@property (weak, nonatomic) IBOutlet UILabel *relationshipText;
@property (weak, nonatomic) IBOutlet UILabel *addressLabel;
@property (weak, nonatomic) IBOutlet UILabel *addressStreetText;
@property (weak, nonatomic) IBOutlet UILabel *addressAptText;
@property (weak, nonatomic) IBOutlet UILabel *addressCityText;
@property (weak, nonatomic) IBOutlet UILabel *addressCountryText;
@property (weak, nonatomic) IBOutlet UILabel *addressPostalText;
@property (weak, nonatomic) IBOutlet UILabel *phoneLabel;
@property (weak, nonatomic) IBOutlet UILabel *phoneHomeText;
@property (weak, nonatomic) IBOutlet UILabel *phoneCellText;
@property (weak, nonatomic) IBOutlet UILabel *phoneWorkText;
@property (weak, nonatomic) IBOutlet UILabel *faxLabel;
@property (weak, nonatomic) IBOutlet UILabel *faxText;
@property (weak, nonatomic) IBOutlet UILabel *emailLabel;
@property (weak, nonatomic) IBOutlet UILabel *emailText;
@property (weak, nonatomic) IBOutlet UILabel *organizationLabel;
@property (weak, nonatomic) IBOutlet UILabel *organizationText;

@end
