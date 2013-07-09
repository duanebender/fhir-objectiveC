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
        FHIRPatient *patient = [[FHIRPatient alloc] init];
        [patient patientParser:xmlDict];
        return patient;
        //NSLog(@"patientXML ************** %@", patient);
    }
    else if ([xmlDict objectForKey:@"Organization"])
    {
        FHIROrganization *organization = [[FHIROrganization alloc] init];
        [organization organizationParser:xmlDict];
        return organization;
        //NSLog(@"organizationXML ************** %@", organization);
    }
    else if ([xmlDict objectForKey:@"AdverseReaction"])
    {
        FHIRAdverseReaction *adReact = [[FHIRAdverseReaction alloc] init];
        [adReact adverseReactionParser:xmlDict];
        return adReact;
        //NSLog(@"adverseReactionXML ************** %@", adReact);
    }
    else if ([xmlDict objectForKey:@"Alert"])
    {
        FHIRAlert *alertOBJ = [[FHIRAlert alloc] init];
        [alertOBJ alertParser:xmlDict];
        return alertOBJ;
        //NSLog(@"alertXML ************** %@", alertOBJ);
    }
    else if ([xmlDict objectForKey:@"AllergyIntolerance"])
    {
        FHIRAllergyIntolerance *allergyIntolleranceOBJ = [[FHIRAllergyIntolerance alloc] init];
        [allergyIntolleranceOBJ allergyIntoleranceParser:xmlDict];
        return allergyIntolleranceOBJ;
        //NSLog(@"allergyIntollerenceXML ************** %@", allergyIntoleranceOBJ);
    }
    else if ([xmlDict objectForKey:@"CarePlan"])
    {
        FHIRCarePlan *carePlanOBJ = [[FHIRCarePlan alloc] init];
        [carePlanOBJ carePlanParser:xmlDict];
        return carePlanOBJ;
        //NSLog(@"carePlanXML ************** %@", carePlanOBJ);
    }
    else if ([xmlDict objectForKey:@"Medication"])
    {
        FHIRMedication *medicationOBJ = [[FHIRMedication alloc] init];
        [medicationOBJ medicationParser:xmlDict];
        return medicationOBJ;
        //NSLog(@"medicationXML ************** %@", medicationOBJ);
    }
    else if ([xmlDict objectForKey:@"Coverage"])
    {
        FHIRCoverage *coverageOBJ = [[FHIRCoverage alloc] init];
        [coverageOBJ coverageParser:xmlDict];
        return coverageOBJ;
        //NSLog(@"coverageXML ************** %@", coverageOBJ);
    }
    else if ([xmlDict objectForKey:@"MedicationAdministration"])
    {
        FHIRMedicationAdministration *medAdminOBJ = [[FHIRMedicationAdministration alloc] init];
        [medAdminOBJ medicationAdministrationParser:xmlDict];
        return medAdminOBJ;
        //NSLog(@"medicationAdministrationXML ************** %@", medAdminOBJ);
    }
    else if ([xmlDict objectForKey:@"MedicationDispense"])
    {
        FHIRMedicationDispense *medDisOBJ = [[FHIRMedicationDispense alloc] init];
        [medDisOBJ medicationDispenseParser:xmlDict];
        return medDisOBJ;
        //NSLog(@"medicationDispenseXML ************** %@", medDisOBJ);
    }
    else if ([xmlDict objectForKey:@"MedicationPrescription"])
    {
        FHIRMedicationPrescription *medPresOBJ = [[FHIRMedicationPrescription alloc] init];
        [medPresOBJ medicationPrescriptionParser:xmlDict];
        return medPresOBJ;
        //NSLog(@"medicationPrescriptionXML ************** %@", medPresOBJ);
    }
    else if ([xmlDict objectForKey:@"MedicationStatement"])
    {
        FHIRMedicationStatement *medStateOBJ = [[FHIRMedicationStatement alloc] init];
        [medStateOBJ medicationStatementParser:xmlDict];
        return medStateOBJ;
        //NSLog(@"medicationStatementXML ************** %@", medStatementOBJ);
    }
    else
    {
        return nil;
    }
}

- (NSString *)stringByStrippingXMLHeader:(NSString *)xmlString
{
    NSRange r;
    if ((r = [xmlString rangeOfString:@"<?xml version='1.0' encoding='UTF-8'?>" options:NSRegularExpressionSearch]).location != NSNotFound) //(.*)<\?xml.*\?>
        xmlString = [xmlString stringByReplacingCharactersInRange:r withString:@""];
    return xmlString;
}

@end
