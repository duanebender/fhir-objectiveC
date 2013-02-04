//
//  Contact.h
//  FHIR
//
//  Created by Adam Sippel on 2013-01-31.
//  Copyright (c) 2013 Adam Sippel. All rights reserved.
//

//All kinds of technology mediated contact details for a person or organisation, including telephone, email, etc.

#import <Foundation/Foundation.h>
#import "Type.h"
#import "String_.h"
#import "Period.h"

typedef enum
{
    phone, //The value is a telephone number used for voice calls. Use of full international numbers starting with + is recommended to enable automatic dialing support but not required.
    fax, //The value is a fax machine. Use of full international numbers starting with + is recommended to enable automatic dialing support but not required.
    email, //The value is an email address
    url //The value is a url. This is intended for various personal contacts including blogs, Twitter, Facebook, etc. Do not use for email addresses
    
}ContactSystem;

typedef enum
{
    home, //A communication contact at a home; attempted contacts for business purposes might intrude privacy and chances are one will contact family or other household members instead of the person one wishes to call. Typically used with urgent cases, or if no other contacts are available.
    work, //An office contact. First choice for business related contacts during business hours.
    temp, //A temporary contact. The period can provide more detailed information.
    old, //This contact is no longer in use (or was never correct, but retained for records)
    mobile //A telecommunication device that moves and stays with its owner. May have characteristics of all other use codes, suitable for urgent matters, not the first choice for routine business
    
}ContactUse;

@interface Contact : Type

- (ContactSystem *)getSystem;
- (void)setSystem:(ContactSystem *)value;
- (String_ *)getValue;
- (void)setValue:(String_ *)value;
- (ContactUse *)getUse;
- (void)setUse:(ContactUse *)value;
- (Period *)getPeriod;
- (void)setPeriod:(Period *)value;

@end
