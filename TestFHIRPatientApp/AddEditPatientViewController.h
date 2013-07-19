//
//  AddEditPatientViewController.h
//  TestFHIRPatientApp
//
//  Created by Adam Sippel on 2013-07-17.
//  Copyright (c) 2013 Adam Sippel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AddEditPatientScrollContextViewController.h"

@interface AddEditPatientViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *editPatientImage;
@property (weak, nonatomic) IBOutlet UIScrollView *editableValuesScrollView;

@end
