//
//  DictToXML.m
//  FHIR
//
//  Created by Adam Sippel on 2013-03-11.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

#import "DictToXML.h"

@implementation DictToXML

@synthesize xmlString = _xmlString;
@synthesize currentResource = _currentResource;

- (void)generateXml:(NSObject *)xmlObject urlPath:(NSString *)urlString
{
    NSArray *singleObject = [[NSArray alloc] initWithObjects:xmlObject, nil];
    
    if ([xmlObject class] == [FHIRPatient class])
    {
        FHIRPatient *patient = [singleObject objectAtIndex:0];
        _currentResource = @"Patient";
        [self generateXmlStringFromFHIRResourceDictionary:[patient generateAndReturnResourceDictionary] urlPath:urlString];
    }
    else if ([xmlObject class] == [FHIROrganization class])
    {
        FHIROrganization *organization = [singleObject objectAtIndex:0];
        _currentResource = @"Organization";
        [self generateXmlStringFromFHIRResourceDictionary:[organization generateAndReturnResourceDictionary] urlPath:urlString];
    }
    else if ([xmlObject class] == [FHIRAdverseReaction class])
    {
        FHIRAdverseReaction *adReact = [singleObject objectAtIndex:0];
        _currentResource = @"AdverseReaction";
        [self generateXmlStringFromFHIRResourceDictionary:[adReact generateAndReturnResourceDictionary] urlPath:urlString];
    }
    else if ([xmlObject class] == [FHIRAlert class])
    {
        FHIRAlert *alertOBJ = [singleObject objectAtIndex:0];
        _currentResource = @"Alert";
        [self generateXmlStringFromFHIRResourceDictionary:[alertOBJ generateAndReturnResourceDictionary] urlPath:urlString];
    }
    else if ([xmlObject class] == [FHIRAllergyIntolerance class])
    {
        FHIRAllergyIntolerance *allergyIntoleranceOBJ = [singleObject objectAtIndex:0];
        _currentResource = @"AllergyIntolerance";
        [self generateXmlStringFromFHIRResourceDictionary:[allergyIntoleranceOBJ generateAndReturnResourceDictionary] urlPath:urlString];
    }
    else if ([xmlObject class] == [FHIRCarePlan class])
    {
        FHIRCarePlan *carePlanOBJ = [singleObject objectAtIndex:0];
        _currentResource = @"CarePlan";
        [self generateXmlStringFromFHIRResourceDictionary:[carePlanOBJ generateAndReturnResourceDictionary] urlPath:urlString];
    }
    else if ([xmlObject class] == [FHIRMedication class])
    {
        FHIRMedication *medicationOBJ = [singleObject objectAtIndex:0];
        _currentResource = @"Medication";
        [self generateXmlStringFromFHIRResourceDictionary:[medicationOBJ generateAndReturnResourceDictionary] urlPath:urlString];
    }
    else if ([xmlObject class] == [FHIRCoverage class])
    {
        FHIRCoverage *coverageOBJ = [singleObject objectAtIndex:0];
        _currentResource = @"Coverage";
        [self generateXmlStringFromFHIRResourceDictionary:[coverageOBJ generateAndReturnResourceDictionary] urlPath:urlString];
    }
    else if ([xmlObject class] == [FHIRMedicationAdministration class])
    {
        FHIRMedicationAdministration *medAdminOBJ = [singleObject objectAtIndex:0];
        _currentResource = @"MedicationAdministration";
        [self generateXmlStringFromFHIRResourceDictionary:[medAdminOBJ generateAndReturnResourceDictionary] urlPath:urlString];
    }
    else if ([xmlObject class] == [FHIRMedicationDispense class])
    {
        FHIRMedicationDispense *medDisOBJ = [singleObject objectAtIndex:0];
        _currentResource = @"MedicationDispense";
        [self generateXmlStringFromFHIRResourceDictionary:[medDisOBJ generateAndReturnResourceDictionary] urlPath:urlString];
    }
    else if ([xmlObject class] == [FHIRMedicationPrescription class])
    {
        FHIRMedicationPrescription *medPresOBJ = [singleObject objectAtIndex:0];
        _currentResource = @"MedicationPrescription";
        [self generateXmlStringFromFHIRResourceDictionary:[medPresOBJ generateAndReturnResourceDictionary] urlPath:urlString];
    }
    else if ([xmlObject class] == [FHIRMedicationStatement class])
    {
        FHIRMedicationStatement *medStateOBJ = [singleObject objectAtIndex:0];
        _currentResource = @"MedicationStatement";
        [self generateXmlStringFromFHIRResourceDictionary:[medStateOBJ generateAndReturnResourceDictionary] urlPath:urlString];
    }
    else
    {
        NSLog(@"NO OBJECT EXISTS FOR %@ IN THIS LIBRARY.", xmlObject);
    }
}

- (void)generateXmlStringFromFHIRResourceDictionary:(FHIRResourceDictionary *)xml urlPath:(NSString *)urlString
{
    XMLWriter *xmlWriter = [[XMLWriter alloc] init];
    _xmlString = [xmlWriter stringForXMLDictionary:xml.dataForResource resourceType:_currentResource];
    [_xmlString writeToFile:urlString atomically:YES encoding:NSUTF8StringEncoding error:nil];
}

@end
