//
//  Activity.h
//  FHIR
//
//  Created by Adam Sippel on 2013-06-03.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

/**
 * Identifies a planned action to occur as part of the plan. For example, a medication to be used, lab tests to perform, self-monitoring, education, etc.
 */

#import <Foundation/Foundation.h>
#import "FHIRExistanceChecker.h"
#import "FHIRResource.h"
#import "FHIRCodeableConcept.h"
#import "FHIRSchedule.h"
#import "FHIRQuantity.h"

@interface FHIRActivity : FHIRElement

@property (nonatomic, retain) FHIRResourceDictionary *activityDictionary; //a dictionary containing all resources in this activity object

//following properties are individual parts of the Activity Object that can be influenced Individually
@property (nonatomic) FHIRCode *category; //High-level categorization of the type of activity in a care plan.
@property (nonatomic, retain) FHIRCodeableConcept *code; //Detailed description of the type of activity. E.g. What lab test, what procedure, what kind of visit.
@property (nonatomic, retain) FHIRCode *status; //Identifies what progress is being made for the specific activity.
@property (nonatomic, retain) FHIRBool *prohibited; //If true, indicates that the described activity is one that must NOT be engaged in when following the plan.
@property (nonatomic, retain) NSArray *timingX; //The period, timing or frequency upon which the described activity is to occur.(Schedule/Period/String object)
@property (nonatomic, retain) FHIRResourceReference *location; //Identifies the facility where the activity will occur. E.g. home, hospital, specific clinic, etc. (Locaton)
@property (nonatomic, retain) NSMutableArray *performer; //THIS ARRAY CONATINS "Resource(Practitioner|Organization|Related|Person|Patient)" OBJECTS ONLY. Identifies who's expected to be involved in the activity.
@property (nonatomic, retain) FHIRResourceReference *product; //Identifies the food, drug or other product being consumed or supplied in the activity.
@property (nonatomic, retain) FHIRQuantity *dailyAmount; //Identifies the quantity expected to be consumed in a given day.
@property (nonatomic, retain) FHIRQuantity *quantity; //Identifies the quantity expected to be supplied.
@property (nonatomic, retain) FHIRString *details; //This provides a textual description of constraints on the activity occurrence, including relation to other activities. It may also include objectives, pre-conditions and end-conditions. Finally, it may convey specifics about the activity such as body site, method, route, etc.
@property (nonatomic, retain) NSMutableArray *actionTaken; //THIS ARRAY CONTAINS "Resource(Any)" OBJECTS ONLY. Resources that describe follow-on actions resulting from the plan, such as drug prescriptions, visit records, appointments, etc.
@property (nonatomic, retain) FHIRString *notes; //Notes about the execution of the activity.

//Public Methods
- (NSDictionary *)generateAndReturnDictionary; //returns an NSDictionary containing all the elements of this Activity Object
- (void)activityParser:(NSDictionary *)dictionary; //set this activity object from an NSdictionary

@end
