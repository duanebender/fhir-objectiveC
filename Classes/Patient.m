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
@synthesize genText = _genText;

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
        _genText = [[Text alloc] init];
    }
    return self;
}

//override method
- (NSInteger)getResourceType
{
    return ResourceTypePatient;
}

- (FHIRResourceDictionary *)generateAndReturnPatientResourceDictionary
{
    _patientDictionary.dataForResource = [NSDictionary dictionaryWithObjectsAndKeys:
                                           [ExistanceChecker generateArray:_link], @"link",
                                           [_active generateAndReturnDictionary], @"active",
                                           [ExistanceChecker generateArray:_identifier], @"identifier",
                                           [_details generateAndReturnDemographicsDictionary], @"details",
                                           [_animal generateAndReturnAnimalDictionary], @"animal",
                                           [_provider generateAndReturnDictionary], @"provider",
                                           [_diet generateAndReturnCodeableConceptDictionary], @"diet",
                                           [_confidentiality generateAndReturnCodeableConceptDictionary], @"confidentiality",
                                           [_recordLocation generateAndReturnCodeableConceptDictionary], @"recordLocation",
                                           [_genText generateAndReturnDictionary], @"text", //holds extra generated text
                                           nil];
    
    FHIRResourceDictionary *returnable = [[FHIRResourceDictionary alloc] init];
    returnable.dataForResource = [NSDictionary dictionaryWithObjectsAndKeys:_patientDictionary.dataForResource, @"Patient", nil];
    returnable.resourceName = @"Patient";
    [returnable cleanUpDictionaryValues];
    return returnable;
}

- (void)patientParser:(NSDictionary *)dictionary
{
    NSDictionary *patientDict = [dictionary objectForKey:@"Patient"];
    //NSLog(@"%@", patient);
    
    //_link
    NSArray *linkArray = [[NSArray alloc] initWithArray:[patientDict objectForKey:@"link"]];
    _link = [[NSMutableArray alloc] init];
    for (int i = 0; i < [linkArray count]; i++)
    {
        ResourceReference *tempRR = [[ResourceReference alloc] init];
        [tempRR resourceReferenceParser:[linkArray objectAtIndex:i]];
        [_link addObject:tempRR];
        //NSLog(@"%@", _link);
    }
    
    [_active setValueBool:[patientDict objectForKey:@"active"]];
    
    //_identifier
    NSArray *identifierArray = [[NSArray alloc] initWithArray:[patientDict objectForKey:@"identifier"]];
    _identifier = [[NSMutableArray alloc] init];
    for (int i = 0; i < [identifierArray count]; i++)
    {
        HumanId *tempHI = [[HumanId alloc] init];
        [tempHI humanIdParser:[identifierArray objectAtIndex:i]]; 
        [_identifier addObject:tempHI];
    }
    
    [_details demographicsParser:[patientDict objectForKey:@"details"]];
    [_animal animalParser:[patientDict objectForKey:@"animal"]];
    [_provider resourceReferenceParser:[patientDict objectForKey:@"provider"]];
    [_diet codeableConceptParser:[patientDict objectForKey:@"diet"]];
    [_confidentiality codeableConceptParser:[patientDict objectForKey:@"confidentiality"]];
    [_recordLocation codeableConceptParser:[patientDict objectForKey:@"recordLocation"]];
    
    [_genText textParser:[patientDict objectForKey:@"text"]];
    
}

@end
