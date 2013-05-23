//
//  XMLWriter.h
//  FHIR
//
//  Created by Adam Sippel on 2013-04-01.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

/**
 * Writes XML files using NSDictionaries
 */

#import <Foundation/Foundation.h>

@interface XMLWriter : NSObject
{
    int tabValue; //to make the file aesthetically pleasing
}

- (NSString *)stringForXMLDictionary :(NSMutableDictionary *)xmlDictionary :(NSString *)resourceType; //turns an NSDictionary containing NSArrays or other NSDictionaries into an xml string and return's it
- (NSMutableString *)writeXMLStringFromDictionary:(NSString *)element:(id)content; // *DO NOT CALL* used to turn an NSDictionary into an XML string
- (NSMutableString *)writeXMLStringFromArray:(NSString *)element:(id)content; //turns an NSArray into an xml string
- (NSMutableString *)tabber; //controls the tabbing of all the arrays

@end
