//
//  FHIRSubstitution.h
//  FHIR
//
//  Created by Adam Sippel on 2013-06-27.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

/**
 * Indicates whether or not substitution was made as part of the dispense. In some cases substitution will be expected but doesn't happen, in other cases substitution is not expected but does happen. This block explains what substitition did or did not happen and why.
 */

#import <Foundation/Foundation.h>
#import "FHIRCodeableConcept.h"

@interface FHIRSubstitution : FHIRType

@property (nonatomic, strong) FHIRResourceDictionary *substitutionDictionary; //dictionary of all substitution resources

//following properties are individual parts of the substitution Object that can be influenced Individually
@property (nonatomic, strong) FHIRCodeableConcept *type; //A code signifying whether a different drug was dispensed from what was prescribed.
@property (nonatomic, strong) NSMutableArray *reason; //THIS ARRAY CONTAINS "CodeableConcept" OBJECTS ONLY. Indicates the reason for the substitution of (or lack of substitution) from what was prescribed.
@property (nonatomic, strong) NSMutableArray *responsibleParty; //THIS ARRAY CONTAINS "ResourceReference(Practitioner)" OBJECTS ONLY. The person or organization that has primary responsibility for the substitution.

//Public Methods
- (NSDictionary *)generateAndReturnDictionary; //returns NSDictionary of substitution containing all it's elements
- (void)substitutionParser:(NSDictionary *)dictionary; //set substitution from an NSdictionary

@end
