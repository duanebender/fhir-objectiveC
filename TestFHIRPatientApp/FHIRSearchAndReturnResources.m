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

+ (NSArray *)returnArrayOfPatientsSearched:(NSString *)urlStringOfSearch formatType:(NSString *)jsonOrXml
{
    if ([jsonOrXml isEqualToString:@"json"])
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
    else //xml
    {
        NSURL *url = [NSURL URLWithString:urlStringOfSearch];
        NSString *xmlString = [NSString stringWithContentsOfURL:url encoding:NSASCIIStringEncoding error:nil];
        bool foundAll =false;
        NSMutableArray *arrayOfXMLPatientStrings = [[NSMutableArray alloc] init];
        
        if (xmlString)
        {
            while (foundAll == false)
            {
                if ([xmlString rangeOfString:@"<content type=\"text/xml\">"].location != NSNotFound && [xmlString rangeOfString:@"</content>"].location != NSNotFound)
                {
                    //first grab string
                    NSRange range1 = [xmlString rangeOfString:@"<content type=\"text/xml\">"];
                    NSRange range2 = [xmlString rangeOfString:@"</content>"];
                    int lengt = range2.location - range1.location - range1.length;
                    int location = range1.location + range1.length;
                    NSRange contentContents;
                    contentContents.location = location;
                    contentContents.length = lengt;
                    NSString *xmlPatientString = [xmlString substringWithRange:contentContents];
                    [arrayOfXMLPatientStrings addObject:xmlPatientString];
                
                    //then substring to grab next one
                    NSRange stringEnd = NSMakeRange([xmlString length]-1, 1);
                    int lengt2 = stringEnd.location - range2.location - range2.length;
                    int location2 = range2.location + range2.length;
                    NSRange contentContents2;
                    contentContents2.location = location2;
                    contentContents2.length = lengt2;
                    xmlString = [xmlString substringWithRange:contentContents2];
                }
                else
                {
                    foundAll = true;
                }
            }
    
            //turn gathered XML Patient Strings into Patients
            NSMutableArray *arrayOfSearchedPatientResults = [[NSMutableArray alloc] init];
            for (int i = 0; i < [arrayOfXMLPatientStrings count]; i++)
            {
                NSString *currentPatient = [arrayOfXMLPatientStrings objectAtIndex:i];
                [currentPatient stringByTrimmingCharactersInSet:[NSCharacterSet newlineCharacterSet]];
                NSDictionary *xmlDictionary = [XMLReader dictionaryForXMLString:currentPatient error:nil];
                FHIRPatient *patient = [[FHIRPatient alloc] init];
                NSLog(@"PATIENT%d:%@",i,currentPatient);
                NSLog(@"XMLDICT:%@",xmlDictionary);
                [patient patientParser:xmlDictionary];
                [arrayOfSearchedPatientResults addObject:patient];
                NSLog(@"PATIENTXML:%@", [[patient generateAndReturnResourceDictionary] dataForResource]);
            }
            NSLog(@"PATIENTSXML:%@",arrayOfSearchedPatientResults);
            return arrayOfSearchedPatientResults;
        }
        else
        {
            NSLog(@"File does not exist at: %@", url);
            return nil;
        }
    }
    
}

+ (NSArray *)returnArrayOfPatientIDsSearched:(NSString *)urlStringOfSearch formatType:(NSString *)jsonOrXml
{
    if ([jsonOrXml isEqualToString:@"json"])
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
            //NSLog(@"ID's:%@",arrayOfSearchedPatientResults);
        
            return arrayOfSearchedPatientResults;
        }
        else
        {
            NSLog(@"File does not exist at: %@", url);
            return nil;
        }
    }
    else //xml string
    {
        NSURL *url = [NSURL URLWithString:urlStringOfSearch];
        NSString *xmlString = [NSString stringWithContentsOfURL:url encoding:NSASCIIStringEncoding error:nil];
        bool foundAll = false;
        bool first = true;
        NSMutableArray *arrayOfXMLIDStrings = [[NSMutableArray alloc] init];
        
        while (foundAll == false)
        {
            if ([xmlString rangeOfString:@"<id>"].location != NSNotFound)
            {
                //first grab string
                NSRange range1 = [xmlString rangeOfString:@"<id>"];
                NSRange range2 = [xmlString rangeOfString:@"</id>"];
                int lengt = range2.location - range1.location - range1.length;
                int location = range1.location + range1.length;
                NSRange contentContents;
                contentContents.location = location;
                contentContents.length = lengt;
                NSString *xmlIDString = [xmlString substringWithRange:contentContents];
                
                //take off first id as it is useless to history
                if (first)
                {
                    //do nothing with the ID
                    first = false;
                }
                else //useful ID
                {
                    [arrayOfXMLIDStrings addObject:xmlIDString];
                }
                
                
                //then substring to grab next one
                NSRange stringEnd = NSMakeRange([xmlString length]-1, 1);
                int lengt2 = stringEnd.location - range2.location - range2.length;
                int location2 = range2.location + range2.length;
                NSRange contentContents2;
                contentContents2.location = location2;
                contentContents2.length = lengt2;
                xmlString = [xmlString substringWithRange:contentContents2];
            }
            else
            {
                foundAll = true;
            }
        }
        
        //turn gathered XML ID Strings into just the ID's
        NSMutableArray *arrayOfSearchedIDResults = [[NSMutableArray alloc] init];
        for (int i = 0; i < [arrayOfXMLIDStrings count]; i++)
        {
            NSString *currentID = [arrayOfXMLIDStrings objectAtIndex:i];
            NSArray *stringSeperatedArray = [currentID componentsSeparatedByCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"@"]];
            
            if ([stringSeperatedArray count] != 0)
            {
                [arrayOfSearchedIDResults addObject:[stringSeperatedArray lastObject]];
            }
            else
            {
                [arrayOfSearchedIDResults addObject:[NSString stringWithFormat:@"id%d",i]];
            }
        }
        NSLog(@"PATIENTSXML:%@",arrayOfSearchedIDResults);
        return arrayOfSearchedIDResults;
    }
}

+ (NSArray *)returnArrayOfCurrentPatientHistory:(NSString *)urlStringOfSearch
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
            NSArray *linkArray = [[NSArray alloc] initWithArray:[currentDict objectForKey:@"link"]];
            NSDictionary *linkDict = [[NSDictionary alloc] initWithDictionary:[linkArray objectAtIndex:0]];
            NSString *currentHistoryLink = [[NSString alloc] initWithString:[linkDict objectForKey:@"href"]];
            
            [arrayOfSearchedPatientResults addObject:currentHistoryLink];
            
        }
        
        return arrayOfSearchedPatientResults;
    }
    else
    {
        NSLog(@"File does not exist at: %@", url);
        return nil;
    }
}

@end
