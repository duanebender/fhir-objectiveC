//
//  Schedule.m
//  FHIR
//
//  Created by Adam Sippel on 2013-06-03.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

#import "FHIRSchedule.h"

@implementation FHIRSchedule

@synthesize scheduleDictionary = _scheduleDictionary; //resources for schedule name
@synthesize event = _event; //THIS ARRAY CONATINS "Period" OBJECTS ONLY. When the event occurs.
@synthesize repeat = _repeat; //will contain all objects below, only if there is one or no event.
@synthesize frequency = _frequency; //Event occurs frequency times per duration.
@synthesize when = _when; //Event occurs duration from common life event.
@synthesize duration = _duration; //Repeating or event-related duration.
@synthesize units = _units; //The units of time for the duration.
@synthesize count = _count; //Number of times to repeat.
@synthesize end = _end; //When to stop repeats.

- (id)init
{
    self = [super init];
    if (self) {
        _scheduleDictionary = [[FHIRResourceDictionary alloc] init];
        _event = [[NSMutableArray alloc] init];
        _repeat = [[FHIRResourceDictionary alloc] init];
        _frequency = [[NSNumber alloc] init];
        _when = [[FHIRCode alloc] init];
        _duration = [[NSNumber alloc] init];
        _units = [[FHIRCode alloc] init];
        _count = [[NSNumber alloc] init];
        _end = [[NSDate alloc] init];
    }
    return self;
}

- (void)generateRepeatDictionary //sets repeat values
{
    _repeat.dataForResource = [NSDictionary dictionaryWithObjectsAndKeys:
               _frequency, @"frequency",
               [_when generateAndReturnDictionary], @"when",
               _duration, @"duration",
               [_units generateAndReturnDictionary], @"units",
               _count, @"count",
               [NSDateFormatter localizedStringFromDate:_end dateStyle:NSDateFormatterShortStyle timeStyle:NSDateFormatterFullStyle], @"end",
               nil];
    [_repeat cleanUpDictionaryValues];
    
}

- (NSDictionary *)generateAndReturnDictionary
{
    [self generateRepeatDictionary];
    _scheduleDictionary.dataForResource = [NSDictionary dictionaryWithObjectsAndKeys:
                                          [FHIRExistanceChecker generateArray:_event], @"event",
                                          _repeat.dataForResource, @"repeat",
                                          nil];
    _scheduleDictionary.resourceName = @"Schedule";
    [_scheduleDictionary cleanUpDictionaryValues];
    return _scheduleDictionary.dataForResource;
}

- (void)scheduleParser:(NSDictionary *)dictionary
{
    _event = [dictionary objectForKey:@"event"];
    _repeat.dataForResource = [dictionary objectForKey:@"repeat"];
    
    //set up repeat values
    _frequency = [NSNumber numberWithInteger:[[_repeat.dataForResource objectForKey:@"frequency"] intValue]];
    [_when setValueCode:[_repeat.dataForResource objectForKey:@"when"]];
    _duration = [NSNumber numberWithDouble:[[_repeat.dataForResource objectForKey:@"duration"] doubleValue]];
    [_units setValueCode:[_repeat.dataForResource objectForKey:@"units"]];
    _count = [NSNumber numberWithInteger:[[_repeat.dataForResource objectForKey:@"count"] intValue]];
    _end = [FHIRExistanceChecker generateDateTimeFromString:[_repeat.dataForResource objectForKey:@"end"]];
}


@end
