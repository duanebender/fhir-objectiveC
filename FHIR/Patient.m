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
@synthesize link = _link; //THIS ARRAY IS FILLED WITH "ResourceReference" OBJECTS ONLY. A linked patient record is a record that concerns the same patient. Records are linked after it is realized that at least one was created in error.
@synthesize active = _active; //Whether the patient record is in use, or has been removed from active use
@synthesize identifier = _identifier; //THIS ARRAY IS FILLED WITH "HumanId" OBJECTS ONLY.. An identifier that applies to this person as a patient
@synthesize details = _details; //Patient Demographic details
@synthesize animal = _animal; //This element has a value if the patient is an animal
@synthesize provider = _provider; //The provider for whom this is a patient record
@synthesize diet = _diet; //Dietary restrictions for the patient
@synthesize confidentiality = _confidentiality; //Confidentiality of the patient records
@synthesize recordLocation = _recordLocation; //The location of the paper record for the patient, if there is one

- (id)init
{
    self = [super init];
    if (self) {
        _patientDictionary = [[FHIRResourceDictionary alloc] init];
        _link = [[NSMutableArray alloc] init];
        _active = [[Bool alloc] init];
        _identifier = [[NSMutableArray alloc] init];
        _details = [[Demographics alloc] init];
        _animal = [[Animal alloc] init];
        _provider = [[ResourceReference alloc] init];
        _diet = [[CodeableConcept alloc] init];
        _confidentiality = [[CodeableConcept alloc] init];
        _recordLocation = [[CodeableConcept alloc] init];
    }
    return self;
}

//override method
- (NSInteger)getResourceType
{
    return ResourceTypePatient;
}

- (NSDictionary *)generateAndReturnPatientResourceDictionary
{
    _patientDictionary.dataForResource = [NSDictionary dictionaryWithObjectsAndKeys:
                                           _link, @"link",
                                           [_active generateAndReturnDictionary], @"active",
                                           _identifier, @"identifier",
                                           //_details, @"details",
                                           //_animal, @"animal",
                                           //_provider, @"provider",
                                           //_diet, @"diet",
                                           //_confidentiality, @"confidentiality",
                                           //_recordLocation, @"recordLocation",
                                           nil];
    
    FHIRResourceDictionary *returnable = [[FHIRResourceDictionary alloc] init];
    returnable.dataForResource = [NSDictionary dictionaryWithObjectsAndKeys:_patientDictionary.dataForResource, @"Patient", nil];
    return returnable.dataForResource;
}

@end
