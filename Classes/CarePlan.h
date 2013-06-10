//
//  CarePlan.h
//  FHIR
//
//  Created by Adam Sippel on 2013-06-03.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

/**
 * Describes the intention of how one or more practitioners intend to deliver care for a particular patient for a period of time, possibly limited to care for a specific condition or set of conditions..
 */

#import <Foundation/Foundation.h>
#import "ExistanceChecker.h"
#import "Resource.h"
#import "Participant.h"
#import "Goal.h"
#import "Activity.h"

@interface CarePlan : Resource

@property (nonatomic, retain) FHIRResourceDictionary *carePlanDictionary; //a dictionary containing all resources in this carePlan object

//following properties are individual parts of the Care Plan Object that can be influenced Individually
@property (nonatomic, retain) Identifier *identifier; //Unique identifier by which the care plan is known in different business contexts.
@property (nonatomic, retain) Resource *patient; //Identifies the patient/subject whose intended care is described by the plan.
@property (nonatomic, retain) Code *status; //Indicates whether the plan is currently being acted upon, represents future intentions or is now just historical record.
@property (nonatomic, retain) Period *period; //Indicates when the plan did (or is intended to) come into effect and end.
@property (nonatomic, retain) NSDate *modified; //Identifies the most recent date on which the plan has been revised.
@property (nonatomic, retain) NSMutableArray *concern; //THIS ARRAY CONTAINS "Resource(Problem)" OBJECTS ONLY. Identifies the problems/concerns/diagnoses/etc. whose management and/or mitigation are handled by this plan.
@property (nonatomic, retain) FHIRString *notes; //General notes about the care plan not covered elsewhere.
@property (nonatomic, retain) NSMutableArray *participant; //THIS ARRAY CONTAINS "Participant" OBJECTS ONLY. Identifies all people and organizations who are expected to be involved in the care envisioned by this plan.
@property (nonatomic, retain) NSMutableArray *activity; //THIS ARRAY CONTAINS "Activity" OBJECTS ONLY. Identifies a planned action to occur as part of the plan. For example, a medication to be used, lab tests to perform, self-monitoring, education, etc.
@property (nonatomic, retain) NSMutableArray *goal; //THIS ARRAY CONTAINS "Goal" OBJECTS ONLY. Describes the intended objective(s) of carrying out the Care Plan.

//Public Methods
- (NSString *)getResourceType; //override method. Returns integer of specified type, in this case CarePlan
- (FHIRResourceDictionary *)generateAndReturnResourceDictionary; //returns a dictionary of all resources from carePlan in an NSdictionary format

- (void)carePlanParser:(NSDictionary *)dictionary; //parses incoming dictionaries back into an carePlan object

@end
