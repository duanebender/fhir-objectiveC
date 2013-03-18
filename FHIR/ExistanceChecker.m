//
//  ExistanceChecker.m
//  FHIR
//
//  Created by Adam Sippel on 2013-03-18.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

#import "ExistanceChecker.h"

@interface ExistanceChecker()


@end

@implementation ExistanceChecker

//Resource Reference
+ (NSArray *)generateResourceReferenceArray:(NSArray *)resourceReferenceArray
{
    NSMutableArray *tempArray = [[NSMutableArray alloc] init];
    
    if ([resourceReferenceArray count] == 0)
    {
        return NULL;
    }
    else
    {
        for (int i = 0; i < [resourceReferenceArray count]; i++)
        {
            [tempArray addObject:[[resourceReferenceArray objectAtIndex:i] generateAndReturnResourceReferenceDictionary]];
        }
        return tempArray;
    }
}

+ (NSArray *)generateHumanIdArray:(NSArray *)humanIdArray
{
    NSMutableArray *tempArray = [[NSMutableArray alloc] init];
    
    if ([humanIdArray count] == 0)
    {
        return NULL;
    }
    else
    {
        for (int i = 0; i < [humanIdArray count]; i++)
        {
            [tempArray addObject:[[humanIdArray objectAtIndex:i] generateAndReturnHumanIdDictionary]];
        }
        return tempArray;
    }
}

+ (NSArray *)generateStringArray:(NSArray *)stringArray
{
    NSMutableArray *tempArray = [[NSMutableArray alloc] init];
    
    if ([stringArray count] <= 0)
    {
        return NULL;
    }
    else
    {
        for (int i = 0; i < [stringArray count]; i++)
        {
            [tempArray addObject:[[stringArray objectAtIndex:i] generateAndReturnDictionary]];
        }
        return tempArray;
    }
}

+ (NSDictionary *)stringChecker:(String *)string
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

@end
