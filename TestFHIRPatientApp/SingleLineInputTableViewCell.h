//
//  SingleLineInputTableViewCell.h
//  TestFHIRPatientApp
//
//  Created by Adam Sippel on 2013-07-22.
//  Copyright (c) 2013 Adam Sippel. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SingleLineInputTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UITextField *inputTextField;

@end
