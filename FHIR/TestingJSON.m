//
//  TestingJSON.m
//  FHIR
//
//  Created by Adam Sippel on 2013-02-13.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

#import "TestingJSON.h"
#import "Patient.h"

@implementation TestingJSON

@synthesize jsonString = _jsonString;

- (void)generateJsonString:(FHIRResourceDictionary *)json
{
    NSData *encodedData = [NSJSONSerialization dataWithJSONObject:json options:NSJSONWritingPrettyPrinted error:nil];
    _jsonString = [[NSString alloc] initWithData:encodedData encoding:NSUTF8StringEncoding];
}

@end
