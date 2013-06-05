//
//  Content.h
//  FHIR
//
//  Created by Adam Sippel on 2013-06-05.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

/**
 * A set of components that go to make up the described item.
 */

#import <Foundation/Foundation.h>
#import "ExistanceChecker.h"
#import "Resource.h"
#import "Quantity.h"

@interface Content : Element

@property (nonatomic, retain) FHIRResourceDictionary *contentDictionary; //a dictionary containing all resources in this content object

//following properties are individual parts of the content Object that can be influenced Individually
@property (nonatomic, retain) Resource *item; //The product that is in the package. (Medication)
@property (nonatomic, retain) Quantity *amount; //The amount of the product that is in the package.

//Public Methods
- (NSDictionary *)generateAndReturnDictionary; //returns an NSDictionary containing all the elements of this Content Object
- (void)contentParser:(NSDictionary *)dictionary; //set this content object from an NSdictionary

@end
