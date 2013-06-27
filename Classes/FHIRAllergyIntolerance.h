//
//  AllergyIntolerance.h
//  FHIR
//
//  Created by Adam Sippel on 2013-05-30.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FHIRExistanceChecker.h"
#import "FHIRResource.h"

@interface FHIRAllergyIntolerance : FHIRResource

@property (nonatomic, retain) FHIRResourceDictionary *allergyIntoleranceDictionary; //a dictionary containing all resources in this alleryIntolerance object
@property (nonatomic, retain) FHIRResource *resourceTypeValue; //holds resource type, text, name, and extensions of this resource

//following properties are individual parts of the Allery Intolerance Object that can be influenced Individually
@property (nonatomic, retain) FHIRIdentifier *identifier; //An external identifier for the sensitivity
@property (nonatomic, retain) FHIRCode *criticality; //Criticality of the sensitivity
@property (nonatomic, retain) FHIRCode *sensitivityType; //Type of the sensitivity
@property (nonatomic, retain) NSDate *recordedDate; //Date when the sensitivity was recorded
@property (nonatomic, retain) FHIRCode *status; //Suspected, Confirmed, Refuted, Resolved
@property (nonatomic, retain) FHIRResourceReference *subject; //Who the sensitivity is for (Patient)
@property (nonatomic, retain) FHIRResourceReference *recorder; //Who recorded the sensitivity (Practitioner/Patient)
@property (nonatomic, retain) FHIRResourceReference *substance; //The substance that causes the sensitivity (Substance)
@property (nonatomic, retain) NSMutableArray *reactions; //THIS ARRAY CONTAINS "Resource(AdverseReaction)" OBJECTS ONLY. Reactions associated with the sensitivity.
@property (nonatomic, retain) NSMutableArray *sensitivityTest; //THIS ARRAY CONTAINS "Resource(Observation)" OBJECTS ONLY. Observations that confirm or refute the sensitivity.

//Public Methods
- (NSString *)getResourceType; //override method. Returns integer of specified type, in this case AlleryIntolerance
- (FHIRResourceDictionary *)generateAndReturnResourceDictionary; //returns a dictionary of all resources from allergyIntolerance in an NSdictionary format

- (void)allergyIntoleranceParser:(NSDictionary *)dictionary; //parses incoming dictionaries back into an alleryIntolerance object

@end
