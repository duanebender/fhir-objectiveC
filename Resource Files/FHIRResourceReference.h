//
//  ResourceReference.h
//  FHIR
//
//  Created by Adam Sippel on 2013-01-29.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

/**
 * A reference from one resource to another
 */

#import <Foundation/Foundation.h>
#import "FHIRUri.h"
#import "FHIRCode.h"
#import "FHIRString.h"

@interface FHIRResourceReference : FHIRType

@property (nonatomic, retain) FHIRResourceDictionary *resourceReferenceDictionary; //holds all resources in this entity in dictionary format

//following properties are individual parts of the ResourceReference Object that can be influenced Individually
@property (nonatomic, retain) FHIRCode *type; //The name of one of the resource types defined in this specification to identify the type of the resource being referenced
@property (nonatomic, retain) FHIRUri *reference; //A literal URL that resolves to the location of the resource. The URL may be relative or absolute. Relative Ids contain the logical id of the resource. This reference is version independent - it points to the latest version of this resource
@property (nonatomic, retain) FHIRUri *version; //A literal URL that resolves to the location of a particular version of the resource. The URL may be relative or absolute. Relative Ids contain the logical version id of the resource.
@property (nonatomic, retain) FHIRString *display; //Plain text narrative that identifies the resource in addition to the resource reference

//Public Methods
- (NSDictionary *)generateAndReturnDictionary; //returns an NSDictionary containing all elements of this ResourceReference Object
- (void)resourceReferenceParser:(NSDictionary *)dictionary; //set this resourcereference object from an NSdictionary

@end
