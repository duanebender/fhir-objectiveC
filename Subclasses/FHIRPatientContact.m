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
@synthesize organization = _organization; //Details about the contact person. (Organization)

- (id)init
{
    self = [super init];
    if (self) {
        _patientContactDictionary = [[FHIRResourceDictionary alloc] init];
        _relationship = [[NSMutableArray alloc] init];
        _organization = [[FHIRResourceReference alloc] init];
    }
    return self;
}

- (NSDictionary *)generateAndReturnDictionary
{
    _patientContactDictionary.dataForResource = [NSDictionary dictionaryWithObjectsAndKeys:
                                         [FHIRExistanceChecker generateArray:_relationship], @"relationship",
                                         [_organization generateAndReturnDictionary], @"organization",
                                         nil];
    _patientContactDictionary.resourceName = @"PatientContact";
    [_patientContactDictionary cleanUpDictionaryValues];
    return _patientContactDictionary.dataForResource;
}

- (void)patientContactParser:(NSDictionary *)dictionary
{
    //_name
    NSArray *relationshipArray = [[NSArray alloc] initWithArray:[dictionary objectForKey:@"relationship"]];
    _relationship = [[NSMutableArray alloc] init];
    for (int i = 0; i < [relationshipArray count]; i++)
    {
        FHIRCodeableConcept *tempCC = [[FHIRCodeableConcept alloc] init];
        [tempCC codeableConceptParser:[relationshipArray objectAtIndex:i]];
        [_relationship addObject:tempCC];
        //NSLog(@"%@", _relationship);
    }
    
    [_organization resourceReferenceParser:[dictionary objectForKey:@"organization"]];
    
}

@end
