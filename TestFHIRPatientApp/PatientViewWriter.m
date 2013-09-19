//
//  PatientViewWriter.m
//  TestFHIRPatientApp
//
//  Created by Adam Sippel on 2013-04-22.
//  Copyright (c) 2013 Adam Sippel. All rights reserved.
//

#import "PatientViewWriter.h"

#define INTERNAL_VALUE_STRINGS [NSSet setWithObjects:@"active",@"gender",nil]

@implementation PatientViewWriter

+ (NSString *)writePatientAsStringForView:(NSMutableDictionary *)patientDict
{
    NSMutableString *stringForView = [[NSMutableString alloc] initWithString:@""]; //initialize string

    NSMutableDictionary *tempDict = [[NSMutableDictionary alloc] initWithDictionary:[patientDict objectForKey:@"Patient"]];
    
    for (NSString *key in tempDict)
    {
        NSObject *value = [tempDict valueForKey:key];
        //generate string of patient from resource
        if ([value isKindOfClass:[NSDictionary class]] && ![key isEqualToString:@"value"])
        {
            NSLog(@"CheckA1");
            if (![INTERNAL_VALUE_STRINGS containsObject:key]) [stringForView appendString:[NSString stringWithFormat:@"%@:\n", key]];
            [stringForView appendString:[self writeXMLStringFromDictionary:key:value]];
            if (![INTERNAL_VALUE_STRINGS containsObject:key]) [stringForView appendString:[NSString stringWithFormat:@"\n"]];
        }
        else if ([value isKindOfClass:[NSArray class]])
        {
            NSLog(@"CheckA2");
            [stringForView appendString:[self writeXMLStringFromArray:key:value]];
        }
        else
        {
            NSLog(@"CheckA3");
            [stringForView appendString:[NSString stringWithFormat:@"%@:'%@'", key, value]];
        }
        
    }
    
    return stringForView;
}

//generate string from dictionary
+ (NSMutableString *)writeXMLStringFromDictionary:(NSString *)element:(id)content
{
    NSMutableString *returnString = [[NSMutableString alloc] initWithString:@""];
    
    for (NSString *key in content)
    {
        NSObject *value = [content valueForKey:key];
        if ([content isKindOfClass:[NSMutableDictionary class]] || [value isKindOfClass:[NSDictionary class]])
        {
            NSLog(@"CheckB1");
            if ([INTERNAL_VALUE_STRINGS containsObject:key]) [returnString appendString:[NSString stringWithFormat:@"%@:\n", key]];
            [returnString appendString:[self writeXMLStringFromDictionary:key:value]];
            if ([INTERNAL_VALUE_STRINGS containsObject:key]) [returnString appendString:[NSString stringWithFormat:@"\n"]];
        }
        else if ([value isKindOfClass:[NSMutableArray class]] || [value isKindOfClass:[NSArray class]])
        {
            NSLog(@"CheckB2");
            [returnString appendString:[self writeXMLStringFromArray:key:value]];
        }
        else if ([key isEqualToString:@"value"])
        {
            NSLog(@"CheckB3");
            [returnString appendString:[NSString stringWithFormat:@"%@:'%@'\n", element, value]];
        }
        else if ([key isEqualToString:@"div"]) //in case of a div container for the text field
        {
            NSLog(@"CheckB4");
            [returnString appendString:[NSString stringWithFormat:@"<div>\n"]];
            [returnString appendString:[NSString stringWithFormat:@"%@ \n",value]];
            [returnString appendString:[NSString stringWithFormat:@"</div> \n"]];
        }
        else
        {
            NSLog(@"CheckB5");
            [returnString appendString:[NSString stringWithFormat:@"<%@>%@<\\%@>\n", key, value, key]];
        }
    }
    return returnString;
}

//generate string for array
+ (NSMutableString *)writeXMLStringFromArray:(NSString *)element:(NSArray *)content
{
    NSMutableString *returnString = [[NSMutableString alloc] init];
    for (int i=0; i < [content count]; i++)
    {
        NSDictionary *tempDictionary = [[NSDictionary alloc] initWithDictionary:[content objectAtIndex:i]];
        if ([tempDictionary count] > 1) //check if contains more than just single values for wrapping
        {
            [returnString appendString:[NSString stringWithFormat:@"%@:\n", element]];
        }
        
        for (NSString *key in tempDictionary)
        {
            NSObject *value = [tempDictionary valueForKey:key];
            if ([value isKindOfClass:[NSDictionary class]] || [value isKindOfClass:[NSDictionary class]])
            {
                NSLog(@"CheckC1");
                if ([INTERNAL_VALUE_STRINGS containsObject:key]) [returnString appendString:[NSString stringWithFormat:@"%@:\n", key]];
                [returnString appendString:[self writeXMLStringFromDictionary:key:value]];
                if ([INTERNAL_VALUE_STRINGS containsObject:key]) [returnString appendString:[NSString stringWithFormat:@"\n"]];
            }
            else if ([value isKindOfClass:[NSArray class]])
            {
                NSLog(@"CheckC2");
                [returnString appendString:[self writeXMLStringFromArray:key:value]];
            }
            else if ([key isEqualToString:@"value"])
            {
                NSLog(@"CheckC3");
                [returnString appendString:[NSString stringWithFormat:@"%@:'%@'\n", element, value]];
            }
            else
            {
                NSLog(@"CheckC4");
                [returnString appendString:[NSString stringWithFormat:@"<%@>%@<\\%@>\n", key, value, key]];
            }
        }
        if ([tempDictionary count] > 1) //match opening wrapper for closing wrapper
        {
            [returnString appendString:[NSString stringWithFormat:@"\n"]];
        }
    }
    return returnString;
}

@end
