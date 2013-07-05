//
//  FHIRPatientContact.m
//  FHIR
//
//  Created by Adam Sippel on 2013-06-17.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

#import "FHIRPatientContact.h"

@implementation FHIRPatientContact

@synthesize patientContactDictionary = _patientContactDictionary; //dictionary of all patientContact resources
@synthesize relationship = _relationship; //THIS ARRAY IS FILLED WITH "PatientContact" OBJECTS ONLY. The nature of the relationship between the patient and the contactperson.
@synthesize name = _name; //A name associated with the person.
@synthesize telecom = _telecom; //THIS ARRAY CONTAINS "Contact" OBJECTS ONLY. A contact detail for the person, e.g. a telephone number or an email address.
@synthesize address = _address; //One or more addresses for the person.
@synthesize gender = _gender; //Administrative Gender - the gender that the person is considered to have for administration and record keeping purposes.
@synthesize organization = _organization; //Details about the contact person. (Organization)

- (id)init
{
    self = [super init];
    if (self) {
        _patientContactDictionary = [[FHIRResourceDictionary alloc] init];
        _relationship = [[NSMutableArray alloc] init];
        _name = [[FHIRHumanName alloc] init];
        _telecom = [[NSMutableArray alloc] init];
        _address = [[FHIRAddress alloc] init];
        _gender = [[FHIRCodeableConcept alloc] init];
        _organization = [[FHIRResourceReference alloc] init];
    }
    return self;
}

- (NSDictionary *)generateAndReturnDictionary
{
    _patientContactDictionary.dataForResource = [NSDictionary dictionaryWithObjectsAndKeys:
                                         [FHIRExistanceChecker generateArray:_relationship], @"relationship",
                                         [_name generateAndReturnDictionary], @"name",
                                         [FHIRExistanceChecker generateArray:_telecom], @"telecom",
                                         [_address generateAndReturnDictionary], @"address",
                                         [_gender generateAndReturnDictionary], @"gender",
                                         [_organization generateAndReturnDictionary], @"organization",
                                         nil];
    _patientContactDictionary.resourceName = @"PatientContact";
    [_patientContactDictionary cleanUpDictionaryValues];
    return _patientContactDictionary.dataForResource;
}

- (void)patientContactParser:(NSDictionary *)dictionary
{
    //_relationship
    NSArray *relationshipArray = [[NSArray alloc] initWithArray:[dictionary objectForKey:@"relationship"]];
    _relationship = [[NSMutableArray alloc] init];
    for (int i = 0; i < [relationshipArray count]; i++)
    {
        FHIRCodeableConcept *tempCC = [[FHIRCodeableConcept alloc] init];
        [tempCC codeableConceptParser:[relationshipArray objectAtIndex:i]];
        [_relationship addObject:tempCC];
    }
    
    [_name humanNameParser:[dictionary objectForKey:@"name"]];
    
    //_telecom
    NSArray *telecomArray = [[NSArray alloc] initWithArray:[dictionary objectForKey:@"telecom"]];
    _telecom = [[NSMutableArray alloc] init];
    for (int i = 0; i < [telecomArray count]; i++)
    {
        FHIRContact *tempCO = [[FHIRContact alloc] init];
        [tempCO contactParser:[telecomArray objectAtIndex:i]];
        [_telecom addObject:tempCO];
    }
    
    [_address addressParser:[dictionary objectForKey:@"address"]];
    [_gender codeableConceptParser:[dictionary objectForKey:@"gender"]];
    [_organization resourceReferenceParser:[dictionary objectForKey:@"organization"]];
    
}

@end
