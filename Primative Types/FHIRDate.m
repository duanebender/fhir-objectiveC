//
//  FHIRDate.m
//  FHIR
//
//  Created by Adam Sippel on 2013-06-24.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

#import "FHIRDate.h"

@implementation FHIRDate

@synthesize value = _value;

- (NSDictionary *)generateAndReturnDictionary
{
    NSDateFormatter *FHIRFormat = [[NSDateFormatter alloc] init];
    [FHIRFormat setDateFormat:@"yyyyy-MM-dd"];
    NSDictionary *dateDictionary = [[NSDictionary alloc] initWithObjectsAndKeys:[FHIRFormat stringFromDate:_value], @"value", nil];
    return dateDictionary;
}

- (void)setValueDate:(NSDictionary *)dictionary
{
    NSDateFormatter *FHIRFormat = [[NSDateFormatter alloc] init];
    [FHIRFormat setDateFormat:@"yyyyy-MM-dd"];
    _value = [[NSDate alloc] init];
    _value = [FHIRFormat dateFromString:[dictionary objectForKey:@"value"]];
}

@end
