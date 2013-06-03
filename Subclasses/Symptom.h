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
#import "ExistanceChecker.h"
#import "CodeableConcept.h"

@interface Symptom : Element

@property (nonatomic, retain) FHIRResourceDictionary *symptomDictionary; //a dictionary containing all resources in this Symptom object

//following properties are individual parts of the Organization Object that can be influenced Individually
@property (nonatomic, retain) CodeableConcept *code; //the symptom and information about it.
@property (nonatomic, retain) Code *severity; //The severety of the symptom.

//Public Methods
- (NSDictionary *)generateAndReturnResourceDictionary; //returns a dictionary of all resources from symptom in an NSdictionary format
- (void)symptomParser:(NSDictionary *)dictionary; //parses incoming dictionaries back into a symptom object

@end
