//
//  AdverseReaction.m
//  FHIR
//
//  Created by Adam Sippel on 2013-05-29.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

#import "AdverseReaction.h"

@implementation AdverseReaction

@synthesize adverseReactionDictionary = _adverseReactionDictionary; //a dictionary containing all resources in this adverse reaction object
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
        _subject = [[Resource alloc] init];
        _didNotOccurFlag = [[Bool alloc] init];
        _recorder = [[Resource alloc] init];
        _symptom = [[NSMutableArray alloc] init];
        _exposure = [[NSMutableArray alloc] init];
    }
    return self;
}

//override method
- (NSString *)getResourceType
{
    return @"adverseReaction";
}

- (FHIRResourceDictionary *)generateAndReturnResourceDictionary
{
    _adverseReactionDictionary.dataForResource = [NSDictionary dictionaryWithObjectsAndKeys:
                                               [NSDateFormatter localizedStringFromDate:_reactionDate dateStyle:NSDateFormatterShortStyle timeStyle:NSDateFormatterFullStyle], @"reactionDate",
                                               [_subject generateAndReturnDictionary], @"subject",
                                               [_didNotOccurFlag generateAndReturnDictionary], @"didNotOccurFlag",
                                               [_recorder generateAndReturnDictionary], @"recorder",
                                               [ExistanceChecker generateArray:_symptom], @"symptom",
                                               [ExistanceChecker generateArray:_exposure], @"exposure",
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
    NSDictionary *adReactionDict = [dictionary objectForKey:@"AdverseReaction"];
    //NSLog(@"%@", adReactionDict);
    
    _reactionDate = [ExistanceChecker generateDateTimeFromString:[adReactionDict objectForKey:@"reactionDate"]];
    [_subject resourceParser:[adReactionDict objectForKey:@"subject"]];
    [_didNotOccurFlag setValueBool:[adReactionDict objectForKey:@"didNotOccurFlag"]];
    [_recorder resourceParser:[adReactionDict objectForKey:@"recorder"]];
    
    //_symptom
    NSArray *symptomArray = [[NSArray alloc] initWithArray:[adReactionDict objectForKey:@"symptom"]];
    _symptom = [[NSMutableArray alloc] init];
    for (int i = 0; i < [symptomArray count]; i++)
    {
        Symptom *tempSY = [[Symptom alloc] init];
        [tempSY symptomParser:[symptomArray objectAtIndex:i]];
        [_symptom addObject:tempSY];
    }
    
    //_exposure
    NSArray *exposureArray = [[NSArray alloc] initWithArray:[adReactionDict objectForKey:@"exposure"]];
    _exposure = [[NSMutableArray alloc] init];
    for (int i = 0; i < [exposureArray count]; i++)
    {
        Exposure *tempEX = [[Exposure alloc] init];
        [tempEX exposureParser:[exposureArray objectAtIndex:i]];
        [_exposure addObject:tempEX];
    }
    
}

@end
