//
//  Demographics.m
//  FHIR
//
//  Created by Adam Sippel on 2013-01-31.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

#import "Demographics.h"

@implementation Demographics

@synthesize demographicsDictionary = _demographicsDictionary;

@synthesize name = _name; //A name associated with the individual.
@synthesize telecom = _telecom; //A contact detail (e.g. a telephone number or an email address) by which the individual may be contacted.
@synthesize gender = _gender; //Administrative Gender - the gender that the patient is considered to have for administration / record keeping purposes
@synthesize birthDate = _birthDate; //The birth date for the individual, to the degre of precision now
@synthesize deceased = _deceased; //Indicates if the individual is deceased or not
@synthesize address = _address; //One or more addresses for the individual
@synthesize maritalStatus = _maritalStatus; //This field contains a patient's marital (civil) status.
@synthesize language = _language; //A language spoken by the person, with proficiency

- (id)init
{
    self = [super init];
    if (self) {
        _demographicsDictionary = [[FHIRResourceDictionary alloc] init];
        _name = [[NSMutableArray alloc] init];
        _telecom = [[NSMutableArray alloc] init];
        _gender = [[Coding alloc] init];
        _deceased = [[Bool alloc] init];
        _address = [[NSMutableArray alloc] init];
        _maritalStatus = [[CodeableConcept alloc] init];
        _language = [[NSMutableArray alloc] init];
    }
    return self;
}

- (NSDictionary *)generateAndReturnDemographicsDictionary
{
    _demographicsDictionary.dataForResource = [NSDictionary dictionaryWithObjectsAndKeys:
                                               _name, @"name", //humannames only
                                               _telecom, @"telecom", //contacts only
                                               [_gender generateAndReturnCodingDictionary], @"gender",
                                               [NSDateFormatter localizedStringFromDate:_birthDate dateStyle:NSDateFormatterShortStyle timeStyle:NSDateFormatterFullStyle], @"birthDate",
                                               [_deceased generateAndReturnDictionary], @"deceased",
                                               _address, @"address", //addresses only
                                               [_maritalStatus generateAndReturnCodeableConceptDictionary], @"maritalStatus",
                                               _language, @"language", //languages only
                                               nil];
    _demographicsDictionary.resourceName = @"Demographics";
    return _demographicsDictionary.dataForResource;
}

- (void)demographicsParser:(NSDictionary *)dictionary
{
    //_name
    NSArray *nameArray = [[NSArray alloc] initWithArray:[dictionary objectForKey:@"name"]];
    _name = [[NSMutableArray alloc] init];
    for (int i = 0; i < [nameArray count]; i++)
    {
        HumanName *tempHN = [[HumanName alloc] init];
        [tempHN humanNameParser:[nameArray objectAtIndex:i]];
        [_name addObject:tempHN];
        NSLog(@"%@", _name);
    }
    
    //_telecom
    NSArray *teleArray = [[NSArray alloc] initWithArray:[dictionary objectForKey:@"telecom"]];
    _telecom = [[NSMutableArray alloc] init];
    for (int i = 0; i < [teleArray count]; i++)
    {
        Contact *tempCT = [[Contact alloc] init];
        [tempCT contactParser:[teleArray objectAtIndex:i]];
        [_telecom addObject:tempCT];
        NSLog(@"%@", _telecom);
    }
    
    [_gender codingParser:[dictionary objectForKey:@"gender"]];
    _birthDate = [dictionary objectForKey:@"birthDate"]; //may need to be converted from string to NSDate
    [_deceased setValueBool:[dictionary objectForKey:@"deceased"]];
    
    //_address
    NSArray *addrArray = [[NSArray alloc] initWithArray:[dictionary objectForKey:@"address"]];
    _address = [[NSMutableArray alloc] init];
    for (int i = 0; i < [addrArray count]; i++)
    {
        Address *tempAD = [[Address alloc] init];
        [tempAD addressParser:[addrArray objectAtIndex:i]];
        [_address addObject:tempAD];
        NSLog(@"%@", _address);
    }
    
    [_maritalStatus codeableConceptParser:[dictionary objectForKey:@"maritalStatus"]];
    
    //_languages
    NSArray *langArray = [[NSArray alloc] initWithArray:[dictionary objectForKey:@"language"]];
    _language = [[NSMutableArray alloc] init];
    for (int i = 0; i < [langArray count]; i++)
    {
        Language *tempLA = [[Language alloc] init];
        [tempLA languageParser:[langArray objectAtIndex:i]];
        [_language addObject:tempLA];
        NSLog(@"%@", _language);
    }
}

@end
