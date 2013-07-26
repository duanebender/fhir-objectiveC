//
//  SectionHeaderView.h
//  TestFHIRPatientApp
//
//  Created by Adam Sippel on 2013-07-22.
//  Copyright (c) 2013 Adam Sippel. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SectionHeaderView : UIView

@property (weak, nonatomic) IBOutlet UILabel *title;

- (id)initWithTitle:(NSString *)titleString;

@end
