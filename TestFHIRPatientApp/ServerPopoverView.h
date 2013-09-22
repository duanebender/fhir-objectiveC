//
//  ServerPopoverView.h
//  TestFHIRPatientApp
//
//  Created by Adam Sippel on 2013-08-12.
//  Copyright (c) 2013 Adam Sippel. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol PopupPassData <NSObject>
@required
- (void) returnFromPopup:(NSString*)popupData xmlorjson:(NSNumber *)indexSelected;
@end

@interface ServerPopoverView : UIViewController <UITextFieldDelegate>

@property (strong, nonatomic) id delegate;

@property (weak, nonatomic) IBOutlet UILabel *servAdressLabel;
@property (weak, nonatomic) IBOutlet UITextField *serverAddressTextField;
@property (weak, nonatomic) IBOutlet UISegmentedControl *jsonXmlSwitch;

@property (strong, nonatomic) NSString *serverURLText;
@property (strong, nonatomic) NSNumber *switchSelected;

@end
