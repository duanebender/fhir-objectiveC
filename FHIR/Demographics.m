//
//  Demographics.m
//  FHIR
//
//  Created by Adam Sippel on 2013-01-31.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

#import "Demographics.h"

@implementation Demographics

- (NSMutableArray *)getName
{
    return self.name;
}

- (NSMutableArray *)getTelecom
{
    return self.telecom;
}

- (Coding *)getGender
{
    return self.gender;
}

- (void)setGender:(Coding *)value
{
    self.gender = value;
}

- (NSDate *)getBirthDate
{
    return self.birthDate;
}

- (void)setBirthDate:(NSDate *)value
{
    self.birthDate = value;
}

- (BOOL *)getDeceased
{
    return self.deceased;
}

- (void)setDeceased:(BOOL *)value
{
    self.deceased = value;
}

- (NSMutableArray *)getAddress
{
    return self.address;
}

- (CodeableConcept *)getMaritalStatus
{
    return self.maritalStatus;
}

- (void)setMaritalStatus:(CodeableConcept *)value
{
    self.maritalStatus = value;
}

- (NSMutableArray *)getLanguage
{
    return self.language;
}

@end
