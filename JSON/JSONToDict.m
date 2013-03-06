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

- (void)convertJsonToDictionary:(NSString *)urlString resourcetype:(NSString *)resourceType
{
    /*
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
     */
    NSURL *url = [NSURL URLWithString:urlString];
    NSString *jsonString = [NSString stringWithContentsOfURL:url encoding:NSASCIIStringEncoding error:nil]; //[documentsDirectory stringByAppendingPathComponent:[urlString stringByAppendingString:@".json"]];
    //BOOL fileExists = [[NSFileManager defaultManager] fileExistsAtPath:filePath];
    if (jsonString)
    {
                NSLog(@"Exists");
        NSData *fileContent = [[NSData alloc] initWithContentsOfURL:url];
        NSError *error;
        NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:fileContent options:kNilOptions error:&error];
        _incomingResourceType = resourceType;
        //NSLog(@"%@", jsonDictionary);
        [self createLocalizedObject:jsonDictionary];
    }
    else
    {
        NSLog(@"File does not exist at: %@", url);
    }
    
}

- (void)createLocalizedObject:(NSDictionary *)jsonDict
{
    if ([_incomingResourceType isEqual: @"Patient"])
    {
        Patient *patient = [[Patient alloc] init];
        [patient patientParser:jsonDict];
        NSLog(@"%@", jsonDict);
    }
}

@end
