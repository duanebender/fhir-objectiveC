//
//  FHIRSubstitution.m
//  FHIR
//
//  Created by Adam Sippel on 2013-06-27.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

#import "FHIRSubstitution.h"
#import "FHIRExistanceChecker.h"

@implementation FHIRSubstitution

@synthesize substitutionDictionary = _substitutionDictionary; //dictionary of all substitution resources
@synthesize type = _type; //A code signifying whether a different drug was dispensed from what was prescribed.
@synthesize reason = _reason; //THIS ARRAY CONTAINS "CodeableConcept" OBJECTS ONLY. Indicates the reason for the substitution of (or lack of substitution) from what was prescribed.
@synthesize responsibleParty = _responsibleParty; //THIS ARRAY CONTAINS "ResourceReference(Practitioner)" OBJECTS ONLY. The person or organization that has primary responsibility for the substitution.

- (id)init
{
    self = [super init];
    if (self) {
        _substitutionDictionary = [[FHIRResourceDictionary alloc] init];
        _type = [[FHIRCodeableConcept alloc] init];
        _reason = [[NSMutableArray alloc] init];
        _responsibleParty = [[NSMutableArray alloc] init];
    }
    return self;
}

- (NSDictionary *)generateAndReturnDictionary
{
    _substitutionDictionary.dataForResource = [NSDictionary dictionaryWithObjectsAndKeys:
                                         [_type generateAndReturnDictionary], @"type",
                                         [FHIRExistanceChecker generateArray:_reason], @"reason",
                                         [FHIRExistanceChecker generateArray:_responsibleParty], @"responsibleParty",
                                         nil];
    _substitutionDictionary.resourceName = @"Substitution";
    [_substitutionDictionary cleanUpDictionaryValues];
    return _substitutionDictionary.dataForResource;
}

- (void)substitutionParser:(NSDictionary *)dictionary
{
    [_type codeableConceptParser:[dictionary objectForKey:@"type"]];
    
    //_reason
    NSArray *reasonArray = [[NSArray alloc] initWithArray:[dictionary objectForKey:@"reason"]];
    _reason = [[NSMutableArray alloc] init];
    for (int i = 0; i < [reasonArray count]; i++)
    {
        FHIRCodeableConcept *tempCC = [[FHIRCodeableConcept alloc] init];
        [tempCC codeableConceptParser:[reasonArray objectAtIndex:i]];
        [_reason addObject:tempCC];
        //NSLog(@"%@", _reason);
    }
    
    //_responsibleParty
    NSArray *rePartyArray = [[NSArray alloc] initWithArray:[dictionary objectForKey:@"responsibleParty"]];
    _responsibleParty = [[NSMutableArray alloc] init];
    for (int i = 0; i < [rePartyArray count]; i++)
    {
        FHIRResourceReference *tempRR = [[FHIRResourceReference alloc] init];
        [tempRR resourceReferenceParser:[rePartyArray objectAtIndex:i]];
        [_responsibleParty addObject:tempRR];
        //NSLog(@"%@", _responsibleParty);
    }
    
}

@end
