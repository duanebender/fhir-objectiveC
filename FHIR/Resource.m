//
//  Resource.m
//  FHIR
//
//  Created by Adam Sippel on 2013-01-29.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

#import "Resource.h"

@implementation Resource

@synthesize resourceDictionary = _resourceDictionary;

@synthesize extensions = _extensions;
@synthesize text = _text;
@synthesize resourceType = _resourceType;

- (id)init
{
    self = [super init];
    if (self) {
        _resourceDictionary = [[FHIRResourceDictionary alloc] init];
        _extensions = [[NSMutableArray alloc] init];
        _text = [[Narrative alloc] init];
    }
    return self;
}

- (void)setResouceTypeValue:(NSInteger)resourceType
{
    self.resourceType = resourceType;
}

- (NSString *)returnResourceType
{
    switch (self.resourceType) {
        case ResourceTypeProvenance:
            return @"Proenance";
            break;
        case ResourceTypeDevice:
            return @"Device";
            break;
        case ResourceTypeOrder:
            return @"Order";
            break;
        case ResourceTypeOrganization:
            return @"Organization";
            break;
        case ResourceTypePrescription:
            return @"Prescription";
            break;
        case ResourceTypeGroup:
            return @"Group";
            break;
        case ResourceTypeValueSet:
            return @"ValueSet";
            break;
        case ResourceTypeCoverage:
            return @"Coverage";
            break;
        case ResourceTypeTest:
            return @"Test";
            break;
        case ResourceTypeMedicationAdministration:
            return @"MedicationAdministration";
            break;
        case ResourceTypeSecurityEvent:
            return @"SecurityEvent";
            break;
        case ResourceTypeIssueReport:
            return @"IssueReport";
            break;
        case ResourceTypeList:
            return @"List";
            break;
        case ResourceTypeLabReport:
            return @"LabReport";
            break;
        case ResourceTypeConformance:
            return @"Conformance";
            break;
        case ResourceTypeXdsEntry:
            return @"XdsEntry";
            break;
        case ResourceTypeDocument:
            return @"Document";
            break;
        case ResourceTypeMessage:
            return @"Message";
            break;
        case ResourceTypeProfile:
            return @"Profile";
            break;
        case ResourceTypeObservation:
            return @"Observation";
            break;
        case ResourceTypeImmunization:
            return @"Immunization";
            break;
        case ResourceTypeProblem:
            return @"Problem";
            break;
        case ResourceTypeOrderResponse:
            return @"OrderResponse";
            break;
        case ResourceTypePatient:
            return @"Patient";
            break;
        case ResourceTypeXdsEntry2:
            return @"XdsEntry2";
            break;
        case ResourceTypeProvider:
            return @"Provider";
            break;
        case ResourceTypeXdsFolder:
            return @"XdsFolder";
            break;
        case ResourceTypeMedication:
            return @"Medication";
            break;
        case ResourceTypeSpecimen:
            return @"Specimen";
            break;
        case ResourceTypeFood:
            return @"Food";
            break;
        case ResourceTypeLocation:
            return @"Location";
            break;
        case ResourceTypeProcedure:
            return @"Procedure";
            break;
        case ResourceTypeAdmission:
            return @"Admission";
            break;
        case ResourceTypeSubstance:
            return @"Substance";
            break;
        case ResourceTypeAnatomicalLocation:
            return @"AnatomicalLocation";
            break;
        case ResourceTypeInterestOfCare:
            return @"InterestOfCare";
            break;
            
        default:
            return @"?";
            break;
    }
    
}

- (NSDictionary *)generateAndReturnResourceDictionary
{
    _resourceDictionary.dataForResource = [NSDictionary dictionaryWithObjectsAndKeys:
                                                    _extensions, @"extensions",
                                                    [_text generateAndReturnNarrativeDictionary], @"text",
                                                    [self returnResourceType], @"type",
                                                    nil];
    _resourceDictionary.resourceName = @"Resource";
    return _resourceDictionary.dataForResource;
}

@end
