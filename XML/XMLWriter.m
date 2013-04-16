//
//  XMLWriter.m
//  FHIR
//
//  Created by Adam Sippel on 2013-04-01.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

#import "XMLWriter.h"

//define exceptions to the value between two tags
#define INTERNAL_VALUE_STRINGS [NSSet setWithObjects:@"active",@"gender",nil]

@implementation XMLWriter

- (NSMutableString *)stringForXMLDictionary :(NSMutableDictionary *)xmlDictionary :(NSString *)resourceType
{
    NSMutableString *stringForXML = [[NSMutableString alloc] initWithString:@""]; //initialize string
    
    [stringForXML appendString:[NSString stringWithFormat:@"<?xml version='1.0' encoding='UTF-8'?>\n"]];
    
    [stringForXML appendString:[NSString stringWithFormat:@"<%@ xmlns='http://hl7.org/fhir'>\n", resourceType]]; //set first line of xml code to resource
    NSMutableDictionary *xmlDict2 = [[NSMutableDictionary alloc] initWithDictionary:[xmlDictionary objectForKey:resourceType]];
    
    for (NSString *key in xmlDict2)
    {
        NSObject *value = [xmlDict2 valueForKey:key];
        //generate string of xml from resource
        NSLog(@"Here?");
        if ([value isKindOfClass:[NSDictionary class]] && ![key isEqualToString:@"value"])
        {
            NSLog(@"CheckA1");
            tabValue ++;
            [stringForXML appendString:[self tabber]];
            if (![INTERNAL_VALUE_STRINGS containsObject:key]) [stringForXML appendString:[NSString stringWithFormat:@"<%@>\n", key]];
            [stringForXML appendString:[self writeXMLStringFromDictionary:key:value]];
            tabValue--;
            [stringForXML appendString:[self tabber]];
            if (![INTERNAL_VALUE_STRINGS containsObject:key]) [stringForXML appendString:[NSString stringWithFormat:@"<\\%@>\n", key]];
        }
        else if ([value isKindOfClass:[NSArray class]])
        {
            NSLog(@"CheckA2");
            [stringForXML appendString:[self writeXMLStringFromArray:key:value]];
        }
        else
        {
            NSLog(@"CheckA3");
            [stringForXML appendString:[NSString stringWithFormat:@"<%@ value='%@'>", key, value]];
        }
        
    }
    [stringForXML appendString:[NSString stringWithFormat:@"<\\%@>\n", resourceType]];
    
    return stringForXML;
}

//generate string from dictionary
- (NSMutableString *)writeXMLStringFromDictionary:(NSString *)element:(id)content
{
    NSMutableString *returnString = [[NSMutableString alloc] initWithString:@""];
    
    for (NSString *key in content)
    {
        NSObject *value = [content valueForKey:key];
        if ([content isKindOfClass:[NSMutableDictionary class]] || [value isKindOfClass:[NSDictionary class]])
        {
            NSLog(@"CheckB1");
            tabValue++;
            [returnString appendString:[self tabber]];
            if ([INTERNAL_VALUE_STRINGS containsObject:key]) [returnString appendString:[NSString stringWithFormat:@"<%@>\n", key]];
            tabValue--;
            [returnString appendString:[self writeXMLStringFromDictionary:key:value]];
            [returnString appendString:[self tabber]];
            if ([INTERNAL_VALUE_STRINGS containsObject:key]) [returnString appendString:[NSString stringWithFormat:@"<\\%@>\n", key]];
        }
        else if ([value isKindOfClass:[NSMutableArray class]] || [value isKindOfClass:[NSArray class]])
        {
            NSLog(@"CheckB2");
            tabValue++;
            [returnString appendString:[self writeXMLStringFromArray:key:value]];
            tabValue--;
        }
        else if ([key isEqualToString:@"value"])
        {
            NSLog(@"CheckB3");
            [returnString appendString:[self tabber]];
            [returnString appendString:[NSString stringWithFormat:@"<%@ value='%@' \\>\n", element, value]];
        }
        else if ([key isEqualToString:@"div"]) //in case of a div container for the text field
        {
            NSLog(@"CheckB4");
            tabValue++;
            [returnString appendString:[self tabber]];
            [returnString appendString:[NSString stringWithFormat:@"<div xmlns='http://www.w3.org/1999/xhtml'> \n"]];
            tabValue++;
            [returnString appendString:[self tabber]];
            [returnString appendString:[NSString stringWithFormat:@"%@ \n",value]];
            tabValue--;
            [returnString appendString:[self tabber]];
            [returnString appendString:[NSString stringWithFormat:@"</div> \n"]];
            tabValue--;
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
- (NSMutableString *)writeXMLStringFromArray:(NSString *)element:(id)content
{
    NSMutableString *returnString = [[NSMutableString alloc] init];
    for (int i=0; i < [content count]; i++)
    {
        NSDictionary *tempDictionary = [[NSDictionary alloc] initWithDictionary:[content objectAtIndex:i]];
        if ([tempDictionary count] > 1) //check if contains more than just single values for wrapping
        {
            [returnString appendString:[self tabber]];
            [returnString appendString:[NSString stringWithFormat:@"<%@>\n", element]];
            tabValue++;
        }
        
        for (NSString *key in tempDictionary)
        {
            NSObject *value = [tempDictionary valueForKey:key];
            if ([value isKindOfClass:[NSDictionary class]] || [value isKindOfClass:[NSDictionary class]])
            {
                NSLog(@"CheckC1");
                if ([INTERNAL_VALUE_STRINGS containsObject:key]) [returnString appendString:[NSString stringWithFormat:@"<%@>\n", key]];
                [returnString appendString:[self writeXMLStringFromDictionary:key:value]];
                if ([INTERNAL_VALUE_STRINGS containsObject:key]) [returnString appendString:[NSString stringWithFormat:@"<\\%@>\n", key]];
            }
            else if ([value isKindOfClass:[NSArray class]])
            {
                NSLog(@"CheckC2");
                [returnString appendString:[self writeXMLStringFromArray:key:value]];
            }
            else if ([key isEqualToString:@"value"])
            {
                NSLog(@"CheckC3");
                [returnString appendString:[self tabber]];
                [returnString appendString:[NSString stringWithFormat:@"<%@ value='%@' \\>\n", element, value]];
            }
            else
            {
                NSLog(@"CheckC4");
                [returnString appendString:[NSString stringWithFormat:@"<%@>%@<\\%@>\n", key, value, key]];
            }
        }
        if ([tempDictionary count] > 1) //match opening wrapper for closing wrapper
        {
            tabValue--;
            [returnString appendString:[self tabber]];
            [returnString appendString:[NSString stringWithFormat:@"<\\%@>\n", element]];
        }
    }
    return returnString;
}

//formats the string for easier reading
- (NSMutableString *)tabber
{
    NSMutableString *returnString = [[NSMutableString alloc] init];
    
    for (int i = 0; i < tabValue; i++)
    {
        [returnString appendString:@"   "];
        NSLog(@"Tab: %d",tabValue);
    }
    
    return returnString;
}

@end
