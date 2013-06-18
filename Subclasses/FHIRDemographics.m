//
//  Demographics.m
//  FHIR
//
//  Created by Adam Sippel on 2013-01-31.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

#import "FHIRDemographics.h"

@implementation FHIRDemographics

@synthesize demographicsDictionary = _demographicsDictionary;

@synthesize name = _name; //A name associated with the individual.
@synthesize telecom = _telecom; //A contact detail (e.g. a telephone number or an email address) by which the individual may be contacted.
@synthesize gender = _gender; //Administrative Gender - the gender that the patient is considered to have for administration / record keeping purposes
@synthesize birthDate = _birthDate; //The birth date for the individual, to the degre of precision now
@synthesize deceased = _deceased; //Indicates if the individual is deceased or not
@synthesize address = _address; //One or more addresses for the individual
@synthesize maritalStatus = _maritalStatus; //This field contains a patient's marital (civil) status.
@synthesize language = _language; //A language spoken by the person, with proficiency
@synthesize photo = _photo;
@synthesize identifier = _identifier;

- (id)init
{
    self = [super init];
    if (self) {
        _demographicsDictionary = [[FHIRResourceDictionary alloc] init];
        _name = [[NSMutableArray alloc] init];
        _telecom = [[NSMutableArray alloc] init];
        _gender = [[FHIRCoding alloc] init];
        _deceased = [[FHIRBool alloc] init];
        _address = [[NSMutableArray alloc] init];
        _maritalStatus = [[FHIRCodeableConcept alloc] init];
        _language = [[NSMutableArray alloc] init];
        _birthDate = [[NSDate alloc] init];
        _photo = [[NSMutableArray alloc] init];
        _identifier = [[NSMutableArray alloc] init];
        
    }
    return self;
}

- (NSDictionary *)generateAndReturnDictionary
{
    _demographicsDictionary.dataForResource = [NSDictionary dictionaryWithObjectsAndKeys:
                                               [FHIRExistanceChecker generateArray:_name], @"name", //humannames only
                                               [_gender generateAndReturnDictionary], @"gender",
                                               [FHIRExistanceChecker generateArray:_telecom], @"telecom", //contacts only
                                               [FHIRExistanceChecker generateArray:_address], @"address", //addresses only
                                               [NSDateFormatter localizedStringFromDate:_birthDate dateStyle:NSDateFormatterShortStyle timeStyle:NSDateFormatterFullStyle], @"birthDate",
                                               [_deceased generateAndReturnDictionary], @"deceased",
                                               [_maritalStatus generateAndReturnDictionary], @"maritalStatus",
                                               [FHIRExistanceChecker generateArray:_language], @"language", //languages only
                                               [FHIRExistanceChecker generateArray:_photo], @"photo", //RR(Photo) only
                                               [FHIRExistanceChecker generateArray:_identifier], @"identifier", //identifier only
                                               nil];
    _demographicsDictionary.resourceName = @"Demographics";
    [_demographicsDictionary cleanUpDictionaryValues];
    return _demographicsDictionary.dataForResource;
}

- (void)demographicsParser:(NSDictionary *)dictionary
{
    //_name
    NSArray *nameArray = [[NSArray alloc] initWithArray:[dictionary objectForKey:@"name"]];
    _name = [[NSMutableArray alloc] init];
    for (int i = 0; i < [nameArray count]; i++)
    {
        FHIRHumanName *tempHN = [[FHIRHumanName alloc] init];
        [tempHN humanNameParser:[nameArray objectAtIndex:i]];
        [_name addObject:tempHN];
        //NSLog(@"%@", _name);
    }
    
    //_telecom
    NSArray *teleArray = [[NSArray alloc] initWithArray:[dictionary objectForKey:@"telecom"]];
    _telecom = [[NSMutableArray alloc] init];
    for (int i = 0; i < [teleArray count]; i++)
    {
        FHIRContact *tempCT = [[FHIRContact alloc] init];
        [tempCT contactParser:[teleArray objectAtIndex:i]];
        [_telecom addObject:tempCT];
        //NSLog(@"%@", _telecom);
    }
    
    [_gender codingParser:[dictionary objectForKey:@"gender"]];
    _birthDate = [FHIRExistanceChecker generateDateTimeFromString:[dictionary objectForKey:@"birthDate"]];
    [_deceased setValueBool:[dictionary objectForKey:@"deceased"]];
    
    //_address
    NSArray *addrArray = [[NSArray alloc] initWithArray:[dictionary objectForKey:@"address"]];
    _address = [[NSMutableArray alloc] init];
    for (int i = 0; i < [addrArray count]; i++)
    {
        FHIRAddress *tempAD = [[FHIRAddress alloc] init];
        [tempAD addressParser:[addrArray objectAtIndex:i]];
        [_address addObject:tempAD];
        //NSLog(@"%@", _address);
    }
    
    [_maritalStatus codeableConceptParser:[dictionary objectForKey:@"maritalStatus"]];
    
    //_languages
    NSArray *langArray = [[NSArray alloc] initWithArray:[dictionary objectForKey:@"language"]];
    _language = [[NSMutableArray alloc] init];
    for (int i = 0; i < [langArray count]; i++)
    {
        FHIRLanguage *tempLA = [[FHIRLanguage alloc] init];
        [tempLA languageParser:[langArray objectAtIndex:i]];
        [_language addObject:tempLA];
        //NSLog(@"%@", _language);
    }
    
    //_photo
    NSArray *photoArray = [[NSArray alloc] initWithArray:[dictionary objectForKey:@"photo"]];
    _photo = [[NSMutableArray alloc] init];
    for (int i = 0; i < [photoArray count]; i++)
    {
        FHIRResourceReference *tempRR = [[FHIRResourceReference alloc] init];
        [tempRR resourceReferenceParser:[photoArray objectAtIndex:i]];
        [_photo addObject:tempRR];
        //NSLog(@"%@", _photo);
    }
    
    //_identifier
    NSArray *identifierArray = [[NSArray alloc] initWithArray:[dictionary objectForKey:@"identifier"]];
    _identifier = [[NSMutableArray alloc] init];
    for (int i = 0; i < [identifierArray count]; i++)
    {
        FHIRIdentifier *tempID = [[FHIRIdentifier alloc] init];
        [tempID identifierParser:[identifierArray objectAtIndex:i]];
        [_identifier addObject:tempID];
        //NSLog(@"%@", _identifier);
    }
}

@end
