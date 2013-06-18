//
//  FHIRAccreditation.m
//  FHIR
//
//  Created by Adam Sippel on 2013-06-17.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

#import "FHIRAccreditation.h"

@implementation FHIRAccreditation

@synthesize accreditationDictionary = _accreditationDictionary; //dictionary of all accreditation resources
@synthesize identifier = _identifier; //The identifier of the accreditation.
@synthesize code =_code; //The type of the accreditation.
@synthesize issuer = _issuer; //The organization that conferred/confers the accreditation.
@synthesize period = _period; //The period for which the accreditation is held.

- (id)init
{
    self = [super init];
    if (self) {
        _accreditationDictionary = [[FHIRResourceDictionary alloc] init];
        _identifier = [[FHIRIdentifier alloc] init];
        _issuer = [[FHIRResourceReference alloc] init];
        _period = [[FHIRPeriod alloc] init];
    }
    return self;
}

- (NSDictionary *)generateAndReturnDictionary
{
    _accreditationDictionary.dataForResource = [NSDictionary dictionaryWithObjectsAndKeys:
                                                 [_identifier generateAndReturnDictionary], @"identifier",
                                                 [_issuer generateAndReturnDictionary], @"issuer",
                                                 [_period generateAndReturnDictionary], @"period",
                                                 nil];
    _accreditationDictionary.resourceName = @"Accreditation";
    [_accreditationDictionary cleanUpDictionaryValues];
    return _accreditationDictionary.dataForResource;
}

- (void)accreditationParser:(NSDictionary *)dictionary
{
    
    [_identifier identifierParser:[dictionary objectForKey:@"identifier"]];
    [_issuer resourceReferenceParser:[dictionary objectForKey:@"issuer"]];
    [_period periodParser:[dictionary objectForKey:@"period"]];
    
}

@end
