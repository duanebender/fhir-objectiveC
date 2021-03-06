//
//  Activity.m
//  FHIR
//
//  Created by Adam Sippel on 2013-06-03.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

#import "FHIRActivity.h"

@implementation FHIRActivity

@synthesize activityDictionary = _activityDictionary; //a dictionary containing all resources in this activity object
@synthesize category = _category; //High-level categorization of the type of activity in a care plan.
@synthesize code = _code; //Detailed description of the type of activity. E.g. What lab test, what procedure, what kind of visit.
@synthesize status = _status; //Identifies what progress is being made for the specific activity.
@synthesize prohibited = _prohibited; //If true, indicates that the described activity is one that must NOT be engaged in when following the plan.
@synthesize timingX = _timingX; //The period, timing or frequency upon which the described activity is to occur.(Schedule/Period/String object)
@synthesize location = _location; //Identifies the facility where the activity will occur. E.g. home, hospital, specific clinic, etc. (Locaton)
@synthesize performer = _performer; //THIS ARRAY CONATINS "Resource(Practitioner|Organization|Related|Person|Patient)" OBJECTS ONLY. Identifies who's expected to be involved in the activity.
@synthesize product = _product; //Identifies the food, drug or other product being consumed or supplied in the activity.
@synthesize dailyAmount = _dailyAmount; //Identifies the quantity expected to be consumed in a given day.
@synthesize quantity = _quantity; //Identifies the quantity expected to be supplied.
@synthesize details = _details; //This provides a textual description of constraints on the activity occurrence, including relation to other activities. It may also include objectives, pre-conditions and end-conditions. Finally, it may convey specifics about the activity such as body site, method, route, etc.
@synthesize actionTaken = _actionTaken; //THIS ARRAY CONTAINS "Resource(Any)" OBJECTS ONLY. Resources that describe follow-on actions resulting from the plan, such as drug prescriptions, visit records, appointments, etc.
@synthesize notes = _notes; //Notes about the execution of the activity.

- (id)init
{
    self = [super init];
    if (self) {
        _activityDictionary = [[FHIRResourceDictionary alloc] init];
        _category = [[FHIRCode alloc] init];
        _code = [[FHIRCodeableConcept alloc] init];
        _status = [[FHIRCode alloc] init];
        _prohibited = [[FHIRBool alloc] init];
        _timingX = [[NSMutableArray alloc] init];
        _location = [[FHIRResourceReference alloc] init];
        _performer = [[NSMutableArray alloc] init];
        _product = [[FHIRResourceReference alloc] init];
        _dailyAmount = [[FHIRQuantity alloc] init];
        _quantity = [[FHIRQuantity alloc] init];
        _details = [[FHIRString alloc] init];
        _actionTaken = [[NSMutableArray alloc] init];
        _notes = [[FHIRString alloc] init];
    }
    return self;
}

- (NSDictionary *)generateAndReturnDictionary
{
    //find timing type to set for xml tag
    NSString *timingTagString = [[NSString alloc] init];
    if ([_timingX count] == 1)
    {
        if ([[_timingX objectAtIndex:0] class] == [FHIRPeriod class]) timingTagString = [NSString stringWithFormat:@"timingPeriod"];
        else if ([[_timingX objectAtIndex:0] class] == [FHIRSchedule class]) timingTagString = [NSString stringWithFormat:@"timingSchedule"];
        else if ([[_timingX objectAtIndex:0] class] == [FHIRString class]) timingTagString = [NSString stringWithFormat:@"timingString"];
        else timingTagString = [NSString stringWithFormat:@"timing?"];
    }
    
    _activityDictionary.dataForResource = [NSDictionary dictionaryWithObjectsAndKeys:
                                               [_category generateAndReturnDictionary], @"category",
                                               [_code generateAndReturnDictionary], @"code",
                                               [_status generateAndReturnDictionary], @"status",
                                               [_prohibited generateAndReturnDictionary], @"prohibited",
                                               [FHIRExistanceChecker checkEmptySingleObjectArray:_timingX], timingTagString,
                                               [_location generateAndReturnDictionary], @"location",
                                               [FHIRExistanceChecker generateArray:_performer], @"performer",
                                               [_product generateAndReturnDictionary], @"product",
                                               [_dailyAmount generateAndReturnDictionary], @"dailyAmount",
                                               [_quantity generateAndReturnDictionary], @"quantity",
                                               [_details generateAndReturnDictionary], @"details",
                                               [FHIRExistanceChecker generateArray:_actionTaken], @"actionTaken",
                                               [_notes generateAndReturnDictionary], @"notes",
                                               nil];
    _activityDictionary.resourceName = @"Activity";
    [_activityDictionary cleanUpDictionaryValues];
    return _activityDictionary.dataForResource;
}

- (void)activityParser:(NSDictionary *)dictionary
{
    [_category setValueCode:[dictionary objectForKey:@"category"]];
    [_code codeableConceptParser:[dictionary objectForKey:@"code"]];
    [_status setValueCode:[dictionary objectForKey:@"status"]];
    [_prohibited setValueBool:[dictionary objectForKey:@"prohibited"]];
    [_category setValueCode:[dictionary objectForKey:@"category"]];
    
    //sets timing array with the correct object sent
    for (NSString *key in dictionary)
    {
        if ([key isEqualToString:@"timingPeriod"])
        {
            FHIRPeriod *timingPeriod = [[FHIRPeriod alloc] init];
            [timingPeriod periodParser:[dictionary objectForKey:@"timingPeriod"]];
            _timingX = [[NSArray alloc] initWithObjects:timingPeriod, nil];
        }
        if ([key isEqualToString:@"timingSchedule"])
        {
            FHIRSchedule *timingSchedule = [[FHIRSchedule alloc] init];
            [timingSchedule scheduleParser:[dictionary objectForKey:@"timingSchedule"]];
            _timingX = [[NSArray alloc] initWithObjects:timingSchedule, nil];
        }
        if ([key isEqualToString:@"timingString"])
        {
            FHIRString *timingString = [[FHIRString alloc] init];
            [timingString setValueString:[dictionary objectForKey:@"timingString"]];
            _timingX = [[NSArray alloc] initWithObjects:timingString, nil];
        }
    }
    
    [_location resourceReferenceParser:[dictionary objectForKey:@"location"]];
    
    //_performer
    NSArray *performerArray = [[NSArray alloc] initWithArray:[dictionary objectForKey:@"performer"]];
    _performer = [[NSMutableArray alloc] init];
    for (int i = 0; i < [performerArray count]; i++)
    {
        FHIRResourceReference *tempPR = [[FHIRResourceReference alloc] init];
        [tempPR resourceReferenceParser:[performerArray objectAtIndex:i]];
        [_performer addObject:tempPR];
        //NSLog(@"%@", _performer);
    }
    
    [_product resourceReferenceParser:[dictionary objectForKey:@"product"]];
    [_dailyAmount quantityParser:[dictionary objectForKey:@"dailyAmount"]];
    [_quantity quantityParser:[dictionary objectForKey:@"quantity"]];
    [_details setValueString:[dictionary objectForKey:@"details"]];
    
    //_actionsTaken
    NSArray *actionTakenArray = [[NSArray alloc] initWithArray:[dictionary objectForKey:@"actionTaken"]];
    _actionTaken = [[NSMutableArray alloc] init];
    for (int i = 0; i < [actionTakenArray count]; i++)
    {
        FHIRResourceReference *tempAT = [[FHIRResourceReference alloc] init];
        [tempAT resourceReferenceParser:[actionTakenArray objectAtIndex:i]];
        [_actionTaken addObject:tempAT];
        //NSLog(@"%@", _actionTaken);
    }
    
    [_notes setValueString:[dictionary objectForKey:@"notes"]];
    
}

@end
