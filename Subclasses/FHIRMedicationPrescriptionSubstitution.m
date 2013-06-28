//
//  FHIRMedicationPrescriptionSubstitution.m
//  FHIR
//
//  Created by Adam Sippel on 2013-06-28.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

#import "FHIRMedicationPrescriptionSubstitution.h"

@implementation FHIRMedicationPrescriptionSubstitution

@synthesize medicationPrescriptionSubstitutionDictionary = _medicationPrescriptionSubstitutionDictionary; //dictionary of all substitution resources
@synthesize type = _type; //A code signifying whether a different drug should be dispensed from what was prescribed.
@synthesize reason = _reason; //Indicates the reason for the substitution why substitution must or must not be performed.

- (id)init
{
    self = [super init];
    if (self) {
        _medicationPrescriptionSubstitutionDictionary = [[FHIRResourceDictionary alloc] init];
        _type = [[FHIRCodeableConcept alloc] init];
        _reason = [[FHIRCodeableConcept alloc] init];
    }
    return self;
}

- (NSDictionary *)generateAndReturnDictionary
{
    _medicationPrescriptionSubstitutionDictionary.dataForResource = [NSDictionary dictionaryWithObjectsAndKeys:
                                               [_type generateAndReturnDictionary], @"type",
                                               [_reason generateAndReturnDictionary], @"reason",
                                               nil];
    _medicationPrescriptionSubstitutionDictionary.resourceName = @"Substitution";
    [_medicationPrescriptionSubstitutionDictionary cleanUpDictionaryValues];
    return _medicationPrescriptionSubstitutionDictionary.dataForResource;
}

- (void)substitutionParser:(NSDictionary *)dictionary
{
    [_type codeableConceptParser:[dictionary objectForKey:@"type"]];
    [_reason codeableConceptParser:[dictionary objectForKey:@"reason"]];
}

@end
