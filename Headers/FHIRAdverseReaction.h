//
//  AdverseReaction.h
//  FHIR
//
//  Created by Adam Sippel on 2013-05-29.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

/**
 * Adverse Reaction resources are used to provide information about specific reactions to a substance. These are normally associated with an AllergyIntolerance resource, but can be reported on their own when no assumption of further reactions is being made, or when specific events are being described.
 */

#import <Foundation/Foundation.h>
#import "FHIRExistanceChecker.h"
#import "FHIRResource.h"
#import "FHIRSymptom.h"
#import "FHIRExposure.h"

@interface FHIRAdverseReaction : FHIRResource

@property (nonatomic, retain) FHIRResourceDictionary *adverseReactionDictionary; //a dictionary containing all resources in this adverse reaction object
@property (nonatomic, retain) FHIRResource *resourceTypeValue; //holds resource type, text, name, and extensions of this resource

//following properties are individual parts of the AdverseReaction Object that can be influenced Individually
@property (nonatomic, retain) NSDate *reactionDate; //contains the initial date of the reaction
@property (nonatomic, retain) FHIRResourceReference *subject; //The subject that the sensitivity is about. (Patient)
@property (nonatomic, retain) FHIRBool *didNotOccurFlag; //
@property (nonatomic, retain) FHIRResourceReference *recorder; //The person who recorded this reaction. (Patient/Practitioner)
@property (nonatomic, retain) NSMutableArray *symptom; //THIS ARRAY IS FILLED WITH "Symptom" OBJECTS ONLY. Symptoms related to the reaction
@property (nonatomic, retain) NSMutableArray *exposure; //THIS ARRAY IS FILLED WITH "Exposure" OBJECTS ONLY. Substance and exposure time to cause this reaction

//Public Methods
- (NSString *)getResourceType; //override method. Returns integer of specified type, in this case Adverse Reaction
- (FHIRResourceDictionary *)generateAndReturnResourceDictionary; //returns a dictionary of all resources from adverse reaction in an NSdictionary format

- (void)adverseReactionParser:(NSDictionary *)dictionary; //parses incoming dictionaries back into an adverse reaction object

@end
