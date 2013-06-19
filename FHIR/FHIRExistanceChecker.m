//
//  ExistanceChecker.m
//  FHIR
//
//  Created by Adam Sippel on 2013-03-18.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

#import "FHIRExistanceChecker.h"

@implementation FHIRExistanceChecker

+ (NSArray *)generateArray:(NSArray *)array //checks if an array is empty
{
    NSMutableArray *tempArray = [[NSMutableArray alloc] init];
    if ([array count] <= 0)
    {
        return NULL;
    }
    else
    {
        for (int i = 0; i < [array count]; i++)
        {
            [tempArray addObject:[[array objectAtIndex:i] generateAndReturnDictionary]];
        }
        return tempArray;
    }
}

+ (NSDictionary *)stringChecker:(FHIRString *)string //checks if a string is empty
{
    if (string)
    {
        return [string generateAndReturnDictionary];
    }
    else
    {
        return NULL;
    }
}

+ (NSDate *)generateDateTimeFromString:(NSString *)string
{
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    [df setDateStyle:NSDateFormatterShortStyle];
    [df setTimeStyle:NSDateFormatterLongStyle];
    NSDate *myDate = [df dateFromString:string];
    return myDate;
}

+ (id)checkEmptySingleObjectArray:(NSArray *)arrayToCheck
{
    if ([arrayToCheck count] != 1)
    {
        return NULL;
    }
    else
    {
        return [[arrayToCheck objectAtIndex:0] generateAndReturnDictionary];
    }
}

@end
