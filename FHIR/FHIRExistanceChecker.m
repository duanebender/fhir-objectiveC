//
//  ExistanceChecker.m
//  FHIR
//
//  Created by Adam Sippel on 2013-03-18.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

#import "FHIRExistanceChecker.h"

@implementation FHIRExistanceChecker

+ (NSObject *)generateArray:(NSArray *)array //checks if an array is empty
{
    NSMutableArray *tempArray = [[NSMutableArray alloc] init];
    if ([array count] <= 0)
    {
        return [NSNull null];
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

+ (NSObject *)stringChecker:(FHIRString *)string //checks if a string is empty
{
    if (string)
    {
        return [string generateAndReturnDictionary];
    }
    else
    {
        return [NSNull null];
    }
}

+ (NSObject *)emptyObjectChecker:(NSObject *)objectToCheck
{
    if (objectToCheck)
    {
        return objectToCheck;
    }
    else
    {
        return [NSNull null];
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
        return [NSNull null];
    }
    else
    {
        return [[arrayToCheck objectAtIndex:0] generateAndReturnDictionary];
    }
}

+ (NSObject *)primitiveValueChecker:(NSDictionary *)dictionaryWithSingleValueKey
{
    if ([dictionaryWithSingleValueKey objectForKey:@"value"])
    {
        return dictionaryWithSingleValueKey;
    }
    else
    {
        return [NSNull null];
    }
}

@end
