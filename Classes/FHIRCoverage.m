//
//  Coverage.m
//  FHIR
//
//  Created by Adam Sippel on 2013-06-05.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

#import "FHIRCoverage.h"

@implementation FHIRCoverage

@synthesize coverageDictionary = _coverageDictionary; //a dictionary containing all resources in this coverage object
@synthesize resourceTypeValue = _resourceTypeValue;
@synthesize issuer = _issuer; //The program or plan underwriter or payor.
@synthesize period = _period; //Time period during which the coverage is in force. A missing start date indicates the start date isn't known, a missing end date means the coverage is continuing to be in force.
@synthesize type = _type; //The type of coverage: social program, medical plan, accident coverage (workers compensation, auto), group health.
@synthesize identifier = _identifier; //The main (and possibly only) identifier for the coverage - often referred to as a Subscriber Id, Certificate number or Personal Health Number or Case ID.
@synthesize group = _group; //Todo.
@synthesize plan = _plan; //Identifies a style or collective of coverage issues by the underwriter, for example may be used to identify a class of coverage or employer group. May also be referred to as a Policy or Group ID.
@synthesize subplan = _subplan; //Identifies a sub-style or sub-collective of coverage issues by the underwriter, for example may be used to identify a specific employer group within a class of employers. May be referred to as a Section or Division ID.
@synthesize dependent = _dependent; //A unique identifier for a dependent under the coverage.
@synthesize sequence = _sequence; //An optional counter for a particular instance of the identified coverage which increments upon each renewal.
@synthesize subscriber = _subscriber; //Planholder information.

- (id)init
{
    self = [super init];
    if (self) {
        _coverageDictionary = [[FHIRResourceDictionary alloc] init];
        _issuer = [[FHIRResourceReference alloc] init];
        _period = [[FHIRPeriod alloc] init];
        _type = [[FHIRCoding alloc] init];
        _identifier = [[FHIRIdentifier alloc] init];
        _group = [[FHIRIdentifier alloc] init];
        _plan = [[FHIRIdentifier alloc] init];
        _subplan = [[FHIRIdentifier alloc] init];
        _dependent = [[NSNumber alloc] init];
        _sequence = [[NSNumber alloc] init];
        _subscriber = [[FHIRSubscriber alloc] init];
    }
    return self;
}

//override method
- (NSString *)getResourceType
{
    return [_resourceTypeValue returnResourceType];
}

- (FHIRResourceDictionary *)generateAndReturnResourceDictionary
{
    _coverageDictionary.dataForResource = [NSDictionary dictionaryWithObjectsAndKeys:
                                             [_issuer generateAndReturnDictionary], @"issuer",
                                             [_period generateAndReturnDictionary], @"period",
                                             [_type generateAndReturnDictionary], @"type",
                                             [_identifier generateAndReturnDictionary], @"identifier",
                                             [_group generateAndReturnDictionary], @"group",
                                             [_plan generateAndReturnDictionary], @"plan",
                                             [_subplan generateAndReturnDictionary], @"subplan",
                                             [_dependent stringValue], @"dependent",
                                             [_sequence stringValue], @"sequence",
                                             [_subscriber generateAndReturnDictionary], @"subscriber",
                                             [_resourceTypeValue.text generateAndReturnDictionary], @"text",
                                             nil];
    [_coverageDictionary cleanUpDictionaryValues];
    
    FHIRResourceDictionary *returnable = [[FHIRResourceDictionary alloc] init];
    returnable.dataForResource = [NSDictionary dictionaryWithObjectsAndKeys:_coverageDictionary.dataForResource, @"Coverage", nil];
    returnable.resourceName = @"coverage";
    [returnable cleanUpDictionaryValues];
    return returnable;
}

- (void)coverageParser:(NSDictionary *)dictionary
{
    [_resourceTypeValue setResouceTypeValue:@"coverage"];
    NSDictionary *coverageDict = [dictionary objectForKey:@"Coverage"];
    //NSLog(@"%@", coverageDict);
    
    [_resourceTypeValue resourceParser:coverageDict];
    
    [_issuer resourceReferenceParser:[coverageDict objectForKey:@"issuer"]];
    [_period periodParser:[coverageDict objectForKey:@"period"]];
    [_type codingParser:[coverageDict objectForKey:@"type"]];
    [_identifier identifierParser:[coverageDict objectForKey:@"identifier"]];
    [_group identifierParser:[coverageDict objectForKey:@"group"]];
    [_plan identifierParser:[coverageDict objectForKey:@"plan"]];
    [_subplan identifierParser:[coverageDict objectForKey:@"subplan"]];
    _dependent = [NSNumber numberWithInteger:[[coverageDict objectForKey:@"dependent"] intValue]];
    _sequence = [NSNumber numberWithInteger:[[coverageDict objectForKey:@"sequence"] intValue]];
    [_subscriber subscriberParser:[coverageDict objectForKey:@"subscriber"]];
    
}

@end
