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

- (void)setResouceTypeValue:(NSString *)codeString
{
    if ([codeString caseInsensitiveCompare:@"provenance"]) self.resourceType = ResourceTypeProvenance;
    else if ([codeString caseInsensitiveCompare:@"device"]) self.resourceType = ResourceTypeDevice;
    else if ([codeString caseInsensitiveCompare:@"order"]) self.resourceType = ResourceTypeOrder;
    else if ([codeString caseInsensitiveCompare:@"organization"]) self.resourceType = ResourceTypeOrganization;
    else if ([codeString caseInsensitiveCompare:@"prescription"]) self.resourceType = ResourceTypePrescription;
    else if ([codeString caseInsensitiveCompare:@"group"]) self.resourceType = ResourceTypeGroup;
    else if ([codeString caseInsensitiveCompare:@"valueSet"]) self.resourceType = ResourceTypeValueSet;
    else if ([codeString caseInsensitiveCompare:@"coverage"]) self.resourceType = ResourceTypeCoverage;
    else if ([codeString caseInsensitiveCompare:@"test"]) self.resourceType = ResourceTypeTest;
    else if ([codeString caseInsensitiveCompare:@"medicationAdministration"]) self.resourceType = ResourceTypeMedicationAdministration;
    else if ([codeString caseInsensitiveCompare:@"securityEvent"]) self.resourceType = ResourceTypeSecurityEvent;
    else if ([codeString caseInsensitiveCompare:@"issueReport"]) self.resourceType = ResourceTypeIssueReport;
    else if ([codeString caseInsensitiveCompare:@"list"]) self.resourceType = ResourceTypeList;
    else if ([codeString caseInsensitiveCompare:@"labReport"]) self.resourceType = ResourceTypeLabReport;
    else if ([codeString caseInsensitiveCompare:@"conformance"]) self.resourceType = ResourceTypeConformance;
    else if ([codeString caseInsensitiveCompare:@"xdsEntry"]) self.resourceType = ResourceTypeXdsEntry;
    else if ([codeString caseInsensitiveCompare:@"document"]) self.resourceType = ResourceTypeDocument;
    else if ([codeString caseInsensitiveCompare:@"message"]) self.resourceType = ResourceTypeMessage;
    else if ([codeString caseInsensitiveCompare:@"profile"]) self.resourceType = ResourceTypeProfile;
    else if ([codeString caseInsensitiveCompare:@"observation"]) self.resourceType = ResourceTypeObservation;
    else if ([codeString caseInsensitiveCompare:@"immunization"]) self.resourceType = ResourceTypeImmunization;
    else if ([codeString caseInsensitiveCompare:@"problem"]) self.resourceType = ResourceTypeProblem;
    else if ([codeString caseInsensitiveCompare:@"orderResponse"]) self.resourceType = ResourceTypeOrderResponse;
    else if ([codeString caseInsensitiveCompare:@"patient"]) self.resourceType = ResourceTypePatient;
    else if ([codeString caseInsensitiveCompare:@"xdsEntry2"]) self.resourceType = ResourceTypeXdsEntry2;
    else if ([codeString caseInsensitiveCompare:@"provider"]) self.resourceType = ResourceTypeProvider;
    else if ([codeString caseInsensitiveCompare:@"xdsFolder"]) self.resourceType = ResourceTypeXdsFolder;
    else if ([codeString caseInsensitiveCompare:@"medication"]) self.resourceType = ResourceTypeMedication;
    else if ([codeString caseInsensitiveCompare:@"specimen"]) self.resourceType = ResourceTypeSpecimen;
    else if ([codeString caseInsensitiveCompare:@"food"]) self.resourceType = ResourceTypeFood;
    else if ([codeString caseInsensitiveCompare:@"location"]) self.resourceType = ResourceTypeLocation;
    else if ([codeString caseInsensitiveCompare:@"procedure"]) self.resourceType = ResourceTypeProcedure;
    else if ([codeString caseInsensitiveCompare:@"admission"]) self.resourceType = ResourceTypeAdmission;
    else if ([codeString caseInsensitiveCompare:@"substance"]) self.resourceType = ResourceTypeSubstance;
    else if ([codeString caseInsensitiveCompare:@"anatomicalLocation"]) self.resourceType = ResourceTypeAnatomicalLocation;
    else if ([codeString caseInsensitiveCompare:@"interestOfCare"]) self.resourceType = ResourceTypeInterestOfCare;
    else self.resourceType = 0;
}

- (NSString *)returnResourceType
{
    switch (self.resourceType) {
        case ResourceTypeProvenance:
            return @"provenance";
            break;
        case ResourceTypeDevice:
            return @"device";
            break;
        case ResourceTypeOrder:
            return @"order";
            break;
        case ResourceTypeOrganization:
            return @"organization";
            break;
        case ResourceTypePrescription:
            return @"prescription";
            break;
        case ResourceTypeGroup:
            return @"group";
            break;
        case ResourceTypeValueSet:
            return @"valueSet";
            break;
        case ResourceTypeCoverage:
            return @"coverage";
            break;
        case ResourceTypeTest:
            return @"test";
            break;
        case ResourceTypeMedicationAdministration:
            return @"medicationAdministration";
            break;
        case ResourceTypeSecurityEvent:
            return @"securityEvent";
            break;
        case ResourceTypeIssueReport:
            return @"issueReport";
            break;
        case ResourceTypeList:
            return @"list";
            break;
        case ResourceTypeLabReport:
            return @"labReport";
            break;
        case ResourceTypeConformance:
            return @"conformance";
            break;
        case ResourceTypeXdsEntry:
            return @"xdsEntry";
            break;
        case ResourceTypeDocument:
            return @"document";
            break;
        case ResourceTypeMessage:
            return @"message";
            break;
        case ResourceTypeProfile:
            return @"profile";
            break;
        case ResourceTypeObservation:
            return @"observation";
            break;
        case ResourceTypeImmunization:
            return @"immunization";
            break;
        case ResourceTypeProblem:
            return @"problem";
            break;
        case ResourceTypeOrderResponse:
            return @"orderResponse";
            break;
        case ResourceTypePatient:
            return @"patient";
            break;
        case ResourceTypeXdsEntry2:
            return @"xdsEntry2";
            break;
        case ResourceTypeProvider:
            return @"provider";
            break;
        case ResourceTypeXdsFolder:
            return @"xdsFolder";
            break;
        case ResourceTypeMedication:
            return @"medication";
            break;
        case ResourceTypeSpecimen:
            return @"specimen";
            break;
        case ResourceTypeFood:
            return @"food";
            break;
        case ResourceTypeLocation:
            return @"location";
            break;
        case ResourceTypeProcedure:
            return @"procedure";
            break;
        case ResourceTypeAdmission:
            return @"admission";
            break;
        case ResourceTypeSubstance:
            return @"substance";
            break;
        case ResourceTypeAnatomicalLocation:
            return @"anatomicalLocation";
            break;
        case ResourceTypeInterestOfCare:
            return @"interestOfCare";
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

- (void)extensionParser:(NSDictionary *)dictionary
{
    //_extensions
    NSArray *extArray = [[NSArray alloc] initWithArray:[dictionary objectForKey:@"extensions"]];
    _extensions = [[NSMutableArray alloc] init];
    for (int i = 0; i < [extArray count]; i++)
    {
        Extension *tempS1 = [[Extension alloc] init];
        [tempS1 extensionParser:[extArray objectAtIndex:i]];
        [_extensions addObject:tempS1];
        //NSLog(@"%@", _extensions);
    }
    
    [_text narrativeParser:[dictionary objectForKey:@"text"]];
    [self setResouceTypeValue:[dictionary objectForKey:@"type"]];
}

@end
