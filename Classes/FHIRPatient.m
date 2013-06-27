//
//  Patient.m
//  FHIR
//
//  Created by Adam Sippel on 2013-01-24.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

#import "FHIRPatient.h"

@implementation FHIRPatient:FHIRResource

@synthesize patientDictionary = _patientDictionary;
@synthesize identifier = _identifier; //THIS ARRAY IS FILLED WITH "Identifier" OBJECTS ONLY. An identifier that applies to this person as a patient
@synthesize provider = _provider; //The provider for whom this is a patient record
@synthesize multipleBirthX = _multipleBirthX; //The boolean or integer in which describes a multiple birth, possibly containing the position born.(Integer/Boolean object)
@synthesize deceasedDate = _deceasedDate; //date in which patient has died
@synthesize link = _link; //THIS ARRAY IS FILLED WITH "ResourceReference(Patient)" OBJECTS ONLY. A linked patient record is a record that concerns the same patient. Records are linked after it is realized that at least one was created in error.
@synthesize active = _active; //Whether the patient record is in use, or has been removed from active use
@synthesize animal = _animal; //This element has a value if the patient is an animal
@synthesize details = _details; //Patient Demographic details
@synthesize contact = _contact; //THIS ARRAY IS FILLED WITH "PatientContact" OBJECTS ONLY. A contact party (e.g. guardian, partner, friend) for the patient
@synthesize genText = _genText;
@synthesize resourceTypeValue = _resourceTypeValue; //type of resource with extensions, text, and status

- (id)init
{
    self = [super init];
    if (self) {
        _patientDictionary = [[FHIRResourceDictionary alloc] init];
        _link = [[NSMutableArray alloc] init];
        _active = [[FHIRBool alloc] init];
        _identifier = [[NSMutableArray alloc] init];
        _details = [[FHIRDemographics alloc] init];
        _animal = [[FHIRAnimal alloc] init];
        _provider = [[FHIRResourceReference alloc] init];
        _genText = [[FHIRText alloc] init];
        _resourceTypeValue = [[FHIRResource alloc] init];
        _multipleBirthX = [[NSArray alloc] init];
        _deceasedDate = [[NSDate alloc] init];
        _contact = [[NSMutableArray alloc] init];
    }
    return self;
}

//override method
- (NSString *)getResourceType
{
    return [_resourceTypeValue returnResourceType];
}

- (FHIRResourceDictionary *)generateAndReturnResourceDictionary
{
    //find multipleBirth type to set for xml tag
    NSString *multiBirthTagString = [[NSString alloc] init];
    if ([_multipleBirthX count] == 1)
    {
        if ([[_multipleBirthX objectAtIndex:0] class] == [FHIRBool class]) multiBirthTagString = [NSString stringWithFormat:@"multipleBirthBoolean"];
        else if ([[_multipleBirthX objectAtIndex:0] class] == [NSNumber class]) multiBirthTagString = [NSString stringWithFormat:@"multipleBirthInteger"];
        else multiBirthTagString = [NSString stringWithFormat:@"multipleBirth?"];
    }
    
    _patientDictionary.dataForResource = [NSDictionary dictionaryWithObjectsAndKeys:
                                           [_active generateAndReturnDictionary], @"active",
                                           [FHIRExistanceChecker generateArray:_identifier], @"identifier",
                                           [_details generateAndReturnDictionary], @"details",
                                           [_provider generateAndReturnDictionary], @"provider",
                                           [_resourceTypeValue.text generateAndReturnDictionary], @"text",
                                           [FHIRExistanceChecker generateArray:_contact], @"contact",
                                           [FHIRExistanceChecker generateArray:_link], @"link",
                                           [FHIRExistanceChecker generateArray:_resourceTypeValue.extensions], @"extension",
                                           [FHIRExistanceChecker generateArray:_resourceTypeValue.contained], @"contained",
                                           [_animal generateAndReturnDictionary], @"animal",
                                           [FHIRExistanceChecker checkEmptySingleObjectArray:_multipleBirthX], multiBirthTagString,
                                           [NSDateFormatter localizedStringFromDate:_deceasedDate dateStyle:NSDateFormatterShortStyle timeStyle:NSDateFormatterFullStyle], @"deceasedDate",
                                           nil];
    [_patientDictionary cleanUpDictionaryValues];
    
    FHIRResourceDictionary *returnable = [[FHIRResourceDictionary alloc] init];
    returnable.dataForResource = [NSDictionary dictionaryWithObjectsAndKeys:_patientDictionary.dataForResource, @"Patient", nil];
    returnable.resourceName = @"patient";
    [returnable cleanUpDictionaryValues];
    return returnable;
}

- (void)patientParser:(NSDictionary *)dictionary
{
    [_resourceTypeValue setResouceTypeValue:@"patient"];
    NSDictionary *patientDict = [dictionary objectForKey:@"Patient"];
    //NSLog(@"%@", patient);
    
    [_resourceTypeValue resourceParser:patientDict];
    //NSLog(@"%@", patientDict);
    
    //_link
    NSArray *linkArray = [[NSArray alloc] initWithArray:[patientDict objectForKey:@"link"]];
    _link = [[NSMutableArray alloc] init];
    for (int i = 0; i < [linkArray count]; i++)
    {
        FHIRResourceReference *tempRR = [[FHIRResourceReference alloc] init];
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
        FHIRIdentifier *tempID = [[FHIRIdentifier alloc] init];
        [tempID identifierParser:[identifierArray objectAtIndex:i]];
        [_identifier addObject:tempID];
    }

    [_details demographicsParser:[patientDict objectForKey:@"details"]];
    [_animal animalParser:[patientDict objectForKey:@"animal"]];
    [_provider resourceReferenceParser:[patientDict objectForKey:@"provider"]];
    
    //sets timing array with the correct object sent
    for (NSString *key in dictionary)
    {
        if ([key isEqualToString:@"multipleBirthBoolean"] == TRUE)
        {
            //NSLog(@"Bool MultiBirth");
            FHIRBool *multiBirthBool = [[FHIRBool alloc] init];
            [multiBirthBool setValueBool:[patientDict objectForKey:@"multipleBirthBoolean"]];
            _multipleBirthX = [[NSArray alloc] initWithObjects:multiBirthBool, nil];
        }
        else if ([key isEqualToString:@"multipleBirthInteger"] == TRUE)
        {
            //NSLog(@"Int MultiBirth");
            NSNumber *multiBirthInt = [[NSNumber alloc] init];
            multiBirthInt = [NSNumber numberWithInteger:[[patientDict objectForKey:@"multipleBirthInteger"] integerValue]];
            _multipleBirthX = [[NSArray alloc] initWithObjects:multiBirthInt, nil];
        }

    }
    
    _deceasedDate = [FHIRExistanceChecker generateDateTimeFromString:[patientDict objectForKey:@"deceasedDate"]];
    
    //_contact
    NSArray *contactArray = [[NSArray alloc] initWithArray:[patientDict objectForKey:@"contact"]];
    _contact = [[NSMutableArray alloc] init];
    for (int i = 0; i < [contactArray count]; i++)
    {
        FHIRPatientContact *tempPC = [[FHIRPatientContact alloc] init];
        [tempPC patientContactParser:[contactArray objectAtIndex:i]];
        [_contact addObject:tempPC];
        //NSLog(@"%@", _contact);
    }
    
}

@end
