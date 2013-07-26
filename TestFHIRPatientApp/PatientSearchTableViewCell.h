//
//  PatientSearchTableViewCell.h
//  TestFHIRPatientApp
//
//  Created by Adam Sippel on 2013-07-24.
//  Copyright (c) 2013 Adam Sippel. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PatientSearchTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *patientProfileImageView;
@property (weak, nonatomic) IBOutlet UILabel *patientNameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *patientGenderImageView;
@property (weak, nonatomic) IBOutlet UILabel *patientDOBText;
@property (weak, nonatomic) IBOutlet UILabel *patientLocationText;
@property (weak, nonatomic) IBOutlet UILabel *patientDOBLabel;
@property (weak, nonatomic) IBOutlet UILabel *patientLocationLabel;

@end
