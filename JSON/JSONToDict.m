//
//  JSONToDict.m
//  FHIR
//
//  Created by Adam Sippel on 2013-02-19.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

#import "JSONToDict.h"

@implementation JSONToDict

- (NSObject *)convertJsonToDictionary:(NSString *)urlString
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
        NSObject *resourceAsObject = [self createLocalizedObject:jsonDictionary];
        return resourceAsObject;
    }
    else
    {
        NSLog(@"File does not exist at: %@", url);
        return nil;
    }
    
}

- (NSObject *)createLocalizedObject:(NSDictionary *)jsonDict
{
    if ([jsonDict objectForKey:@"Patient"])
    {
        FHIRPatient *patient = [[FHIRPatient alloc] init];
        [patient patientParser:jsonDict];
        return patient;
    }
    else if ([jsonDict objectForKey:@"Organization"])
    {
        FHIROrganization *organization = [[FHIROrganization alloc] init];
        [organization organizationParser:jsonDict];
        return organization;
        //NSLog(@"organizationJSON ************** %@", organization);
    }
    else if ([jsonDict objectForKey:@"AdverseReaction"])
    {
        FHIRAdverseReaction *adReact = [[FHIRAdverseReaction alloc] init];
        [adReact adverseReactionParser:jsonDict];
        return adReact;
        //NSLog(@"adverseReactionJSON ************** %@", adReact);
    }
    else if ([jsonDict objectForKey:@"Alert"])
    {
        FHIRAlert *alertOBJ = [[FHIRAlert alloc] init];
        [alertOBJ alertParser:jsonDict];
        return alertOBJ;
        //NSLog(@"alertJSON ************** %@", alertOBJ);
    }
    else if ([jsonDict objectForKey:@"AllergyIntolerance"])
    {
        FHIRAllergyIntolerance *allergyIntolleranceOBJ = [[FHIRAllergyIntolerance alloc] init];
        [allergyIntolleranceOBJ allergyIntoleranceParser:jsonDict];
        return allergyIntolleranceOBJ;
        //NSLog(@"allergyIntollerenceJSON ************** %@", allergyIntolleranceOBJ);
    }
    else if ([jsonDict objectForKey:@"CarePlan"])
    {
        FHIRCarePlan *carePlanOBJ = [[FHIRCarePlan alloc] init];
        [carePlanOBJ carePlanParser:jsonDict];
        return carePlanOBJ;
        //NSLog(@"carePlanJSON ************** %@", carePlanOBJ);
    }
    else if ([jsonDict objectForKey:@"Medication"])
    {
        FHIRMedication *medicationOBJ = [[FHIRMedication alloc] init];
        [medicationOBJ medicationParser:jsonDict];
        return medicationOBJ;
        //NSLog(@"medicationJSON ************** %@", medicationOBJ);
    }
    else if ([jsonDict objectForKey:@"Coverage"])
    {
        FHIRCoverage *coverageOBJ = [[FHIRCoverage alloc] init];
        [coverageOBJ coverageParser:jsonDict];
        return coverageOBJ;
        //NSLog(@"coverageJSON ************** %@", coverageOBJ);
    }
    else if ([jsonDict objectForKey:@"MedicationAdministration"])
    {
        FHIRMedicationAdministration *medAdminOBJ = [[FHIRMedicationAdministration alloc] init];
        [medAdminOBJ medicationAdministrationParser:jsonDict];
        return medAdminOBJ;
        //NSLog(@"medicationAdministrationJSON ************** %@", medAdminOBJ);
    }
    else
    {
        return nil;
    }
}

@end
