//
//  AllergyIntolerance.m
//  FHIR
//
//  Created by Adam Sippel on 2013-05-30.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

/**
 * Allergy/Intolerance resources are used to provide information about adverse sensitivities to substances that lead to physiologic changes that are clinically observable.
 */

#import "FHIRAllergyIntolerance.h"

@implementation FHIRAllergyIntolerance

@synthesize allergyIntoleranceDictionary = _allergyIntoleranceDictionary; //a dictionary containing all resources in this alleryIntolerance object
@synthesize identifier = _identifier; //An external identifier for the sensitivity
@synthesize criticality = _criticality; //Criticality of the sensitivity
@synthesize sensitivityType = _sensitivityType; //Type of the sensitivity
@synthesize recordedDate = _recordedDate; //Date when the sensitivity was recorded
@synthesize status = _status; //Suspected, Confirmed, Refuted, Resolved
@synthesize subject = _subject; //Who the sensitivity is for (Patient)
@synthesize recorder = _recorder; //Who recorded the sensitivity (Practitioner/Patient)
@synthesize substance = _substance; //The substance that causes the sensitivity (Substance)
@synthesize reactions = _reactions; //THIS ARRAY CONTAINS "Resource(AdverseReaction)" OBJECTS ONLY. Reactions associated with the sensitivity.
@synthesize sensitivityTest = _sensitivityTest; //THIS ARRAY CONTAINS "Resource(Observation)" OBJECTS ONLY. Observations that confirm or refute the sensitivity.

- (id)init
{
    self = [super init];
    if (self) {
        _allergyIntoleranceDictionary = [[FHIRResourceDictionary alloc] init];
        _identifier = [[FHIRIdentifier alloc] init];
        _criticality = [[FHIRCode alloc] init];
        _sensitivityType = [[FHIRCode alloc] init];
        _recordedDate = [[NSDate alloc] init];
        _status = [[FHIRCode alloc] init];
        _subject = [[FHIRResource alloc] init];
        _recorder = [[FHIRResource alloc] init];
        _substance = [[FHIRResource alloc] init];
        _reactions = [[NSMutableArray alloc] init];
        _sensitivityTest = [[NSMutableArray alloc] init];
    }
    return self;
}

//override method
- (NSString *)getResourceType
{
    return @"allergyIntolerance";
}

- (FHIRResourceDictionary *)generateAndReturnResourceDictionary
{
    _allergyIntoleranceDictionary.dataForResource = [NSDictionary dictionaryWithObjectsAndKeys:
                                        [_identifier generateAndReturnDictionary], @"identifier",
                                        [_criticality generateAndReturnDictionary], @"criticality",
                                        [_sensitivityType generateAndReturnDictionary], @"sensitivityType",
                                        [NSDateFormatter localizedStringFromDate:_recordedDate dateStyle:NSDateFormatterShortStyle timeStyle:NSDateFormatterFullStyle], @"recordedDate",
                                        [_status generateAndReturnDictionary], @"status",
                                        [_subject generateAndReturnDictionary], @"subject",
                                        [_recorder generateAndReturnDictionary], @"recorder",
                                        [_substance generateAndReturnDictionary], @"substance",
                                        [FHIRExistanceChecker generateArray:_reactions], @"reactions",
                                        [FHIRExistanceChecker generateArray:_sensitivityTest], @"sensitivityTest",
                                        nil];
    [_allergyIntoleranceDictionary cleanUpDictionaryValues];
    
    FHIRResourceDictionary *returnable = [[FHIRResourceDictionary alloc] init];
    returnable.dataForResource = [NSDictionary dictionaryWithObjectsAndKeys:_allergyIntoleranceDictionary.dataForResource, @"AllergyIntolerance", nil];
    returnable.resourceName = @"allergyIntolerance";
    [returnable cleanUpDictionaryValues];
    return returnable;
}

- (void)allergyIntolleranceParser:(NSDictionary *)dictionary
{
    NSDictionary *alIntolDict = [dictionary objectForKey:@"AllergyIntollerance"];
    //NSLog(@"%@", alIntolDict);
    
    [_identifier identifierParser:[alIntolDict objectForKey:@"identifier"]];
    [_criticality setValueCode:[alIntolDict objectForKey:@"criticality"]];
    [_sensitivityType setValueCode:[alIntolDict objectForKey:@"sensitivityType"]];
    _recordedDate = [FHIRExistanceChecker generateDateTimeFromString:[alIntolDict objectForKey:@"recordedDate"]];
    [_status setValueCode:[alIntolDict objectForKey:@"status"]];
    [_subject resourceParser:[alIntolDict objectForKey:@"subject"]];
    [_recorder resourceParser:[alIntolDict objectForKey:@"recorder"]];
    [_substance resourceParser:[alIntolDict objectForKey:@"substance"]];
    
    //_reactions
    NSArray *reactionArray = [[NSArray alloc] initWithArray:[alIntolDict objectForKey:@"reactions"]];
    _reactions = [[NSMutableArray alloc] init];
    for (int i = 0; i < [reactionArray count]; i++)
    {
        FHIRResource *tempRE = [[FHIRResource alloc] init];
        [tempRE resourceParser:[reactionArray objectAtIndex:i]];
        [_reactions addObject:tempRE];
    }
    
    //_sensitivityTest
    NSArray *senTestArray = [[NSArray alloc] initWithArray:[alIntolDict objectForKey:@"sensitivityTest"]];
    _sensitivityTest = [[NSMutableArray alloc] init];
    for (int i = 0; i < [senTestArray count]; i++)
    {
        FHIRResource *tempST = [[FHIRResource alloc] init];
        [tempST resourceParser:[senTestArray objectAtIndex:i]];
        [_sensitivityTest addObject:tempST];
    }
    
}

@end
