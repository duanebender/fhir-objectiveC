//
//  phoneViewTableViewCell.h
//  TestFHIRPatientApp
//
//  Created by Adam Sippel on 2013-08-08.
//  Copyright (c) 2013 Adam Sippel. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PhoneViewTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *phoneHomeText;
@property (weak, nonatomic) IBOutlet UILabel *phoneCellText;
@property (weak, nonatomic) IBOutlet UILabel *phoneWorkText;

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *homeLabel;
@property (weak, nonatomic) IBOutlet UILabel *mobileLabel;
@property (weak, nonatomic) IBOutlet UILabel *workLabel;

@end
