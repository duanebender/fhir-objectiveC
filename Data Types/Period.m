//
//  Period.m
//  FHIR
//
//  Created by Adam Sippel on 2013-01-31.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

#import "Period.h"
#import "ExistanceChecker.h"

@implementation Period

@synthesize start = _start; //The start of the period. The boundary is inclusive.
@synthesize end = _end; //The end of the period. If the high is missing, it means that the period is ongoing

- (NSDictionary *)generateAndReturnDictionary
{
    NSDictionary *startDictionary = [[NSDictionary alloc] initWithObjectsAndKeys:[NSDateFormatter localizedStringFromDate:_start dateStyle:NSDateFormatterShortStyle timeStyle:NSDateFormatterFullStyle], @"value", nil];
    NSDictionary *endDictionary = [[NSDictionary alloc] initWithObjectsAndKeys:[NSDateFormatter localizedStringFromDate:_end dateStyle:NSDateFormatterShortStyle timeStyle:NSDateFormatterFullStyle], @"value", nil];
    NSMutableDictionary *periodDictionary = [[NSMutableDictionary alloc] init];/*WithObjectsAndKeys:
                                      startDictionary, @"start",
                                      endDictionary, @"end",
                                      nil];*/
    if ([startDictionary objectForKey:@"value"])
    {
        [periodDictionary addEntriesFromDictionary:startDictionary];
    }
    
    if ([endDictionary objectForKey:@"value"])
    {
        [periodDictionary addEntriesFromDictionary:endDictionary];
    }
    
    if ([periodDictionary count] == 0)
    {
        return NULL;
    }
    else
    {
        return periodDictionary;
    }
}

- (void)periodParser:(NSDictionary *)dictionary
{
    NSDictionary *startDict = [dictionary objectForKey:@"start"];
    _start = [ExistanceChecker generateDateTimeFromString:[startDict objectForKey:@"value"]];
    
    NSDictionary *endDict = [dictionary objectForKey:@"end"];
    _end = [ExistanceChecker generateDateTimeFromString:[endDict objectForKey:@"value"]];
}

@end
