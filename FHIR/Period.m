//
//  Period.m
//  FHIR
//
//  Created by Adam Sippel on 2013-01-31.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

#import "Period.h"

@implementation Period

@synthesize start = _start; //The start of the period. The boundary is inclusive.
@synthesize end = _end; //The end of the period. If the high is missing, it means that the period is ongoing

- (NSDictionary *)generateAndReturnDictionary
{
    NSDictionary *startDictionary = [[NSDictionary alloc] initWithObjectsAndKeys:[NSDateFormatter localizedStringFromDate:_start dateStyle:NSDateFormatterShortStyle timeStyle:NSDateFormatterFullStyle], @"value", nil];
    NSDictionary *endDictionary = [[NSDictionary alloc] initWithObjectsAndKeys:[NSDateFormatter localizedStringFromDate:_end dateStyle:NSDateFormatterShortStyle timeStyle:NSDateFormatterFullStyle], @"value", nil];
    NSDictionary *periodDictionary = [[NSDictionary alloc] initWithObjectsAndKeys:
                                      startDictionary, @"start",
                                      endDictionary, @"end",
                                      nil];
    return periodDictionary;
}

- (void)periodParser:(NSDictionary *)dictionary
{
    NSDictionary *startDict = [dictionary objectForKey:@"start"];
    _start = [startDict objectForKey:@"value"]; //may need to be converted from string to date
    
    NSDictionary *endDict = [dictionary objectForKey:@"end"];
    _end = [endDict objectForKey:@"value"]; //may need to be converted from string to date
}

@end
