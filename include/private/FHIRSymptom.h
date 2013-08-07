//
//  Symptom.h
//  FHIR
//
//  Created by Adam Sippel on 2013-05-29.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

/**
 * The signs and symptoms that were observed as part of the reaction.
 */

#import <Foundation/Foundation.h>
#import "FHIRExistanceChecker.h"
#import "FHIRCodeableConcept.h"

@interface FHIRSymptom : FHIRElement

@property (nonatomic, retain) FHIRResourceDictionary *symptomDictionary; //a dictionary containing all resources in this Symptom object

//following properties are individual parts of the Organization Object that can be influenced Individually
@property (nonatomic, retain) FHIRCodeableConcept *code; //the symptom and information about it.
@property (nonatomic, retain) FHIRCode *severity; //The severety of the symptom.

//Public Methods
- (NSDictionary *)generateAndReturnDictionary; //returns a dictionary of all resources from symptom in an NSdictionary format
- (void)symptomParser:(NSDictionary *)dictionary; //parses incoming dictionaries back into a symptom object

@end
