//
//  XMLWriter.m
//  FHIR
//
//  Created by Adam Sippel on 2013-04-01.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

#import "XMLWriter.h"

//define exceptions to the value between two tags
#define INTERNAL_VALUE_STRINGS [NSSet setWithObjects:@"active",@"birthDate", @"DeceasedBoolean", @"DeceasedDate", nil]

@implementation XMLWriter

- (NSMutableString *)stringForXMLDictionary:(NSMutableDictionary *)xmlDictionary resourceType:(NSString *)resourceType
{
    NSMutableString *stringForXML = [[NSMutableString alloc] initWithString:@""]; //initialize string
    
    [stringForXML appendString:[NSString stringWithFormat:@"<?xml version='1.0' encoding='UTF-8'?>\n"]];
    
    [stringForXML appendString:[NSString stringWithFormat:@"<%@ xmlns='http://hl7.org/fhir'>\n", resourceType]]; //set first line of xml code to resource
    NSMutableDictionary *xmlDict2 = [[NSMutableDictionary alloc] initWithDictionary:[xmlDictionary objectForKey:resourceType]];
    
    NSMutableArray *arrayOfOrderedKeys = [[NSMutableArray alloc] init];
    if ([resourceType isEqualToString:@"Patient"])
    {
        for (int i = 0; i < [PATIENT_ORDERED_KEYS count]; i++)
        {
            for (NSString *key in xmlDict2)
            {
                if ([[PATIENT_ORDERED_KEYS objectAtIndex:i] isEqualToString:key])
                {
                    [arrayOfOrderedKeys addObject:[PATIENT_ORDERED_KEYS objectAtIndex:i]];
                }
            }
        }
    }
    else
    {
        [arrayOfOrderedKeys addObjectsFromArray:[xmlDict2 allKeys]];
    }
    
    for (int x = 0; x < [arrayOfOrderedKeys count]; x++)//for (NSString *key in xmlDict2)
    {
        NSString *key = [arrayOfOrderedKeys objectAtIndex:x];
        NSObject *value = [xmlDict2 valueForKey:key];
        //generate string of xml from resource
        if ([value isKindOfClass:[NSDictionary class]] && ![key isEqualToString:@"value"])
        {
            tabValue ++;
            [stringForXML appendString:[self tabber]];
            if (![INTERNAL_VALUE_STRINGS containsObject:key]) [stringForXML appendString:[NSString stringWithFormat:@"<%@>\n", key]];
            [stringForXML appendString:[self writeXMLStringFromDictionary:key contentOfDictionary:value]];
            tabValue--;
            [stringForXML appendString:[self tabber]];
            if (![INTERNAL_VALUE_STRINGS containsObject:key]) [stringForXML appendString:[NSString stringWithFormat:@"</%@>\n", key]];
        }
        else if ([value isKindOfClass:[NSArray class]])
        {
            [stringForXML appendString:[self writeXMLStringFromArray:key contentOfArray:value]];
        }
        else if ([key isEqualToString:@"value"])
        {
            [stringForXML appendString:[NSString stringWithFormat:@"<%@ value='%@'>", key, value]];
        }
        else if ([key isEqualToString:@"div"]) //in case of a div container for the text field
        {
            tabValue++;
            [stringForXML appendString:[self tabber]];
            [stringForXML appendString:[NSString stringWithFormat:@"<div xmlns='http://www.w3.org/1999/xhtml'> \n"]];
            tabValue++;
            [stringForXML appendString:[self tabber]];
            [stringForXML appendString:[NSString stringWithFormat:@"%@ \n",value]];
            tabValue--;
            [stringForXML appendString:[self tabber]];
            [stringForXML appendString:[NSString stringWithFormat:@"</div> \n"]];
            tabValue--;
        }
        else
        {
            [stringForXML appendString:[NSString stringWithFormat:@"<%@>%@</%@>\n", key, value, key]];
        }
        
    }
    [stringForXML appendString:[NSString stringWithFormat:@"</%@>\n", resourceType]];
    
    return stringForXML;
}

//generate string from dictionary
- (NSMutableString *)writeXMLStringFromDictionary:(NSString *)element contentOfDictionary:(NSDictionary *)content
{
    NSArray *orderedKeyArray = [self arrayOfProperlyOrderedKeys:element];
    NSMutableArray *arrayOfOrderedKeys = [[NSMutableArray alloc] init];
    
    if ([orderedKeyArray count] == 0) //failsafe for single dictionarys that dont need to be ordered
    {
        [arrayOfOrderedKeys addObjectsFromArray:[content allKeys]];
    }
    else
    {
        for (int i = 0; i < [orderedKeyArray count]; i++)
        {
            for (NSString *key in content)
            {
                if ([[orderedKeyArray objectAtIndex:i] isEqualToString:key])
                {
                    [arrayOfOrderedKeys addObject:[orderedKeyArray objectAtIndex:i]];
                }
            }
        }
    }
    
    NSMutableString *returnString = [[NSMutableString alloc] initWithString:@""];
    
    for (int x = 0; x < [arrayOfOrderedKeys count]; x++)//for (NSString *key in content)
    {
        NSString *key = [arrayOfOrderedKeys objectAtIndex:x];
        NSObject *value = [content valueForKey:key];
        if ([value isKindOfClass:[NSMutableDictionary class]] || [value isKindOfClass:[NSDictionary class]])
        {
            tabValue++;
            [returnString appendString:[self tabber]];
            if ([INTERNAL_VALUE_STRINGS containsObject:key]) [returnString appendString:[NSString stringWithFormat:@"<%@>\n", key]];
            tabValue--;
            [returnString appendString:[self writeXMLStringFromDictionary:key contentOfDictionary:value]];
            [returnString appendString:[self tabber]];
            if ([INTERNAL_VALUE_STRINGS containsObject:key]) [returnString appendString:[NSString stringWithFormat:@"</%@>\n", key]];
        }
        else if ([value isKindOfClass:[NSMutableArray class]] || [value isKindOfClass:[NSArray class]])
        {
            tabValue++;
            [returnString appendString:[self writeXMLStringFromArray:key contentOfArray:value]];
            tabValue--;
        }
        else if ([key isEqualToString:@"value"])
        {
            [returnString appendString:[self tabber]];
            [returnString appendString:[NSString stringWithFormat:@"<%@ value='%@' />\n", element, value]];
        }
        else if ([key isEqualToString:@"div"]) //in case of a div container for the text field
        {
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
            [returnString appendString:[NSString stringWithFormat:@"<%@>%@</%@>\n", key, value, key]];
        }
    }
    return returnString;
}

//generate string for array
- (NSMutableString *)writeXMLStringFromArray:(NSString *)element contentOfArray:(NSArray *)content
{
    NSMutableString *returnString = [[NSMutableString alloc] init];

    for (int i=0; i < [content count]; i++)
    {
        NSDictionary *tempDictionary = [[NSDictionary alloc] initWithDictionary:[content objectAtIndex:i]];
        NSArray *orderedKeyArray = [[NSArray alloc] initWithArray:[self arrayOfProperlyOrderedKeys:element]];
        NSMutableArray *arrayOfOrderedKeys = [[NSMutableArray alloc] init];
        if ([orderedKeyArray count] != 0) //check whether to order the array
        {
            for (int k = 0; k < [orderedKeyArray count]; k++)
            {
                for (NSString *key in tempDictionary)
                {
                    if ([[orderedKeyArray objectAtIndex:k] isEqualToString:key])
                    {
                        [arrayOfOrderedKeys addObject:[orderedKeyArray objectAtIndex:k]];
                    }
                }
            }
        }
        else
        {
            [arrayOfOrderedKeys addObjectsFromArray:[tempDictionary allKeys]];
        }
        
        if ([tempDictionary count] > 1) //check if contains more than just single values for wrapping
        {
            [returnString appendString:[self tabber]];
            [returnString appendString:[NSString stringWithFormat:@"<%@>\n", element]];
            tabValue++;
        }
        
        for (int j = 0; j < [arrayOfOrderedKeys count]; j++)
        {
            NSString *key = [arrayOfOrderedKeys objectAtIndex:j];
            NSObject *value = [tempDictionary valueForKey:key];
            if ([value isKindOfClass:[NSDictionary class]])
            {
                if ([INTERNAL_VALUE_STRINGS containsObject:key]) [returnString appendString:[NSString stringWithFormat:@"<%@>\n", key]];
                [returnString appendString:[self writeXMLStringFromDictionary:key contentOfDictionary:value]];
                if ([INTERNAL_VALUE_STRINGS containsObject:key]) [returnString appendString:[NSString stringWithFormat:@"</%@>\n", key]];
            }
            else if ([value isKindOfClass:[NSArray class]])
            {
                [returnString appendString:[self writeXMLStringFromArray:key contentOfArray:value]];
            }
            else if ([key isEqualToString:@"value"])
            {
                [returnString appendString:[self tabber]];
                [returnString appendString:[NSString stringWithFormat:@"<%@ value='%@' />\n", element, value]];
            }
            else if ([key isEqualToString:@"div"]) //in case of a div container for the text field
            {
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
                [returnString appendString:[NSString stringWithFormat:@"<%@>%@</%@>\n", key, value, key]];
            }
        }
        if ([tempDictionary count] > 1) //match opening wrapper for closing wrapper
        {
            tabValue--;
            [returnString appendString:[self tabber]];
            [returnString appendString:[NSString stringWithFormat:@"</%@>\n", element]];
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
        //NSLog(@"Tab: %d",tabValue);
    }
    
    return returnString;
}

//checks for what the element is
- (NSArray *)arrayOfProperlyOrderedKeys:(NSString *)keyToCheck
{
    if ([keyToCheck isEqualToString:@"identifier"])
    {
        return IDENTIFIER_ORDERED_KEYS;
    }
    else if ([keyToCheck isEqualToString:@"name"])
    {
        return HUMANNAME_ORDERED_KEYS;
    }
    else if ([keyToCheck isEqualToString:@"telecom"])
    {
        return CONTACT_ORDERED_KEYS;
    }
    else if ([keyToCheck isEqualToString:@"contact"]) //only in patient contact
    {
        return PATIENT_CONTACT_ORDERED_KEYS;
    }
    else if ([keyToCheck isEqualToString:@"address"])
    {
        return ADDRESS_ORDERED_KEYS;
    }
    else if ([keyToCheck isEqualToString:@"photo"])
    {
        return ATTACHMENT_ORDERED_KEYS;
    }
    else if ([keyToCheck isEqualToString:@"period"])
    {
        return PERIOD_ORDERED_KEYS;
    }
    else if ([keyToCheck isEqualToString:@"animal"])
    {
        return PATIENT_ANIMAL_ORDERED_KEYS;
    }
    else if ([keyToCheck isEqualToString:@"provider"] || [keyToCheck isEqualToString:@"link"] || [keyToCheck isEqualToString:@"organization"]) //all uses for patient
    {
        return RESOURCEREFERENCE_ORDERED_KEYS;
    }
    else if ([keyToCheck isEqualToString:@"gender"] || [keyToCheck isEqualToString:@"maritalStatus"] || [keyToCheck isEqualToString:@"communication"] || [keyToCheck isEqualToString:@"relationship"] || [keyToCheck isEqualToString:@"species"] || [keyToCheck isEqualToString:@"breed"] || [keyToCheck isEqualToString:@"genderStatus"]) //all uses for patient
    {
        return CODABLECONCEPT_ORDERED_KEYS;
    }
    else if ([keyToCheck isEqualToString:@"coding"])
    {
        return CODE_ORDERED_KEYS;
    }
    else
    {
        return NULL;
    }
}

@end
