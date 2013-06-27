//
//  Coverage.h
//  FHIR
//
//  Created by Adam Sippel on 2013-06-05.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

/**
 * Financial instrument by which payment information for health care.
 */

#import <Foundation/Foundation.h>
#import "FHIRExistanceChecker.h"
#import "FHIRResource.h"
#import "FHIRCoding.h"
#import "FHIRSubscriber.h"

@interface FHIRCoverage : FHIRResource

@property (nonatomic, retain) FHIRResourceDictionary *coverageDictionary; //a dictionary containing all resources in this coverage object
@property (nonatomic, retain) FHIRResource *resourceTypeValue; //holds resource type, text, name, and extensions of this resource

//following properties are individual parts of the Coverage Object that can be influenced Individually
@property (nonatomic, retain) FHIRResourceReference *issuer; //The program or plan underwriter or payor.
@property (nonatomic, retain) FHIRPeriod *period; //Time period during which the coverage is in force. A missing start date indicates the start date isn't known, a missing end date means the coverage is continuing to be in force.
@property (nonatomic, retain) FHIRCoding *type; //The type of coverage: social program, medical plan, accident coverage (workers compensation, auto), group health.
@property (nonatomic, retain) FHIRIdentifier *identifier; //The main (and possibly only) identifier for the coverage - often referred to as a Subscriber Id, Certificate number or Personal Health Number or Case ID.
@property (nonatomic, retain) FHIRIdentifier *group; //Todo.
@property (nonatomic, retain) FHIRIdentifier *plan; //Identifies a style or collective of coverage issues by the underwriter, for example may be used to identify a class of coverage or employer group. May also be referred to as a Policy or Group ID.
@property (nonatomic, retain) FHIRIdentifier *subplan; //Identifies a sub-style or sub-collective of coverage issues by the underwriter, for example may be used to identify a specific employer group within a class of employers. May be referred to as a Section or Division ID.
@property (nonatomic, retain) NSNumber *dependent; //A unique identifier for a dependent under the coverage.
@property (nonatomic, retain) NSNumber *sequence; //An optional counter for a particular instance of the identified coverage which increments upon each renewal.
@property (nonatomic, retain) FHIRSubscriber *subscriber; //Planholder information.

//Public Methods
- (NSString *)getResourceType; //override method. Returns integer of specified type, in this case Coverage
- (FHIRResourceDictionary *)generateAndReturnResourceDictionary; //returns a dictionary of all resources from coverage in an NSdictionary format

- (void)coverageParser:(NSDictionary *)dictionary; //parses incoming dictionaries back into an coverage object

@end
