//
//  Resource.h
//  FHIR
//
//  Created by Adam Sippel on 2013-01-29.
//  Copyright (c) 2013 Mohawk College. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Element.h"
#import "Narrative.h"
#import "ResourceType.h"

@interface Resource : Element

@property (nonatomic, retain) NSArray *extensions; //an array of extension objects
@property (nonatomic, retain) Narrative *text; //contents of resource
@property (nonatomic) ResourceType *resourceType; //type designation of resource

@end
