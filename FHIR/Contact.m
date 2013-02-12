//
//  Contact.m
//  FHIR
//
//  Created by Adam Sippel on 2013-01-31.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

#import "Contact.h"

@implementation Contact

@synthesize system = _system; //What kind of contact this is - what communications system is required to make use of the contact
@synthesize use = _use; //The actual contact details, in a form that is meaningful to the designated communication system (i.e. phone number or email address).
@synthesize value = _value; //Identifies the context for the address
@synthesize period = _period; //Time period when the contact was/is in use

- (NSInteger)fromCodeSystem:(NSString *)codeString
{
    if (codeString == NULL || [codeString caseInsensitiveCompare:@""] == TRUE) return 0;
    else if ([codeString caseInsensitiveCompare:@"phone"] == TRUE) return ContactSystemPhone;
    else if ([codeString caseInsensitiveCompare:@"fax"] == TRUE) return ContactSystemFax;
    else if ([codeString caseInsensitiveCompare:@"email"] == TRUE) return ContactSystemEmail;
    else if ([codeString caseInsensitiveCompare:@"url"] == TRUE) return ContactSystemUrl;
    else [NSException raise:@"Unknown CodeSystem Status" format:@"code %@", codeString];
};

- (NSString *)toCodeSystem
{
    switch (system)
    {
        case ContactSystemPhone:
            return @"phone";
            break;
        case ContactSystemFax:
            return @"fax";
            break;
        case ContactSystemEmail:
            return @"email";
            break;
        case ContactSystemUrl:
            return @"url";
            break;
            
        default:
            return @"?";
    }
}

- (NSInteger)fromCodeUse:(NSString *)codeString
{
    if (codeString == NULL || [codeString caseInsensitiveCompare:@""] == TRUE) return 0;
    else if ([codeString caseInsensitiveCompare:@"home"] == TRUE) return ContactUseHome;
    else if ([codeString caseInsensitiveCompare:@"work"] == TRUE) return ContactUseWork;
    else if ([codeString caseInsensitiveCompare:@"temp"] == TRUE) return ContactUseTemp;
    else if ([codeString caseInsensitiveCompare:@"old"] == TRUE) return ContactUseOld;
    else if ([codeString caseInsensitiveCompare:@"mobile"] == TRUE) return ContactUseMobile;
    else [NSException raise:@"Unknown CodeSystem Status" format:@"code %@", codeString];
};

- (NSString *)toCodeUse
{
    switch (use)
    {
        case ContactUseHome:
            return @"home";
            break;
        case ContactUseWork:
            return @"work";
            break;
        case ContactUseTemp:
            return @"temp";
            break;
        case ContactUseOld:
            return @"old";
            break;
        case ContactUseMobile:
            return @"mobile";
            break;
            
        default:
            return @"?";
    }
}

@end
