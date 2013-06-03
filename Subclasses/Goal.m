//
//  Goal.m
//  FHIR
//
//  Created by Adam Sippel on 2013-06-03.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

#import "Goal.h"

@implementation Goal

@synthesize goalDictionary = _goalDictionary; //holds all goal resources
@synthesize description = _description; //Human readable description of a specific desired objective of the care plan.
@synthesize status = _status; //Indicates whether the goal has been reached and is still considered relevant.
@synthesize notes = _notes; //Any comments related to the goal.

- (id)init
{
    self = [super init];
    if (self) {
        _goalDictionary = [[FHIRResourceDictionary alloc] init];
        _description = [[String alloc] init];
        _status = [[Code alloc] init];
        _notes = [[String alloc] init];
    }
    return self;
}

- (NSDictionary *)generateAndReturnDictionary
{
    _goalDictionary.dataForResource = [NSDictionary dictionaryWithObjectsAndKeys:
                                              [_description generateAndReturnDictionary], @"description",
                                              [_status generateAndReturnDictionary], @"status",
                                              [_notes generateAndReturnDictionary], @"notes",
                                              nil];
    _goalDictionary.resourceName = @"Goal";
    [_goalDictionary cleanUpDictionaryValues];
    return _goalDictionary.dataForResource;
}

- (void)goalParser:(NSDictionary *)dictionary
{
    [_description setValueString:[dictionary objectForKey:@"description"]];
    [_status setValueCode:[dictionary objectForKey:@"status"]];
    [_notes setValueString:[dictionary objectForKey:@"notes"]];
}

@end
