//
//  Resource.m
//  FHIR
//
//  Created by Adam Sippel on 2013-01-29.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

#import "FHIRResource.h"
#import "FHIRExistanceChecker.h"

@implementation FHIRResource

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
        _text = [[FHIRNarrative alloc] init];
    }
    return self;
}

- (void)setResouceTypeValue:(NSString *)codeString
{
    if ([codeString isEqualToString:@"provenance"]) self.resourceType = ResourceTypeProvenance;
    else if ([codeString isEqualToString:@"device"]) self.resourceType = ResourceTypeDevice;
    else if ([codeString isEqualToString:@"order"]) self.resourceType = ResourceTypeOrder;
    else if ([codeString isEqualToString:@"organization"]) self.resourceType = ResourceTypeOrganization;
    else if ([codeString isEqualToString:@"prescription"]) self.resourceType = ResourceTypePrescription;
    else if ([codeString isEqualToString:@"group"]) self.resourceType = ResourceTypeGroup;
    else if ([codeString isEqualToString:@"valueSet"]) self.resourceType = ResourceTypeValueSet;
    else if ([codeString isEqualToString:@"coverage"]) self.resourceType = ResourceTypeCoverage;
    else if ([codeString isEqualToString:@"test"]) self.resourceType = ResourceTypeTest;
    else if ([codeString isEqualToString:@"medicationAdministration"]) self.resourceType = ResourceTypeMedicationAdministration;
    else if ([codeString isEqualToString:@"securityEvent"]) self.resourceType = ResourceTypeSecurityEvent;
    else if ([codeString isEqualToString:@"issueReport"]) self.resourceType = ResourceTypeIssueReport;
    else if ([codeString isEqualToString:@"list"]) self.resourceType = ResourceTypeList;
    else if ([codeString isEqualToString:@"labReport"]) self.resourceType = ResourceTypeLabReport;
    else if ([codeString isEqualToString:@"conformance"]) self.resourceType = ResourceTypeConformance;
    else if ([codeString isEqualToString:@"xdsEntry"]) self.resourceType = ResourceTypeXdsEntry;
    else if ([codeString isEqualToString:@"document"]) self.resourceType = ResourceTypeDocument;
    else if ([codeString isEqualToString:@"message"]) self.resourceType = ResourceTypeMessage;
    else if ([codeString isEqualToString:@"profile"]) self.resourceType = ResourceTypeProfile;
    else if ([codeString isEqualToString:@"observation"]) self.resourceType = ResourceTypeObservation;
    else if ([codeString isEqualToString:@"immunization"]) self.resourceType = ResourceTypeImmunization;
    else if ([codeString isEqualToString:@"problem"]) self.resourceType = ResourceTypeProblem;
    else if ([codeString isEqualToString:@"orderResponse"]) self.resourceType = ResourceTypeOrderResponse;
    else if ([codeString isEqualToString:@"patient"]) self.resourceType = ResourceTypePatient;
    else if ([codeString isEqualToString:@"xdsEntry2"]) self.resourceType = ResourceTypeXdsEntry2;
    else if ([codeString isEqualToString:@"provider"]) self.resourceType = ResourceTypeProvider;
    else if ([codeString isEqualToString:@"xdsFolder"]) self.resourceType = ResourceTypeXdsFolder;
    else if ([codeString isEqualToString:@"medication"]) self.resourceType = ResourceTypeMedication;
    else if ([codeString isEqualToString:@"specimen"]) self.resourceType = ResourceTypeSpecimen;
    else if ([codeString isEqualToString:@"food"]) self.resourceType = ResourceTypeFood;
    else if ([codeString isEqualToString:@"location"]) self.resourceType = ResourceTypeLocation;
    else if ([codeString isEqualToString:@"procedure"]) self.resourceType = ResourceTypeProcedure;
    else if ([codeString isEqualToString:@"admission"]) self.resourceType = ResourceTypeAdmission;
    else if ([codeString isEqualToString:@"substance"]) self.resourceType = ResourceTypeSubstance;
    else if ([codeString isEqualToString:@"anatomicalLocation"]) self.resourceType = ResourceTypeAnatomicalLocation;
    else if ([codeString isEqualToString:@"interestOfCare"]) self.resourceType = ResourceTypeInterestOfCare;
    else if ([codeString isEqualToString:@"adverseReaction"])self.resourceType = ResourceTypeAdverseReaction;
    else if ([codeString isEqualToString:@"alert"])self.resourceType = ResourceTypeAlert;
    else if ([codeString isEqualToString:@"allergyIntollerance"])self.resourceType = ResourceTypeAllergyIntollerance;
    else if ([codeString isEqualToString:@"carePlan"])self.resourceType = ResourceTypeCarePlan;
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
        case ResourceTypeAdverseReaction:
            return @"adverseReaction";
            break;
        case ResourceTypeAlert:
            return @"alert";
            break;
        case ResourceTypeAllergyIntollerance:
            return @"allergyIntollerance";
            break;
        case ResourceTypeCarePlan:
            return @"carePlan";
            break;
            
        default:
            return @"?";
            break;
    }
    
}

- (NSDictionary *)generateAndReturnDictionary
{
    _resourceDictionary.dataForResource = [NSDictionary dictionaryWithObjectsAndKeys:
                                                    [FHIRExistanceChecker generateArray:_extensions], @"extensions",
                                                    [_text generateAndReturnDictionary], @"text",
                                                    [self returnResourceType], @"type",
                                                    nil];
    _resourceDictionary.resourceName = @"Resource";
    [_resourceDictionary cleanUpDictionaryValues];
    return _resourceDictionary.dataForResource;
}

- (void)resourceParser:(NSDictionary *)dictionary
{
    //_extensions
    NSArray *extArray = [[NSArray alloc] initWithArray:[dictionary objectForKey:@"extensions"]];
    _extensions = [[NSMutableArray alloc] init];
    for (int i = 0; i < [extArray count]; i++)
    {
        FHIRExtension *tempS1 = [[FHIRExtension alloc] init];
        [tempS1 extensionParser:[extArray objectAtIndex:i]];
        [_extensions addObject:tempS1];
        //NSLog(@"%@", _extensions);
    }
    
    [_text narrativeParser:[dictionary objectForKey:@"text"]];
    [self setResouceTypeValue:[dictionary objectForKey:@"type"]];
}

@end
