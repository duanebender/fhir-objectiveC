//
//  Patient.m
//  FHIR
//
//  Created by Adam Sippel on 2013-01-24.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

#import "Patient.h"

@implementation Patient:Resource 

@synthesize patientDictionary = _patientDictionary;

- (FHIRResourceDictionary *)getPatientResourceDictionary
{
    return _patientDictionary;
}

- (void)setPatientDictionary:(FHIRResourceDictionary *)patientDictionary
{
    _patientDictionary = patientDictionary;
}


- (NSArray *)getLink
{
    return self.link;
}

- (BOOL *)getActive
{
    return self.active;
}

- (void)setActive:(BOOL *)value
{
    self.active = value;
}

- (NSArray *)getIdentifier
{
    return self.identifier;
}

- (Demographics *)getDetails
{
    return self.details;
}

- (void)setDetails:(Demographics *)value
{
    self.details = value;
}

- (Animal *)getAnimal
{
    return self.animal;
}

- (void)setAnimal:(Animal *)value
{
    self.animal = value;
}

- (ResourceReference *)getProvider
{
    return self.provider;
}

- (void)setProvider:(ResourceReference *)value
{
    self.provider = value;
}

- (CodeableConcept *)getDiet
{
    return self.diet;
}

- (void)setDiet:(CodeableConcept *)value
{
    self.diet = value;
}

- (CodeableConcept *)getConfidentiality
{
    return self.confidentiality;
}

- (void)setConfidentiality:(CodeableConcept *)value
{
    self.confidentiality = value;
}

- (CodeableConcept *)getRecordLocation
{
    return self.recordLocation;
}

- (void)setRecordLocation:(CodeableConcept *)value
{
    self.recordLocation = value;
}

//override method
- (NSInteger)getResourceType
{
    return PatientType;
}

@end
