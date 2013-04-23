//
//  XMLWriter.h
//  FHIR
//
//  Created by Adam Sippel on 2013-04-01.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XMLWriter : NSObject
{
    int tabValue;
}

- (NSString *)stringForXMLDictionary :(NSMutableDictionary *)xmlDictionary :(NSString *)resourceType;
- (NSMutableString *)writeXMLStringFromDictionary:(NSString *)element:(id)content;
- (NSMutableString *)writeXMLStringFromArray:(NSString *)element:(id)content;
- (NSMutableString *)tabber;

@end
