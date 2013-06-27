//
//  AdverseReaction.m
//  FHIR
//
//  Created by Adam Sippel on 2013-05-29.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

#import "FHIRAdverseReaction.h"

@implementation FHIRAdverseReaction

@synthesize adverseReactionDictionary = _adverseReactionDictionary; //a dictionary containing all resources in this adverse reaction object
@synthesize resourceTypeValue = _resourceTypeValue;
@synthesize reactionDate = _reactionDate; //contains the initial date of the reaction
@synthesize subject = _subject; //The subject that the sensitivity is about.
@synthesize didNotOccurFlag = _didNotOccurFlag; //
@synthesize recorder = _recorder; //The person who recorded this reaction.
@synthesize symptom = _symptom; //THIS ARRAY IS FILLED WITH "Symptom" OBJECTS ONLY. Symptoms related to the reaction
@synthesize exposure = _exposure; //THIS ARRAY IS FILLED WITH "Exposure" OBJECTS ONLY. Substance and exposure time to cause this reaction

- (id)init
{
    self = [super init];
    if (self) {
        _adverseReactionDictionary = [[FHIRResourceDictionary alloc] init];
        _reactionDate = [[NSDate alloc] init];
        _subject = [[FHIRResourceReference alloc] init];
        _didNotOccurFlag = [[FHIRBool alloc] init];
        _recorder = [[FHIRResourceReference alloc] init];
        _symptom = [[NSMutableArray alloc] init];
        _exposure = [[NSMutableArray alloc] init];
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
    _adverseReactionDictionary.dataForResource = [NSDictionary dictionaryWithObjectsAndKeys:
                                               [NSDateFormatter localizedStringFromDate:_reactionDate dateStyle:NSDateFormatterShortStyle timeStyle:NSDateFormatterFullStyle], @"reactionDate",
                                               [_subject generateAndReturnDictionary], @"subject",
                                               [_didNotOccurFlag generateAndReturnDictionary], @"didNotOccurFlag",
                                               [_recorder generateAndReturnDictionary], @"recorder",
                                               [FHIRExistanceChecker generateArray:_symptom], @"symptom",
                                               [FHIRExistanceChecker generateArray:_exposure], @"exposure",
                                               [_resourceTypeValue.text generateAndReturnDictionary], @"text",
                                               [FHIRExistanceChecker generateArray:_resourceTypeValue.extensions], @"extension",
                                               [FHIRExistanceChecker generateArray:_resourceTypeValue.contained], @"contained",
                                               nil];
    [_adverseReactionDictionary cleanUpDictionaryValues];
    
    FHIRResourceDictionary *returnable = [[FHIRResourceDictionary alloc] init];
    returnable.dataForResource = [NSDictionary dictionaryWithObjectsAndKeys:_adverseReactionDictionary.dataForResource, @"AdverseReaction", nil];
    returnable.resourceName = @"adverseReaction";
    [returnable cleanUpDictionaryValues];
    return returnable;
}

- (void)adverseReactionParser:(NSDictionary *)dictionary
{
    [_resourceTypeValue setResouceTypeValue:@"adverseReaction"];
    NSDictionary *adReactionDict = [dictionary objectForKey:@"AdverseReaction"];
    //NSLog(@"%@", adReactionDict);
    
    [_resourceTypeValue resourceParser:adReactionDict];
    
    _reactionDate = [FHIRExistanceChecker generateDateTimeFromString:[adReactionDict objectForKey:@"reactionDate"]];
    [_subject resourceReferenceParser:[adReactionDict objectForKey:@"subject"]];
    [_didNotOccurFlag setValueBool:[adReactionDict objectForKey:@"didNotOccurFlag"]];
    [_recorder resourceReferenceParser:[adReactionDict objectForKey:@"recorder"]];
    
    //_symptom
    NSArray *symptomArray = [[NSArray alloc] initWithArray:[adReactionDict objectForKey:@"symptom"]];
    _symptom = [[NSMutableArray alloc] init];
    for (int i = 0; i < [symptomArray count]; i++)
    {
        FHIRSymptom *tempSY = [[FHIRSymptom alloc] init];
        [tempSY symptomParser:[symptomArray objectAtIndex:i]];
        [_symptom addObject:tempSY];
    }
    
    //_exposure
    NSArray *exposureArray = [[NSArray alloc] initWithArray:[adReactionDict objectForKey:@"exposure"]];
    _exposure = [[NSMutableArray alloc] init];
    for (int i = 0; i < [exposureArray count]; i++)
    {
        FHIRExposure *tempEX = [[FHIRExposure alloc] init];
        [tempEX exposureParser:[exposureArray objectAtIndex:i]];
        [_exposure addObject:tempEX];
    }
    
}

@end
