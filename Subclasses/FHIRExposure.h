//
//  Exposure.h
//  FHIR
//
//  Created by Adam Sippel on 2013-05-29.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

/**
 * An exposure to a substance that preceded a reaction occurrence.
 */

#import <Foundation/Foundation.h>
#import "FHIRExistanceChecker.h"
#import "FHIRResource.h"

@interface FHIRExposure : FHIRElement

@property (nonatomic, retain) FHIRResourceDictionary *exposureDictionary; //a dictionary containing all resources in this Symptom object

//following properties are individual parts of the Organization Object that can be influenced Individually
@property (nonatomic, retain) NSDate *exposureDate; //Date initially exposed.
@property (nonatomic, retain) FHIRCode *exposureType; //Drug Administration, Immunization, Coincidental
@property (nonatomic, retain) FHIRCode *causalityExpectation; //A statement of how confident that the recorder was that this exposure caused the reaction.
@property (nonatomic, retain) FHIRResourceReference *substance; //Substance(s) that is presumed to have caused the adverse reaction.

//Public Methods
- (NSDictionary *)generateAndReturnDictionary; //returns a dictionary of all resources from exposure in an NSdictionary format
- (void)exposureParser:(NSDictionary *)dictionary; //parses incoming dictionaries back into a exposure object

@end
