//
//  LinksViewTableViewCell.h
//  TestFHIRPatientApp
//
//  Created by Adam Sippel on 2013-07-30.
//  Copyright (c) 2013 Adam Sippel. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LinksViewTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *linksViewLabel;
@property (weak, nonatomic) IBOutlet UITextView *linkedPatientsTextField;

@end
