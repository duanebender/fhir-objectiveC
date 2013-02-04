//
//  Contact.m
//  FHIR
//
//  Created by Adam Sippel on 2013-01-31.
//  Copyright (c) 2013 Adam Sippel. All rights reserved.
//

#import "Contact.h"

@interface Contact()
{
    ContactSystem system;
    ContactUse use;
}

@property (nonatomic) ContactSystem *system; //What kind of contact this is - what communications system is required to make use of the contact
@property (nonatomic) ContactUse *use; //The actual contact details, in a form that is meaningful to the designated communication system (i.e. phone number or email address).
@property (nonatomic, retain) String_ *value; //Identifies the context for the address
@property (nonatomic, retain) Period *period; //Time period when the contact was/is in use

@end

@implementation Contact

- (ContactSystem *)fromCodeSystem:(NSString *)codeString
{
    if (codeString == NULL || [codeString caseInsensitiveCompare:@""] == TRUE) return NULL;
    else if ([codeString caseInsensitiveCompare:@"phone"] == TRUE) return phone;
    else if ([codeString caseInsensitiveCompare:@"fax"] == TRUE) return fax;
    else if ([codeString caseInsensitiveCompare:@"email"] == TRUE) return email;
    else if ([codeString caseInsensitiveCompare:@"url"] == TRUE) return url;
    else [NSException raise:@"Unknown Narrative Status" format:@"code %@", codeString];
};

- (NSString *)toCodeSystem
{
    switch (system)
    {
        case phone:
            return @"phone";
            break;
        case fax:
            return @"fax";
            break;
        case email:
            return @"email";
            break;
        case url:
            return @"url";
            break;
            
        default:
            return @"?";
    }
}

- (ContactUse *)fromCodeUse:(NSString *)codeString
{
    if (codeString == NULL || [codeString caseInsensitiveCompare:@""] == TRUE) return NULL;
    else if ([codeString caseInsensitiveCompare:@"home"] == TRUE) return home;
    else if ([codeString caseInsensitiveCompare:@"work"] == TRUE) return work;
    else if ([codeString caseInsensitiveCompare:@"temp"] == TRUE) return temp;
    else if ([codeString caseInsensitiveCompare:@"old"] == TRUE) return old;
    else if ([codeString caseInsensitiveCompare:@"mobile"] == TRUE) return mobile;
    else [NSException raise:@"Unknown Narrative Status" format:@"code %@", codeString];
};

- (NSString *)toCodeUse
{
    switch (use)
    {
        case home:
            return @"home";
            break;
        case work:
            return @"work";
            break;
        case temp:
            return @"temp";
            break;
        case old:
            return @"old";
            break;
        case mobile:
            return @"mobile";
            break;
            
        default:
            return @"?";
    }
}

- (ContactSystem *)getSystem
{
    return self.system;
}

- (void)setSystem:(ContactSystem *)value
{
    self.system = value;
}

- (String_ *)getValue
{
    return self.value;
}

- (void)setValue:(String_ *)value
{
    self.value = value;
}

- (ContactUse *)getUse
{
    return self.use;
}

- (void)setUse:(ContactUse *)value
{
    self.use = value;
}

- (Period *)getPeriod
{
    return self.period;
}

- (void)setPeriod:(Period *)value
{
    self.period = value;
}

@end
