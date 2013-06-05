//
//  Subscriber.h
//  FHIR
//
//  Created by Adam Sippel on 2013-06-05.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

/**
 * Planholder information.
 */

#import <Foundation/Foundation.h>
#import "ExistanceChecker.h"
#import "HumanName.h"
#import "Address.h"

@interface Subscriber : Element

@property (nonatomic, retain) FHIRResourceDictionary *subscriberDictionary; //a dictionary containing all resources in this subscriber object

//following properties are individual parts of the subscriber Object that can be influenced Individually
@property (nonatomic, retain) HumanName *name; //The name of the PolicyHolder.
@property (nonatomic, retain) Address *address; //The mailing address, typically home, of the PolicyHolder.
@property (nonatomic, retain) NSDate *date; //The date of birth of the PolicyHolder.

//Public Methods
- (NSDictionary *)generateAndReturnDictionary; //returns an NSDictionary containing all the elements of this subscriber Object
- (void)subscriberParser:(NSDictionary *)dictionary; //set this subscriber object from an NSdictionary

@end
