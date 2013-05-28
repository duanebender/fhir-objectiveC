//
//  DictToXML.m
//  FHIR
//
//  Created by Adam Sippel on 2013-03-11.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

#import "DictToXML.h"

@implementation DictToXML

@synthesize xmlString = _xmlString;
@synthesize currentResource = _currentResource;

- (void)generateXml:(NSObject *)xmlObject urlPath:(NSString *)urlString
{
    NSArray *singleObject = [[NSArray alloc] initWithObjects:xmlObject, nil];
    
    if ([xmlObject class] == [Patient class])
    {
        Patient *patient = [singleObject objectAtIndex:0];
        _currentResource = @"Patient";
        [self generateXmlStringFromFHIRResourceDictionary:[patient generateAndReturnResourceDictionary] urlPath:urlString];
    }
    else if ([xmlObject class] == [Organization class])
    {
        Organization *organization = [singleObject objectAtIndex:0];
        _currentResource = @"Organization";
        [self generateXmlStringFromFHIRResourceDictionary:[organization generateAndReturnResourceDictionary] urlPath:urlString];
    }
}

- (void)generateXmlStringFromFHIRResourceDictionary:(FHIRResourceDictionary *)xml urlPath:(NSString *)urlString
{
    XMLWriter *xmlWriter = [[XMLWriter alloc] init];
    _xmlString = [xmlWriter stringForXMLDictionary:xml.dataForResource resourceType:_currentResource];
    [_xmlString writeToFile:urlString atomically:YES encoding:NSUTF8StringEncoding error:nil];
}

@end
