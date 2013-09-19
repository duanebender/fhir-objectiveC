//
//  FHIRDosage.h
//  FHIR
//
//  Created by Adam Sippel on 2013-06-27.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

/**
 * Indicates how the medication is to be used by the patient.
 */

#import "FHIR.h"

@interface FHIRDosage : FHIRType

@property (nonatomic, strong) FHIRResourceDictionary *dosageDictionary; //dictionary of all dosage resources

//following properties are individual parts of the dosage Object that can be influenced Individually
@property (nonatomic, strong) FHIRSchedule *timing; //The timing schedule for giving the medication to the patient. The Schedule data type allows many different expressions, for example. "Every 8 hours"; "Three times a day"; "1/2 an hour before breakfast for 10 days from 23-Dec 2011:"; "15 Oct 2013, 17 Oct 2013 and 1 Nov 2013"
@property (nonatomic, strong) FHIRCodeableConcept *site; //A coded specification of the anatomic site where the medication first enters the body
@property (nonatomic, strong) FHIRCodeableConcept *route; //A code specifying the route or physiological path of administration of a therapeutic agent into or onto a subject.
@property (nonatomic, strong) FHIRCodeableConcept *method; //A coded value indicating the method by which the medication is introduced into or onto the body. Most commonly used for injections. Examples: Slow Push; Deep IV. Terminologies used often pre-coordinate this term with the route and or form of administration.
@property (nonatomic, strong) FHIRQuantity *quantity; //The amount of the therapeutic or other substance given at one administration event.
@property (nonatomic, strong) FHIRRatio *rate; //Identifies the speed with which the substance is introduced into the subject. Typically the rate for an infusion. 200ml in 2 hours.
@property (nonatomic, strong) FHIRRatio *maxDosePerPeriod; //The maximum total quantity of a therapeutic substance that my be administered to a subject over the period of time. E.g. 1000mg in 24 hours.

//Public Methods
- (NSDictionary *)generateAndReturnDictionary; //returns NSDictionary of dosage containing all it's elements
- (void)dosageParser:(NSDictionary *)dictionary; //set dosage from an NSdictionary

@end
