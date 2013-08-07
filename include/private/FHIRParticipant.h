//
//  Participant.h
//  FHIR
//
//  Created by Adam Sippel on 2013-06-03.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

/**
 * Identifies all people and organizations who are expected to be involved in the care envisioned by this plan.
 */

#import <Foundation/Foundation.h>
#import "FHIRExistanceChecker.h"
#import "FHIRResource.h"
#import "FHIRCodeableConcept.h"

@interface FHIRParticipant : FHIRElement

@property (nonatomic, retain) FHIRResourceDictionary *participantDictionary; //holds all participant resources

//following properties are individual parts of the Participant Object that can be influenced Individually
@property (nonatomic, retain) FHIRCodeableConcept *role; //Indicates specific responsibility of an individual within the care plan. E.g. "Primary physician", "Team coordinator", "Caregiver", etc.
@property (nonatomic, retain) FHIRResourceReference *member; //The specific person or organization who is participating/expected to participate in the care plan. (Practitioner|RelatedPerson|Patient|Organization)

//Public Methods
- (NSDictionary *)generateAndReturnDictionary; //returns an NSDictionary containing all the elements of this Participant Object
- (void)participantParser:(NSDictionary *)dictionary; //set this participant object from an NSdictionary

@end
