//
//  ServerPopoverView.m
//  TestFHIRPatientApp
//
//  Created by Adam Sippel on 2013-08-12.
//  Copyright (c) 2013 Adam Sippel. All rights reserved.
//

#import "ServerPopoverView.h"

@implementation ServerPopoverView

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.serverURLText = [[NSString alloc] init];
}

-(void) viewWillAppear:(BOOL)animated
{
    self.serverAddressTextField.text = self.serverURLText;
    self.jsonXmlSwitch.selectedSegmentIndex = [self.switchSelected integerValue];
}

-(BOOL) textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    self.serverURLText = self.serverAddressTextField.text;
    return YES;
}
- (IBAction)applyButtonPressed:(id)sender
{
    self.serverURLText = self.serverAddressTextField.text;
    [[self delegate] returnFromPopup:self.serverURLText xmlorjson:[NSNumber numberWithInteger:[self.jsonXmlSwitch selectedSegmentIndex]]];
}

@end
