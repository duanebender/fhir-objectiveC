//
//  JSONToDict.h
//  FHIR
//
//  Created by Adam Sippel on 2013-02-19.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

/**
 * A script to turn json files into their corrisponding FHIR Object
 */

#import <Foundation/Foundation.h>
#import "Patient.h"
#import "Organization.h"
#import "AdverseReaction.h"
#import "Alert.h"
#import "AllergyIntolerance.h"
#import "CarePlan.h"

@interface JSONToDict : NSObject

- (NSObject *)convertJsonToDictionary:(NSString *)urlString; //takes a json file and creates a corrisponding object (ex. Patient.json will make a Patient Object

@end
