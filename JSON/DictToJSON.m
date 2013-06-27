//
//  DictToJSON.m
//  FHIR
//
//  Created by Adam Sippel on 2013-02-13.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

#import "DictToJSON.h"

@implementation DictToJSON

@synthesize jsonString = _jsonString;

- (void)generateJson:(NSObject *)jsonObject urlPath:(NSString *)urlString
{
    NSArray *singleObject = [[NSArray alloc] initWithObjects:jsonObject, nil];
    
    if ([jsonObject class] == [FHIRPatient class])
    {
        FHIRPatient *patient = [singleObject objectAtIndex:0];
        [self generateJsonStringFromFHIRResourceDictionary:[patient generateAndReturnResourceDictionary] urlPath:urlString];
    }
    else if ([jsonObject class] == [FHIROrganization class])
    {
        FHIROrganization *organization = [singleObject objectAtIndex:0];
        [self generateJsonStringFromFHIRResourceDictionary:[organization generateAndReturnResourceDictionary] urlPath:urlString];
    }
    else if ([jsonObject class] == [FHIRAdverseReaction class])
    {
        FHIRAdverseReaction *adReact = [singleObject objectAtIndex:0];
        [self generateJsonStringFromFHIRResourceDictionary:[adReact generateAndReturnResourceDictionary] urlPath:urlString];
    }
    else if ([jsonObject class] == [FHIRAlert class])
    {
        FHIRAlert *alertOBJ = [singleObject objectAtIndex:0];
        [self generateJsonStringFromFHIRResourceDictionary:[alertOBJ generateAndReturnResourceDictionary] urlPath:urlString];
    }
    else if ([jsonObject class] == [FHIRAllergyIntolerance class])
    {
        FHIRAllergyIntolerance *allergyIntoleranceOBJ = [singleObject objectAtIndex:0];
        [self generateJsonStringFromFHIRResourceDictionary:[allergyIntoleranceOBJ generateAndReturnResourceDictionary] urlPath:urlString];
    }
    else if ([jsonObject class] == [FHIRCarePlan class])
    {
        FHIRCarePlan *carePlanOBJ = [singleObject objectAtIndex:0];
        [self generateJsonStringFromFHIRResourceDictionary:[carePlanOBJ generateAndReturnResourceDictionary] urlPath:urlString];
    }
    else if ([jsonObject class] == [FHIRMedication class])
    {
        FHIRMedication *medicationOBJ = [singleObject objectAtIndex:0];
        [self generateJsonStringFromFHIRResourceDictionary:[medicationOBJ generateAndReturnResourceDictionary] urlPath:urlString];
    }
    else if ([jsonObject class] == [FHIRCoverage class])
    {
        FHIRCoverage *coverageOBJ = [singleObject objectAtIndex:0];
        [self generateJsonStringFromFHIRResourceDictionary:[coverageOBJ generateAndReturnResourceDictionary] urlPath:urlString];
    }
    else if ([jsonObject class] == [FHIRMedicationAdministration class])
    {
        FHIRMedicationAdministration *medAdminOBJ = [singleObject objectAtIndex:0];
        [self generateJsonStringFromFHIRResourceDictionary:[medAdminOBJ generateAndReturnResourceDictionary] urlPath:urlString];
    }
    else if ([jsonObject class] == [FHIRMedicationAdministration class])
    {
        FHIRMedicationDispense *medDisOBJ = [singleObject objectAtIndex:0];
        [self generateJsonStringFromFHIRResourceDictionary:[medDisOBJ generateAndReturnResourceDictionary] urlPath:urlString];
    }
    else
    {
        NSLog(@"NO OBJECT EXISTS FOR %@ IN THIS LIBRARY.", jsonObject);
    }
}

- (void)generateJsonStringFromFHIRResourceDictionary:(FHIRResourceDictionary *)json urlPath:(NSString *)urlString
{
    NSData *encodedData = [NSJSONSerialization dataWithJSONObject:json.dataForResource options:NSJSONWritingPrettyPrinted error:nil];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    [fileManager createFileAtPath:urlString contents:encodedData attributes:nil];
}

@end
