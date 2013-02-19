//
//  Contact.m
//  FHIR
//
//  Created by Adam Sippel on 2013-01-31.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

#import "Contact.h"

@implementation Contact

@synthesize contactDictionary = _contactDictionary;

@synthesize system = _system; //What kind of contact this is - what communications system is required to make use of the contact
@synthesize use = _use; //The actual contact details, in a form that is meaningful to the designated communication system (i.e. phone number or email address).
@synthesize value = _value; //Identifies the context for the address
@synthesize period = _period; //Time period when the contact was/is in use

- (id)init
{
    self = [super init];
    if (self) {
        _contactDictionary = [[FHIRResourceDictionary alloc] init];
        _value = [[String alloc] init];
        _period = [[Period alloc] init];
    }
    return self;
}

- (void)setValueSystem:(NSString *)codeString
{
    if ([codeString caseInsensitiveCompare:@"phone"]) self.system = ContactSystemPhone;
    else if ([codeString caseInsensitiveCompare:@"fax"]) self.system = ContactSystemFax;
    else if ([codeString caseInsensitiveCompare:@"email"]) self.system = ContactSystemEmail;
    else if ([codeString caseInsensitiveCompare:@"url"]) self.system = ContactSystemUrl;
    else self.system = 0;
};

- (NSString *)returnStringSystem
{
    switch (self.system)
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

- (void)getValueUse:(NSString *)codeString
{
    if ([codeString caseInsensitiveCompare:@"home"]) self.use = ContactUseHome;
    else if ([codeString caseInsensitiveCompare:@"work"]) self.use = ContactUseWork;
    else if ([codeString caseInsensitiveCompare:@"temp"]) self.use = ContactUseTemp;
    else if ([codeString caseInsensitiveCompare:@"old"]) self.use = ContactUseOld;
    else if ([codeString caseInsensitiveCompare:@"mobile"]) self.use = ContactUseMobile;
    else self.use = 0;
};

- (NSString *)returnStringUse
{
    switch (self.use)
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

- (NSDictionary *)generateAndReturnContactDictionary
{
    _contactDictionary.dataForResource = [NSDictionary dictionaryWithObjectsAndKeys:
                                            [self returnStringSystem], @"system",
                                            [self returnStringUse], @"use",
                                            [_value generateAndReturnDictionary], @"value",
                                            [_period generateAndReturnDictionary], @"prefix",
                                            nil];
    _contactDictionary.resourceName = @"Contact";
    return _contactDictionary.dataForResource;
}

@end
