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
    NSString *error;
    NSData *xmlData = [NSPropertyListSerialization dataFromPropertyList: xml.dataForResource
                                                                 format: NSPropertyListXMLFormat_v1_0
                                                       errorDescription: &error];
    
    NSString *xmlString = [[NSString alloc] initWithData: xmlData encoding: NSUTF8StringEncoding];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    [fileManager createFileAtPath:urlString contents:xmlData attributes:nil];
    [xmlString writeToFile:urlString atomically:YES encoding:NSUTF8StringEncoding error:nil];
    //[_jsonString writeToFile:filePath atomically:YES encoding: NSUTF8StringEncoding error: NULL];
}

@end
