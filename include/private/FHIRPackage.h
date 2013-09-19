//
//  Package.h
//  FHIR
//
//  Created by Adam Sippel on 2013-06-05.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

/**
 * Specifies Ingredient / Product / Package.
 */

#import <Foundation/Foundation.h>
#import "FHIRExistanceChecker.h"
#import "FHIRCodeableConcept.h"
#import "FHIRContent.h"

@interface FHIRPackage : FHIRElement

@property (nonatomic, retain) FHIRResourceDictionary *packageDictionary; //a dictionary containing all resources in this package object

//following properties are individual parts of the package Object that can be influenced Individually
@property (nonatomic, retain) FHIRCodeableConcept *container; //The kind of container that this package comes as.
@property (nonatomic, retain) NSMutableArray *content; //THIS ARRAY CONTAINS "Content" OBJECTS ONLY. A set of components that go to make up the described item.

//Public Methods
- (NSDictionary *)generateAndReturnDictionary; //returns an NSDictionary containing all the elements of this Package Object
- (void)packageParser:(NSDictionary *)dictionary; //set this package object from an NSdictionary

@end
