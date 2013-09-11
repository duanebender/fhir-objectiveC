//
//  FHIRSearchAndReturnResources.m
//  TestFHIRPatientApp
//
//  Created by Adam Sippel on 2013-08-12.
//  Copyright (c) 2013 Adam Sippel. All rights reserved.
//

#import "FHIRSearchAndReturnResources.h"
#import "FHIR.h"

@implementation FHIRSearchAndReturnResources

+ (NSArray *)returnArrayOfPatientsSearched:(NSString *)urlStringOfSearch
{
    NSURL *url = [NSURL URLWithString:urlStringOfSearch];
    NSString *jsonString = [NSString stringWithContentsOfURL:url encoding:NSASCIIStringEncoding error:nil];
    NSMutableArray *arrayOfSearchedPatientResults = [[NSMutableArray alloc] init];
    
    if (jsonString)
    {
        NSData *fileContent = [[NSData alloc] initWithContentsOfURL:url];
        NSError *error;
        NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:fileContent options:kNilOptions error:&error];
        
        NSArray *entryArray = [jsonDictionary objectForKey:@"entry"];
        
        for (int i = 0; i < [entryArray count]; i++)
        {
            NSDictionary *currentDict = [[NSDictionary alloc] initWithDictionary:[entryArray objectAtIndex:i]];
            FHIRPatient *currentPatient = [[FHIRPatient alloc] init];
            [currentPatient patientParser:[currentDict objectForKey:@"content"]];
            [arrayOfSearchedPatientResults addObject:currentPatient];
        }
        
        return arrayOfSearchedPatientResults;
    }
    else
    {
        NSLog(@"File does not exist at: %@", url);
        return nil;
    }
    
}

+ (NSArray *)returnArrayOfPatientIDsSearched:(NSString *)urlStringOfSearch
{
    NSURL *url = [NSURL URLWithString:urlStringOfSearch];
    NSString *jsonString = [NSString stringWithContentsOfURL:url encoding:NSASCIIStringEncoding error:nil];
    NSMutableArray *arrayOfSearchedPatientResults = [[NSMutableArray alloc] init];
    
    if (jsonString)
    {
        NSData *fileContent = [[NSData alloc] initWithContentsOfURL:url];
        NSError *error;
        NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:fileContent options:kNilOptions error:&error];
        
        NSArray *entryArray = [jsonDictionary objectForKey:@"entry"];
        
        for (int i = 0; i < [entryArray count]; i++)
        {
            NSDictionary *currentDict = [[NSDictionary alloc] initWithDictionary:[entryArray objectAtIndex:i]];
            NSString *currentID = [[NSString alloc] initWithString:[currentDict objectForKey:@"id"]];
        
            NSArray *stringSeperatedArray = [currentID componentsSeparatedByCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"@"]];
            
            if ([stringSeperatedArray count] != 0)
            {
                [arrayOfSearchedPatientResults addObject:[stringSeperatedArray lastObject]];
            }
            else
            {
                [arrayOfSearchedPatientResults addObject:[NSString stringWithFormat:@"id%d",i]];
            }
            
        }
        NSLog(@"ID's:%@",arrayOfSearchedPatientResults);
        
        return arrayOfSearchedPatientResults;
    }
    else
    {
        NSLog(@"File does not exist at: %@", url);
        return nil;
    }
}

@end
