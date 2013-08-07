//
//  Schedule.h
//  FHIR
//
//  Created by Adam Sippel on 2013-06-03.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

/**
 * A schedule that specifies an event that may occur multiple times. Schedules are not used for recording when things did happen, but when they are expected or requested to occur. A schedule can be either a list of events - periods on which the event occurs, or a single event with repeating criteria, or just repeating criteria with no actual event.
 */

#import <Foundation/Foundation.h>
#import "FHIRExistanceChecker.h"

@interface FHIRSchedule : FHIRType

@property (nonatomic, retain) FHIRResourceDictionary *scheduleDictionary; //resources for schedule name

//following properties are individual parts of the Schedule Object that can be influenced Individually
@property (nonatomic, retain) NSMutableArray *event; //THIS ARRAY CONATINS "Period" OBJECTS ONLY. When the event occurs.
@property (nonatomic, retain) FHIRResourceDictionary *repeat; //will contain all objects below, only if there is one or no event.
@property (nonatomic, retain) NSNumber *frequency; //Event occurs frequency times per duration.
@property (nonatomic, retain) FHIRCode *when; //Event occurs duration from common life event.
@property (nonatomic, retain) NSNumber *duration; //Repeating or event-related duration.
@property (nonatomic, retain) FHIRCode *units; //The units of time for the duration.
@property (nonatomic, retain) NSNumber *count; //Number of times to repeat.
@property (nonatomic, retain) NSDate *end; //When to stop repeats.

//Public Methods
- (NSDictionary *)generateAndReturnDictionary; //returns an NSDictionary containing all of the elements of this Schedule Object
- (void)scheduleParser:(NSDictionary *)dictionary; //set this Schedule Object from an NSDictionary

@end
