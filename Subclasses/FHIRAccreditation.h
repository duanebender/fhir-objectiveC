//
//  FHIRAccreditation.h
//  FHIR
//
//  Created by Adam Sippel on 2013-06-17.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

/**
 * The qualifications/certifications an organization has, including format educational achievements, accreditations and current certifications. All these qualifications may be used to determine what roles the organization may play in a healthcare environment.
 */

#import "FHIR.h"

@interface FHIRAccreditation : FHIRType

@property (nonatomic, strong) FHIRResourceDictionary *accreditationDictionary; //dictionary of all accreditation resources

//following properties are individual parts of the accreditation Object that can be influenced Individually
@property (nonatomic, strong) FHIRIdentifier *identifier; //The identifier of the accreditation.
@property (nonatomic, strong) FHIRCodeableConcept *code; //The type of the accreditation.
@property (nonatomic, strong) FHIRResourceReference *issuer; //The organization that conferred/confers the accreditation.
@property (nonatomic, strong) FHIRPeriod *period; //The period for which the accreditation is held.

//Public Methods
- (NSDictionary *)generateAndReturnDictionary; //returns NSDictionary of accreditation containing all it's elements
- (void)accreditationParser:(NSDictionary *)dictionary; //set accreditation from an NSdictionary

@end
