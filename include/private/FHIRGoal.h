//
//  Goal.h
//  FHIR
//
//  Created by Adam Sippel on 2013-06-03.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

/**
* Describes the intended objective(s) of carrying out the Care Plan.
*/

#import <Foundation/Foundation.h>
#import "FHIRExistanceChecker.h"

@interface FHIRGoal : FHIRElement

@property (nonatomic, retain) FHIRResourceDictionary *goalDictionary; //holds all goal resources

//following properties are individual parts of the Goal Object that can be influenced Individually
@property (nonatomic, retain) FHIRString *description; //Human readable description of a specific desired objective of the care plan.
@property (nonatomic, retain) FHIRCode *status; //Indicates whether the goal has been reached and is still considered relevant.
@property (nonatomic, retain) FHIRString *notes; //Any comments related to the goal.

//Public Methods
- (NSDictionary *)generateAndReturnDictionary; //returns an NSDictionary containing all the elements of this Goal Object
- (void)goalParser:(NSDictionary *)dictionary; //set this goal object from an NSdictionary

@end
