//
//  ResourceReference.h
//  FHIR
//
//  Created by Adam Sippel on 2013-01-29.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Uri.h"
#import "Code.h"
#import "String.h"

//A reference from one resource to another

@interface ResourceReference : Type

@property (nonatomic, retain) FHIRResourceDictionary *resourceReferenceDictionary; //holds all resources in this entity in dictionary format

@property (nonatomic, retain) Code *type; //The name of one of the resource types defined in this specification to identify the type of the resource being referenced
@property (nonatomic, retain) Uri *uriId; //A literal URL that resolves to the location of the resource. The URL may be relative or absolute. Relative Ids contain the logical id of the resource. This reference is version independent - it points to the latest version of this resource
@property (nonatomic, retain) Uri *version; //A literal URL that resolves to the location of a particular version of the resource. The URL may be relative or absolute. Relative Ids contain the logical version id of the resource.
@property (nonatomic, retain) String *display; //Plain text narrative that identifies the resource in addition to the resource reference

- (NSDictionary *)generateAndReturnResourceReferenceDictionary; //returns the dictionary of resources
- (void)resourceReferenceParser:(NSDictionary *)dictionary; //set resourcereference from dictionary

@end
