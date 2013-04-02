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

- (void)generateXmlString:(FHIRResourceDictionary *)xml urlPath:(NSString *)urlString
{
    XMLWriter *xmlWriter = [[XMLWriter alloc] init];
    _xmlString = [xmlWriter stringForXMLDictionary:xml.dataForResource :@"Patient"];
    [_xmlString writeToFile:urlString atomically:YES encoding:NSUTF8StringEncoding error:nil];
    
    /*
    NSString *error;
    NSData *xmlData = [NSPropertyListSerialization dataFromPropertyList: xml.dataForResource
                                                                 format: NSPropertyListXMLFormat_v1_0
                                                       errorDescription: &error];
    
    _xmlString = [[NSString alloc] initWithData: xmlData encoding: NSUTF8StringEncoding];
    NSLog(@"XMLSTRING HERE *************** %@", _xmlString);
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    [fileManager createFileAtPath:urlString contents:xmlData attributes:nil];
    [_xmlString writeToFile:urlString atomically:YES encoding:NSUTF8StringEncoding error:nil];
     */
}

@end
