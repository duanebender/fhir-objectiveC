//
//  Organization.m
//  FHIR
//
//  Created by Adam Sippel on 2013-05-28.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

#import "FHIROrganization.h"

@implementation FHIROrganization

@synthesize organizationDictionary = _organizationDictionary; //a dictionary containing all resources in this organization object
@synthesize identifier = _identifier; //THIS ARRAY IS FILLED WITH "Identifier" OBJECTS ONLY. A linked patient record is a record that concerns the same patient. Records are linked after it is realized that at least one was created in error.
@synthesize name = _name; //THIS ARRAY IS FILLED WITH "String" OBJECTS ONLY. An identifier that applies to this person as a patient
@synthesize type = _type; //the type of organization
@synthesize address = _address; //organization address details
@synthesize telecom = _telecom; //contact information of this organization
@synthesize active = _active; //active status of the organization
@synthesize partOf = _partOf; //holds resource type, text, name, and extensions
@synthesize genText = _genText;
@synthesize contactEntity = _contactEntity; // CONATINS "ContactEntity" OBJECTS ONLY. Contact for the organization for a certain purpose.
@synthesize accreditation = _accreditation; //CONTAINS "Accreditation" OBJECTS ONLY. The qualifications/certifications an organization has, including format educational achievements, accreditations and current certifications. All these qualifications may be used to determine what roles the organization may play in a healthcare environment.

- (id)init
{
    self = [super init];
    if (self) {
        _organizationDictionary = [[FHIRResourceDictionary alloc] init];
        _identifier = [[NSMutableArray alloc] init];
        _name = [[NSMutableArray alloc] init];
        _type = [[FHIRCodeableConcept alloc] init];
        _address = [[NSMutableArray alloc] init];
        _telecom = [[NSMutableArray alloc] init];
        _active = [[FHIRBool alloc] init];
        _partOf = [[FHIRResourceReference alloc] init];
        _genText = [[FHIRText alloc] init];
        _contactEntity = [[NSMutableArray alloc] init];
        _accreditation = [[NSMutableArray alloc] init];
        _resourceTypeValue = [[FHIRResource alloc] init];
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
    _organizationDictionary.dataForResource = [NSDictionary dictionaryWithObjectsAndKeys:
                                          [_active generateAndReturnDictionary], @"active",
                                          [FHIRExistanceChecker generateArray:_name], @"name",
                                          [_genText generateAndReturnDictionary], @"text", //holds extra generated text
                                          [FHIRExistanceChecker generateArray:_telecom], @"telecom",
                                          [FHIRExistanceChecker generateArray:_identifier], @"identifier",
                                          [_type generateAndReturnDictionary], @"type",
                                          [FHIRExistanceChecker generateArray:_address], @"address",
                                          [_partOf generateAndReturnDictionary], @"partOf",
                                          [FHIRExistanceChecker generateArray:_contactEntity], @"contactEntity",
                                          [FHIRExistanceChecker generateArray:_accreditation], @"accreditation",
                                          nil];
    [_organizationDictionary cleanUpDictionaryValues];
    
    FHIRResourceDictionary *returnable = [[FHIRResourceDictionary alloc] init];
    returnable.dataForResource = [NSDictionary dictionaryWithObjectsAndKeys:_organizationDictionary.dataForResource, @"Organization", nil];
    returnable.resourceName = @"organization";
    [returnable cleanUpDictionaryValues];
    return returnable;
}

- (void)organizationParser:(NSDictionary *)dictionary
{
    [_resourceTypeValue setResouceTypeValue:@"organization"];
    NSDictionary *organizationDict = [dictionary objectForKey:@"Organization"];
    //NSLog(@"%@", organizationDict);
    
    [_active setValueBool:[organizationDict objectForKey:@"active"]];
    
    //_identifier
    NSArray *identifierArray = [[NSArray alloc] initWithArray:[organizationDict objectForKey:@"identifier"]];
    _identifier = [[NSMutableArray alloc] init];
    for (int i = 0; i < [identifierArray count]; i++)
    {
        FHIRIdentifier *tempID = [[FHIRIdentifier alloc] init];
        [tempID identifierParser:[identifierArray objectAtIndex:i]];
        [_identifier addObject:tempID];
    }
    
    //_name
    NSArray *nameArray = [[NSArray alloc] initWithArray:[organizationDict objectForKey:@"name"]];
    _name = [[NSMutableArray alloc] init];
    for (int i = 0; i < [nameArray count]; i++)
    {
        FHIRString *tempNA = [[FHIRString alloc] init];
        [tempNA setValueString:[nameArray objectAtIndex:i]];
        [_name addObject:tempNA];
    }
    
    [_type codeableConceptParser:[organizationDict objectForKey:@"type"]];
    [_genText textParser:[organizationDict objectForKey:@"text"]];
    
    //_address
    NSArray *addressArray = [[NSArray alloc] initWithArray:[organizationDict objectForKey:@"address"]];
    _address = [[NSMutableArray alloc] init];
    for (int i = 0; i < [addressArray count]; i++)
    {
        FHIRAddress *tempAD = [[FHIRAddress alloc] init];
        [tempAD addressParser:[addressArray objectAtIndex:i]];
        [_address addObject:tempAD];
    }
    
    //_telecom
    NSArray *teleArray = [[NSArray alloc] initWithArray:[organizationDict objectForKey:@"telecom"]];
    _telecom = [[NSMutableArray alloc] init];
    for (int i = 0; i < [teleArray count]; i++)
    {
        FHIRContact *tempCO = [[FHIRContact alloc] init];
        [tempCO contactParser:[teleArray objectAtIndex:i]];
        [_telecom addObject:tempCO];
    }
    
    [_partOf resourceReferenceParser:[dictionary objectForKey:@"partOf"]];
    
    //_contactEntity
    NSArray *contactEntityArray = [[NSArray alloc] initWithArray:[organizationDict objectForKey:@"contactEntity"]];
    _contactEntity = [[NSMutableArray alloc] init];
    for (int i = 0; i < [contactEntityArray count]; i++)
    {
        FHIRContactEntity *tempCE = [[FHIRContactEntity alloc] init];
        [tempCE contactEntityParser:[contactEntityArray objectAtIndex:i]];
        [_contactEntity addObject:tempCE];
    }
    
    //_accreditation
    NSArray *accreditationArray = [[NSArray alloc] initWithArray:[organizationDict objectForKey:@"accreditation"]];
    _accreditation = [[NSMutableArray alloc] init];
    for (int i = 0; i < [accreditationArray count]; i++)
    {
        FHIRAccreditation *tempAC = [[FHIRAccreditation alloc] init];
        [tempAC accreditationParser:[accreditationArray objectAtIndex:i]];
        [_accreditation addObject:tempAC];
    }
    
}

@end
