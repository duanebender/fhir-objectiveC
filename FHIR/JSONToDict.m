//
//  JSONToDict.m
//  FHIR
//
//  Created by Adam Sippel on 2013-02-19.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

#import "JSONToDict.h"

@implementation JSONToDict

@synthesize incomingResourceType = _incomingResourceType;

- (void)convertJsonToDictionary:(NSString *)urlString
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    
    NSString *filePath = [documentsDirectory stringByAppendingPathComponent:[urlString stringByAppendingString:@".json"]];
    BOOL fileExists = [[NSFileManager defaultManager] fileExistsAtPath:@"/Users/adamsippel/Desktop/patient.json"];
    if (fileExists)
    {
        NSData *fileContent = [[NSData alloc] initWithContentsOfFile:@"/Users/adamsippel/Desktop/patient.json"];
        NSError *error;
        NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:fileContent options:kNilOptions error:&error];
        _incomingResourceType = urlString;
        NSLog(@"Exists");
        //NSLog(@"%@", jsonDictionary);
        [self createLocalizedObject:jsonDictionary];
    }
    else
    {
        NSLog(@"File does not exist at: %@", filePath);
    }
    
}

- (void)createLocalizedObject:(NSDictionary *)jsonDict
{
    if (_incomingResourceType == @"Patient")
    {
        Patient *patient = [[Patient alloc] init];
        [patient patientParser:jsonDict];
        NSLog(@"%@", jsonDict);
    }
}

@end
