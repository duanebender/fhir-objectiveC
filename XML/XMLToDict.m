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

- (NSObject *)convertXmlToDictionary:(NSString *)urlString
{
    NSURL *url = [NSURL URLWithString:urlString];
    NSString *xmlString = [NSString stringWithContentsOfURL:url encoding:NSASCIIStringEncoding error:nil];
    
    if (xmlString)
    {
        NSLog(@"Exists");
        NSError *error;
        xmlString = [self stringByStrippingXMLHeader:xmlString];
        //NSLog(@"%@",xmlString);
        
        NSDictionary *xmlDictionary = [XMLReader dictionaryForXMLString:xmlString error:error];
        //NSLog(@"%@", xmlDictionary);
        NSObject *resourceAsObject = [self createLocalizedObject:xmlDictionary];
        return resourceAsObject;
    }
    else
    {
        NSLog(@"File does not exist at: %@", urlString);
        return nil;
    }
    
}

- (NSObject *)createLocalizedObject:(NSDictionary *)xmlDict
{
    if ([xmlDict objectForKey:@"Patient"])
    {
        Patient *patient = [[Patient alloc] init];
        [patient patientParser:xmlDict];
        return patient;
        NSLog(@"patientXML ************** %@", patient);
    }
    else
    {
        return nil;
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
