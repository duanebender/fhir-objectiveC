//
//  JSONToDict.m
//  FHIR
//
//  Created by Adam Sippel on 2013-02-19.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

#import "JSONToDict.h"

@implementation JSONToDict

//@synthesize incomingResourceType = _incomingResourceType;
@synthesize patient = _patient;

- (void)convertJsonToDictionary:(NSString *)urlString
{
    NSURL *url = [NSURL URLWithString:urlString];
    NSString *jsonString = [NSString stringWithContentsOfURL:url encoding:NSASCIIStringEncoding error:nil];

    if (jsonString)
    {
        NSLog(@"Exists");
        NSData *fileContent = [[NSData alloc] initWithContentsOfURL:url];
        NSError *error;
        NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:fileContent options:kNilOptions error:&error];
        //_incomingResourceType = resourceType;
        //NSLog(@"JSON Dict before localized: %@", jsonDictionary);
        [self createLocalizedObject:jsonDictionary];
    }
    else
    {
        NSLog(@"File does not exist at: %@", url);
    }
    
}

- (void)createLocalizedObject:(NSDictionary *)jsonDict
{
    if ([jsonDict objectForKey:@"Patient"])//([_incomingResourceType caseInsensitiveCompare:@"Patient"])
    {
        _patient = [[Patient alloc] init];
        //NSLog(@"%@", _patient);
        [_patient patientParser:jsonDict];
        
    }
}

@end
