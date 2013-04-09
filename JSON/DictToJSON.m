//
//  DictToJSON.m
//  FHIR
//
//  Created by Adam Sippel on 2013-02-13.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

#import "DictToJSON.h"

@implementation DictToJSON

@synthesize jsonString = _jsonString;

- (void)generateJson:(NSObject *)jsonObject urlPath:(NSString *)urlString
{
    NSArray *singleObject = [[NSArray alloc] initWithObjects:jsonObject, nil];
    
    if ([jsonObject class] == [Patient class])
    {
        Patient *patient = [singleObject objectAtIndex:0];
        [self generateJsonStringFromFHIRResourceDictionary:[patient generateAndReturnResourceDictionary] urlPath:urlString];
    }
}

- (void)generateJsonStringFromFHIRResourceDictionary:(FHIRResourceDictionary *)json urlPath:(NSString *)urlString
{
    NSData *encodedData = [NSJSONSerialization dataWithJSONObject:json.dataForResource options:NSJSONWritingPrettyPrinted error:nil];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    [fileManager createFileAtPath:urlString contents:encodedData attributes:nil];
}

@end
