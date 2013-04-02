//
//  XMLWriter.m
//  FHIR
//
//  Created by Adam Sippel on 2013-04-01.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

#import "XMLWriter.h"

@implementation XMLWriter

- (NSMutableString *)stringForXMLDictionary :(NSMutableDictionary *)xmlDictionary :(NSString *)resourceType
{
    NSMutableString *stringForXML = [[NSMutableString alloc] initWithString:@""];
    
    [stringForXML appendString:[NSString stringWithFormat:@"<%@ xmlns='http://hl7.org/fhir'>", resourceType]];
    NSMutableDictionary *xmlDict2 = [[NSMutableDictionary alloc] initWithDictionary:[xmlDictionary objectForKey:resourceType]];
    for (NSString *key in xmlDict2)
    {
        NSObject *value = [xmlDict2 valueForKey:key];
        NSLog(@"%@",[value class]);
        if ([value class] == [NSDictionary class])
        {
            NSLog(@"CheckA1");
            [stringForXML appendString:[self writeXMLStringFromDictionary:key:value]];
        }
        else if ([value class] == [NSArray class])
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
    [stringForXML appendString:[NSString stringWithFormat:@"<\\%@>", resourceType]];
    
    return stringForXML;
}

- (NSMutableString *)writeXMLStringFromDictionary:(NSString *)element:(id)content
{
    NSMutableString *returnString = [[NSMutableString alloc] initWithString:@""];
    
    for (NSString *key in content)
    {
        NSObject *value = [content valueForKey:key];
        if ([value class] == [NSDictionary class])
        {
            NSLog(@"CheckB1");
            [returnString appendString:[NSString stringWithFormat:@"<%@>", element]];
            [returnString appendString:[self writeXMLStringFromDictionary:key:value]];
        }
        else if ([value class] == [NSArray class])
        {
            NSLog(@"CheckB2");
            [returnString appendString:[NSString stringWithFormat:@"<%@>", element]];
            [returnString appendString:[self writeXMLStringFromArray:key:value]];
        }
        else if ([key isEqualToString:@"value"])
        {
            NSLog(@"CheckB3");
            [returnString appendString:[NSString stringWithFormat:@"<%@ value='%@'>", element, value]];
        }
        else
        {
            NSLog(@"CheckB4");
            [returnString appendString:[NSString stringWithFormat:@"<%@ value='%@'>", key, value]];
        }
    }
    [returnString appendString:[NSString stringWithFormat:@"<\\%@>", element]];
    
    return returnString;
}

- (NSMutableString *)writeXMLStringFromArray:(NSString *)element:(id)content
{
    NSMutableString *returnString = [[NSMutableString alloc] init];
    
    for (int i=0; i < [content count]; i++)
    {
        NSDictionary *tempDictionary = [[NSDictionary alloc] initWithDictionary:[content objectAtIndex:i]];
        
        for (NSString *key in tempDictionary)
        {
            NSObject *value = [tempDictionary valueForKey:key];
            if ([value class] == [NSDictionary class])
            {
                NSLog(@"CheckC1");
                [returnString appendString:[self writeXMLStringFromDictionary:key:value]];
            }
            else if ([value class] == [NSArray class])
            {
                NSLog(@"CheckC2");
                [returnString appendString:[self writeXMLStringFromArray:key:value]];
            }
            else
            {
                NSLog(@"CheckC3");
                [returnString appendString:[NSString stringWithFormat:@"<%@ value='%@'>", key, value]];
            }
        }
    }
    
    return returnString;
}

@end
