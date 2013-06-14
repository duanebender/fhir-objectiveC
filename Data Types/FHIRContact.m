//
//  Contact.m
//  FHIR
//
//  Created by Adam Sippel on 2013-01-31.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

#import "FHIRContact.h"

@implementation FHIRContact

@synthesize contactDictionary = _contactDictionary;

@synthesize system = _system; //What kind of contact this is - what communications system is required to make use of the contact
@synthesize systemSV = _systemSV; //string for system
@synthesize use = _use; //The actual contact details, in a form that is meaningful to the designated communication system (i.e. phone number or email address).
@synthesize useSV = _useSV; //string for use
@synthesize value = _value; //Identifies the context for the address
@synthesize period = _period; //Time period when the contact was/is in use

- (id)init
{
    self = [super init];
    if (self) {
        _contactDictionary = [[FHIRResourceDictionary alloc] init];
        _value = [[FHIRString alloc] init];
        _period = [[FHIRPeriod alloc] init];
        _systemSV = [[FHIRString alloc] init];
        _useSV = [[FHIRString alloc] init];
    }
    return self;
}

- (void)setValueSystem:(NSDictionary *)systemDictionary
{
    [_systemSV setValueString:systemDictionary];
    
    if ([_systemSV.value isEqualToString:@"phone"]) self.system = ContactSystemPhone;
    else if ([_systemSV.value isEqualToString:@"fax"]) self.system = ContactSystemFax;
    else if ([_systemSV.value isEqualToString:@"email"]) self.system = ContactSystemEmail;
    else if ([_systemSV.value isEqualToString:@"url"]) self.system = ContactSystemUrl;
    else self.system = 0;
};

- (NSDictionary *)returnStringSystem
{
    switch (self.system)
    {
        case ContactSystemPhone:
            return [_systemSV generateAndReturnDictionary];
            break;
        case ContactSystemFax:
            return [_systemSV generateAndReturnDictionary];
            break;
        case ContactSystemEmail:
            return [_systemSV generateAndReturnDictionary];
            break;
        case ContactSystemUrl:
            return [_systemSV generateAndReturnDictionary];
            break;
            
        default:
            return [[NSDictionary alloc] initWithObjectsAndKeys:@"?", @"value", nil];
    }
}

- (void)setValueUse:(NSDictionary *)useDictionary
{
    [_useSV setValueString:useDictionary];
    
    if ([_useSV.value isEqualToString:@"home"]) self.use = ContactUseHome;
    else if ([_useSV.value isEqualToString:@"work"]) self.use = ContactUseWork;
    else if ([_useSV.value isEqualToString:@"temp"]) self.use = ContactUseTemp;
    else if ([_useSV.value isEqualToString:@"old"]) self.use = ContactUseOld;
    else if ([_useSV.value isEqualToString:@"mobile"]) self.use = ContactUseMobile;
    else self.use = 0;
};

- (NSDictionary *)returnStringUse
{
    switch (self.use)
    {
        case ContactUseHome:
            return [_useSV generateAndReturnDictionary];
            break;
        case ContactUseWork:
            return [_useSV generateAndReturnDictionary];
            break;
        case ContactUseTemp:
            return [_useSV generateAndReturnDictionary];
            break;
        case ContactUseOld:
            return [_useSV generateAndReturnDictionary];
            break;
        case ContactUseMobile:
            return [_useSV generateAndReturnDictionary];
            break;
            
        default:
            return [[NSDictionary alloc] initWithObjectsAndKeys:@"?", @"value", nil];
    }
}

- (NSDictionary *)generateAndReturnDictionary
{
    _contactDictionary.dataForResource = [NSDictionary dictionaryWithObjectsAndKeys:
                                            [self returnStringSystem], @"system",
                                            [self returnStringUse], @"use",
                                            [_value generateAndReturnDictionary], @"value",
                                            [_period generateAndReturnDictionary], @"period",
                                            nil];
    _contactDictionary.resourceName = @"Contact";
    [_contactDictionary cleanUpDictionaryValues];
    return _contactDictionary.dataForResource;
}

- (void)contactParser:(NSDictionary *)dictionary
{
    [self setValueSystem:[dictionary objectForKey:@"system"]];
    [self setValueUse:[dictionary objectForKey:@"use"]];
    [_value setValueString:[dictionary objectForKey:@"value"]];
    [_period periodParser:[dictionary objectForKey:@"period"]];
}

@end
