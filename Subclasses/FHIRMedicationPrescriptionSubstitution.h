//
//  FHIRMedicationPrescriptionSubstitution.h
//  FHIR
//
//  Created by Adam Sippel on 2013-06-28.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

/**
 * Indicates whether or not substitution can or should as part of the dispense. In some cases substitution must happen, in other cases substitution must not happen, and in others it does not matter. This block explains the prescribers intent. If nothing is specified substitution may be done.
 */

#import <Foundation/Foundation.h>
#import "FHIRCodeableConcept.h"

@interface FHIRMedicationPrescriptionSubstitution : FHIRType

@property (nonatomic, strong) FHIRResourceDictionary *medicationPrescriptionSubstitutionDictionary; //dictionary of all substitution resources

//following properties are individual parts of the substitution Object that can be influenced Individually
@property (nonatomic, strong) FHIRCodeableConcept *type; //A code signifying whether a different drug should be dispensed from what was prescribed.
@property (nonatomic, strong) FHIRCodeableConcept *reason; //Indicates the reason for the substitution why substitution must or must not be performed.

//Public Methods
- (NSDictionary *)generateAndReturnDictionary; //returns NSDictionary of substitution containing all it's elements
- (void)substitutionParser:(NSDictionary *)dictionary; //set substitution from an NSdictionary

@end
