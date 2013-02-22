//
//  Resource.h
//  FHIR
//
//  Created by Adam Sippel on 2013-01-29.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Narrative.h"
#import "ResourceType.h"

@interface Resource : Element

@property (nonatomic, retain) FHIRResourceDictionary *resourceDictionary;

@property (nonatomic, retain) NSMutableArray *extensions; //an array of extension objects
@property (nonatomic, retain) Narrative *text; //contents of resource
@property (nonatomic) NSInteger resourceType; //type designation of resource

- (void)setResouceTypeValue:(NSString *)codeString; //set the type of resource being used

- (NSDictionary *)generateAndReturnResourceDictionary; //returns all resources for resource ready to be formatted
- (void)resourceParser:(NSDictionary *)dictionary; //set resource from dictionary

@end
