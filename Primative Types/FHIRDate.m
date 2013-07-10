//
//  FHIRDate.m
//  FHIR
//
//  Created by Adam Sippel on 2013-06-24.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

#import "FHIRDate.h"
#import "FHIRExistanceChecker.h"

@implementation FHIRDate

@synthesize value = _value;

- (NSObject *)generateAndReturnDictionary
{
    NSDateFormatter *FHIRFormat = [[NSDateFormatter alloc] init];
    [FHIRFormat setDateFormat:@"yyyy-MM-dd"];
    
    NSObject *dateObject;
    dateObject = [FHIRExistanceChecker primitiveValueChecker:[[NSDictionary alloc] initWithObjectsAndKeys:[FHIRFormat stringFromDate:_value], @"value", nil]];
    return dateObject;
}

- (void)setValueDate:(NSDictionary *)dictionary
{
    NSDateFormatter *FHIRFormat = [[NSDateFormatter alloc] init];
    [FHIRFormat setDateFormat:@"yyyy-MM-dd"];
    _value = [[NSDate alloc] init];
    _value = [FHIRFormat dateFromString:[dictionary objectForKey:@"value"]];
}

@end
