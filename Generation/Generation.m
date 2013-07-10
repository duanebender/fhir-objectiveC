//
//  Generation.m
//  FHIR
//
//  Created by Adam Sippel on 2013-07-09.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

#import "Generation.h"
#import "XSDReader.h"

@implementation Generation

+ (void)generateFHIRClassFromXMLSchema:(NSString *)urlforXSDFile toFileLocation:(NSString *)filePathForSavedClass
{
    NSURL *url = [NSURL URLWithString:urlforXSDFile];
    NSString *xmlString = [NSString stringWithContentsOfURL:url encoding:NSASCIIStringEncoding error:nil];
    
    if (xmlString)
    {
        NSLog(@"Exists");
        NSError *error;
        xmlString = [self stringByStrippingXMLHeader:xmlString];
        
        NSDictionary *classDictionary = [XSDReader dictionaryForXMLString:xmlString error:error];
        classDictionary = [[NSDictionary alloc] initWithDictionary:[classDictionary objectForKey:@"xs:schema"]];
        NSLog(@"%@",classDictionary);
    }
    else
    {
        NSLog(@"File does not exist at: %@", urlforXSDFile);
        //return nil;
    }
}

- (void)generateClassHeaderFile:(NSString *)filePathForSavedClass
{
    
}

- (void)generateClassImplementationFile:(NSString *)filePathForSavedClass
{
    
}

+ (NSString *)stringByStrippingXMLHeader:(NSString *)xmlString
{
    NSRange r;
    if ((r = [xmlString rangeOfString:@"<?xml version='1.0' encoding='UTF-8'?>" options:NSRegularExpressionSearch]).location != NSNotFound) 
        xmlString = [xmlString stringByReplacingCharactersInRange:r withString:@""];
    return xmlString;
}

@end
