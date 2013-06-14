//
//  Participant.m
//  FHIR
//
//  Created by Adam Sippel on 2013-06-03.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

#import "FHIRParticipant.h"

@implementation FHIRParticipant

@synthesize participantDictionary = _participantDictionary; //holds all participant resources
@synthesize role = _role; //Indicates specific responsibility of an individual within the care plan. E.g. "Primary physician", "Team coordinator", "Caregiver", etc.
@synthesize member = _member; //The specific person or organization who is participating/expected to participate in the care plan. (Practitioner|RelatedPerson|Patient|Organization)

- (id)init
{
    self = [super init];
    if (self) {
        _participantDictionary = [[FHIRResourceDictionary alloc] init];
        _role = [[FHIRCodeableConcept alloc] init];
        _member = [[FHIRResource alloc] init];
    }
    return self;
}

- (NSDictionary *)generateAndReturnDictionary
{
    _participantDictionary.dataForResource = [NSDictionary dictionaryWithObjectsAndKeys:
                                           [_role generateAndReturnDictionary], @"role",
                                           [_member generateAndReturnDictionary], @"exposureType",
                                           nil];
    _participantDictionary.resourceName = @"Participant";
    [_participantDictionary cleanUpDictionaryValues];
    return _participantDictionary.dataForResource;
}

- (void)participantParser:(NSDictionary *)dictionary
{
    [_role codeableConceptParser:[dictionary objectForKey:@"role"]];
    [_member resourceParser:[dictionary objectForKey:@"member"]];
}

@end
