//
//  XMLToDict.m
//  FHIR
//
//  Created by Adam Sippel on 2013-03-04.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

#import "XMLToDict.h"

@implementation XMLToDict

- (NSObject *)convertXmlToDictionary:(NSString *)urlString
{
    NSURL *url = [NSURL URLWithString:urlString];
    NSString *xmlString = [NSString stringWithContentsOfURL:url encoding:NSASCIIStringEncoding error:nil];
    
    if (xmlString)
    {
        NSLog(@"Exists");
        NSError *error;
        xmlString = [self stringByStrippingXMLHeader:xmlString];
        
        NSDictionary *xmlDictionary = [XMLReader dictionaryForXMLString:xmlString error:error];
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
        //NSLog(@"patientXML ************** %@", patient);
    }
    else if ([xmlDict objectForKey:@"Organization"])
    {
        Organization *organization = [[Organization alloc] init];
        [organization organizationParser:xmlDict];
        return organization;
        //NSLog(@"organizationXML ************** %@", organization);
    }
    else if ([xmlDict objectForKey:@"AdverseReaction"])
    {
        AdverseReaction *adReact = [[AdverseReaction alloc] init];
        [adReact adverseReactionParser:xmlDict];
        return adReact;
        //NSLog(@"adverseReactionXML ************** %@", adReact);
    }
    else if ([xmlDict objectForKey:@"Alert"])
    {
        Alert *alertOBJ = [[Alert alloc] init];
        [alertOBJ alertParser:xmlDict];
        return alertOBJ;
        //NSLog(@"alertXML ************** %@", alertOBJ);
    }
    else if ([xmlDict objectForKey:@"AllergyIntolerance"])
    {
        AllergyIntolerance *allergyIntolleranceOBJ = [[AllergyIntolerance alloc] init];
        [allergyIntolleranceOBJ allergyIntoleranceParser:xmlDict];
        return allergyIntolleranceOBJ;
        //NSLog(@"alertXML ************** %@", allergyIntoleranceOBJ);
    }
    else if ([xmlDict objectForKey:@"CarePlan"])
    {
        CarePlan *carePlanOBJ = [[CarePlan alloc] init];
        [carePlanOBJ carePlanParser:xmlDict];
        return carePlanOBJ;
        //NSLog(@"alertXML ************** %@", carePlanOBJ);
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
