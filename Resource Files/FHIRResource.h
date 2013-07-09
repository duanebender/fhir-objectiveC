//
//  Resource.h
//  FHIR
//
//  Created by Adam Sippel on 2013-01-29.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

/**
 * The defining element of any resource
 */

#import <Foundation/Foundation.h>
#import "FHIRNarrative.h"
#import "FHIRResourceType.h"
#import "FHIRExtension.h"

@interface FHIRResource : FHIRElement

@property (nonatomic, retain) FHIRResourceDictionary *resourceDictionary; //dictionary of all resource elements

//following properties are individual parts of the Resource Object that can be influenced Individually
@property (nonatomic, retain) NSMutableArray *extensions; //an array of extension objects
@property (nonatomic, retain) FHIRNarrative *text; //contents of resource
@property (nonatomic) NSInteger resourceType; //type designation of resource
@property (nonatomic, strong) NSMutableArray *contained; //extra contents inside the resource

//Public Methods
- (void)setResouceTypeValue:(NSString *)codeString; //set the type of resource being used
- (NSString *)returnResourceType; //returns resource type as a string

//Old Methods that can still be used with NSDictionary of Resource
//- (void)generateAndReturnDictionary; //returns an NSDicitonary containing all elements of this Resource Object
- (void)resourceParser:(NSDictionary *)dictionary; //set this resource object from an NSdictionary

@end
