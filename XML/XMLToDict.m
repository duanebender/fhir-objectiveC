//
//  XMLToDict.m
//  FHIR
//
//  Created by Adam Sippel on 2013-03-04.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

#import "XMLToDict.h"

@implementation XMLToDict

@synthesize incomingResourceType = _incomingResourceType;

#warning - Fix this code!!!
- (void)convertXmlToDictionary:(NSString *)urlString
{
    NSString *str = [@"<?xml pie ?> apple  <? pie?> toe" mutableCopy];
    
    str = [self stringByStrippingXMLHeader:str];
    
    NSLog(@"%@",str);
    
    NSString *filePath = @"/Users/adamsippel/Desktop/patient.xml";
    BOOL fileExists = [[NSFileManager defaultManager] fileExistsAtPath:filePath];
    if (fileExists)
    {
        NSLog(@"Exists");
        NSString *xmlString = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
        NSError *error;
        xmlString = [self stringByStrippingXMLHeader:xmlString];
        NSLog(@"%@",xmlString);
        
        NSDictionary *xmlDictionary = [XMLReader dictionaryForXMLString:xmlString error:error]; //error here <--
        _incomingResourceType = urlString;
        NSLog(@"%@", xmlDictionary);
        [self createLocalizedObject:xmlDictionary];
    }
    else
    {
        NSLog(@"File does not exist at: %@", filePath);
    }
    
    
    
}

- (void)createLocalizedObject:(NSDictionary *)xmlDict
{
    if ([_incomingResourceType isEqual: @"Patient"])
    {
        Patient *patient = [[Patient alloc] init];
        [patient patientParser:xmlDict];
        NSLog(@"Here?");
        NSLog(@"%@", patient);
    }
}

- (NSString *)stringByStrippingXMLHeader:(NSString *)xmlString
{
    NSRange r;
    if ((r = [xmlString rangeOfString:@"(.*)<\?xml.*\?>" options:NSRegularExpressionSearch]).location != NSNotFound)
        xmlString = [xmlString stringByReplacingCharactersInRange:r withString:@""];
    return xmlString;
}

@end
