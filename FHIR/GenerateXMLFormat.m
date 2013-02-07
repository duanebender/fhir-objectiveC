//
//  GenerateXMLFormat.m
//  FHIR
//
//  Created by Adam Sippel on 2013-02-05.
//  Copyright (c) 2013 Adam Sippel. All rights reserved.
//
#warning - Under Development
/*

#import "GenerateXMLFormat.h"

@implementation GenerateXMLFormat

@synthesize finalPatientXMLString = _finalPatientXMLString;

- (void)generateXMLForPatient:(Patient *)patient
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docDir = [paths objectAtIndex: 0];
    NSString *xmlFile = [docDir stringByAppendingPathComponent: @"patient.xml"];
    
    //set up the string to be printed to file
    finalPatientXMLString = @"<Patient xmlns=http://hl7.org/fhir>";
    
    [finalPatientXMLString appendString:@"</Patient>"];
    
    //print xml string to the file
    [finalPatientXMLString writeToFile:xmlFile automatically:NO];
}

@end
 */
