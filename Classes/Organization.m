//
//  Organization.m
//  FHIR
//
//  Created by Adam Sippel on 2013-05-28.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

#import "Organization.h"

@implementation Organization

@synthesize organizationDictionary = _organizationDictionary; //a dictionary containing all resources in this organization object
@synthesize identifier = _identifier; //THIS ARRAY IS FILLED WITH "Identifier" OBJECTS ONLY. A linked patient record is a record that concerns the same patient. Records are linked after it is realized that at least one was created in error.
@synthesize name = _name; //THIS ARRAY IS FILLED WITH "String" OBJECTS ONLY. An identifier that applies to this person as a patient
@synthesize type = _type; //the type of organization
@synthesize address = _address; //organization address details
@synthesize telecom = _telecom; //contact information of this organization
@synthesize active = _active; //active status of the organization
@synthesize partOf = _partOf; //holds resource type, text, name, and extensions
@synthesize genText = _genText;

- (id)init
{
    self = [super init];
    if (self) {
        _organizationDictionary = [[FHIRResourceDictionary alloc] init];
        _identifier = [[NSMutableArray alloc] init];
        _name = [[NSMutableArray alloc] init];
        _type = [[CodeableConcept alloc] init];
        _address = [[NSMutableArray alloc] init];
        _telecom = [[NSMutableArray alloc] init];
        _active = [[Bool alloc] init];
        _partOf = [[Resource alloc] init];
        _genText = [[Text alloc] init];
    }
    return self;
}

//override method
- (NSString *)getResourceType
{
    return [_partOf returnResourceType];
}

- (FHIRResourceDictionary *)generateAndReturnResourceDictionary
{
    _organizationDictionary.dataForResource = [NSDictionary dictionaryWithObjectsAndKeys:
                                          [_active generateAndReturnDictionary], @"active",
                                          [ExistanceChecker generateArray:_name], @"name",
                                          [_genText generateAndReturnDictionary], @"text", //holds extra generated text
                                          [ExistanceChecker generateArray:_telecom], @"telecom",
                                          [ExistanceChecker generateArray:_identifier], @"identifier",
                                          [_type generateAndReturnDictionary], @"type",
                                          [ExistanceChecker generateArray:_address], @"address",
                                          [_partOf generateAndReturnDictionary], @"partOf",
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
    [_partOf setResouceTypeValue:@"organization"];
    NSDictionary *organizationDict = [dictionary objectForKey:@"Organization"];
    //NSLog(@"%@", patient);
    
    [_active setValueBool:[organizationDict objectForKey:@"active"]];
    
    //_identifier
    NSArray *identifierArray = [[NSArray alloc] initWithArray:[organizationDict objectForKey:@"identifier"]];
    _identifier = [[NSMutableArray alloc] init];
    for (int i = 0; i < [identifierArray count]; i++)
    {
        Identifier *tempID = [[Identifier alloc] init];
        [tempID identifierParser:[identifierArray objectAtIndex:i]];
        [_identifier addObject:tempID];
    }
    
    //_name
    NSArray *nameArray = [[NSArray alloc] initWithArray:[organizationDict objectForKey:@"name"]];
    _name = [[NSMutableArray alloc] init];
    for (int i = 0; i < [nameArray count]; i++)
    {
        String *tempNA = [[String alloc] init];
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
        Address *tempAD = [[Address alloc] init];
        [tempAD addressParser:[addressArray objectAtIndex:i]];
        [_address addObject:tempAD];
    }
    
    //_telecom
    NSArray *teleArray = [[NSArray alloc] initWithArray:[organizationDict objectForKey:@"telecom"]];
    _telecom = [[NSMutableArray alloc] init];
    for (int i = 0; i < [teleArray count]; i++)
    {
        Contact *tempCO = [[Contact alloc] init];
        [tempCO contactParser:[teleArray objectAtIndex:i]];
        [_telecom addObject:tempCO];
    }
    
    [_partOf resourceParser:[dictionary objectForKey:@"partOf"]];
    
}

@end
